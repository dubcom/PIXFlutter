// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart'; // Imports custom actions

import 'package:timeago/timeago.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';

class ImputReal extends StatefulWidget {
  const ImputReal({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _ImputRealState createState() => _ImputRealState();
}

class _ImputRealState extends State<ImputReal> {
  late TextEditingController controller;

  @override
  //void set ImputValor(int _value),
  void initState() {
    controller = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  TextEditingController _Real = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        style: TextStyle(
          fontFamily: 'SF Pro Display',
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Color.fromRGBO(0, 0, 0, 1),
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          CentavosInputFormatter(moeda: true),
        ],
        keyboardType: TextInputType.number,
        controller: controller,
        onChanged: (name) {
          _Real.text = name;
          FFAppState().InputReal = _Real.text;
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromRGBO(255, 255, 255, 1),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                BorderSide(width: 1, color: Color.fromRGBO(228, 228, 228, 1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Color.fromRGBO(0, 0, 0, 1),
              width: 1,
            ),
          ),
          hintText: 'R\$ 0,00',
        ),
      ),
    );
  }
}
