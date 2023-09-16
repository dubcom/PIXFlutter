import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class CreatePIXModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for valuePIX widget.
  TextEditingController? valuePIXController;
  final valuePIXMask = MaskTextInputFormatter(mask: '##.###,##');
  String? Function(BuildContext, String?)? valuePIXControllerValidator;
  // State field(s) for message widget.
  TextEditingController? messageController;
  String? Function(BuildContext, String?)? messageControllerValidator;
  // State field(s) for textId widget.
  TextEditingController? textIdController;
  String? Function(BuildContext, String?)? textIdControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PIXCreatedRecord? key;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    valuePIXController?.dispose();
    messageController?.dispose();
    textIdController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
