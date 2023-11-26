import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? generatePixPayload(
  String pixKey,
  String description,
  String merchantName,
  String txid,
  String? merchantCity,
  double amount,
) {
  String removeAccentsAndSpaces(String input) {
    // Remove acentos e caracteres de espaço usando regex
    return input
        .replaceAll(RegExp(r'[^\x00-\x7F]+'), '') // Remove acentos
        .replaceAll(RegExp(r'\s+'), ''); // Remove espaços em branco
  }

  // Aplica a função removeAccentsAndSpaces a cada string
  merchantName = removeAccentsAndSpaces(merchantName);
  txid = removeAccentsAndSpaces(txid);

  {
    String ID_PAYLOAD_FORMAT_INDICATOR = "00";
    String ID_MERCHANT_ACCOUNT_INFORMATION = "26";
    String ID_MERCHANT_ACCOUNT_INFORMATION_GUI = "00";
    String ID_MERCHANT_ACCOUNT_INFORMATION_KEY = "01";
    String ID_MERCHANT_ACCOUNT_INFORMATION_DESCRIPTION = "02";
    String ID_MERCHANT_CATEGORY_CODE = "52";
    String ID_TRANSACTION_CURRENCY = "53";
    String ID_TRANSACTION_AMOUNT = "54";
    String ID_COUNTRY_CODE = "58";
    String ID_MERCHANT_NAME = "59";
    String ID_MERCHANT_CITY = "60";
    String ID_ADDITIONAL_DATA_FIELD_TEMPLATE = "62";
    String ID_ADDITIONAL_DATA_FIELD_TEMPLATE_TXID = "05";
    String ID_CRC16 = "63";

    String _getValue(String id, String value) {
      String size = value.length.toString().padLeft(2, "0");
      return id + size + value;
    }

    String _getMechantAccountInfo(String descriptionValue) {
      String gui =
          _getValue(ID_MERCHANT_ACCOUNT_INFORMATION_GUI, "br.gov.bcb.pix");
      String key = _getValue(ID_MERCHANT_ACCOUNT_INFORMATION_KEY, pixKey);
      String description = _getValue(
          ID_MERCHANT_ACCOUNT_INFORMATION_DESCRIPTION, descriptionValue);

      return _getValue(
          ID_MERCHANT_ACCOUNT_INFORMATION, gui + key + description);
    }

    String _getAdditionalDataFieldTemplate(String txidValue) {
      String txid =
          _getValue(ID_ADDITIONAL_DATA_FIELD_TEMPLATE_TXID, txidValue);
      return _getValue(ID_ADDITIONAL_DATA_FIELD_TEMPLATE, txid);
    }

    String _getCRC16(String payload) {
      int ord(String str) {
        return str.codeUnitAt(0);
      }

      String dechex(int number) {
        if (number < 0) {
          number = 0xffffffff + number + 1;
        }
        return number.toRadixString(16).toUpperCase();
      }

      // ADICIONA DADOS GERAIS NO PAYLOAD
      payload = payload + ID_CRC16 + "04";

      // DADOS DEFINIDOS PELO BACEN
      int polinomio = 0x1021;
      int resultado = 0xffff;
      int length;

      // CHECKSUM
      if ((length = payload.length) > 0) {
        for (int offset = 0; offset < length; offset++) {
          resultado ^= ord(payload[offset]) << 8;
          for (int bitwise = 0; bitwise < 8; bitwise++) {
            if ((resultado <<= 1) & 0x10000 != 0) resultado ^= polinomio;
            resultado &= 0xffff;
          }
        }
      }

      // RETORNA CÓDIGO CRC16 DE 4 CARACTERES
      return ID_CRC16 + "04" + dechex(resultado);
    }

    String payload = _getValue(ID_PAYLOAD_FORMAT_INDICATOR, "01") +
        _getMechantAccountInfo(description) +
        _getValue(ID_MERCHANT_CATEGORY_CODE, "0000") +
        _getValue(ID_TRANSACTION_CURRENCY, "986") +
        _getValue(ID_TRANSACTION_AMOUNT, amount.toStringAsFixed(2)) +
        _getValue(ID_COUNTRY_CODE, "BR") +
        _getValue(ID_MERCHANT_NAME, merchantName) +
        _getValue(ID_MERCHANT_CITY, merchantCity!) +
        _getAdditionalDataFieldTemplate(txid);

    return payload + _getCRC16(payload);
  }
}

String? currencyCustomFunction(
  String? stringNumber,
  int? decimalDigits,
  String? locale,
) {
  {
    try {
      //Convert the input from String to Double
      stringNumber = stringNumber?.replaceAll(',', '.');
      if (stringNumber != null) {
        var number = double.parse(stringNumber);

        return NumberFormat.currency(
                //Parameters
                locale: locale,
                decimalDigits: decimalDigits)
            //Format
            .format(number);
      }

      //If something goes wrong, catch the error
    } catch (e) {
      //Print the error
      print(e);
      //And return '0' to avoid null
      return '0';
    }
  }
}
