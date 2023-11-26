import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'create_p_i_x_widget.dart' show CreatePIXWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreatePIXModel extends FlutterFlowModel<CreatePIXWidget> {
  ///  Local state fields for this page.

  String keyPIXUser = '';

  ///  State fields for stateful widgets in this page.

  // State field(s) for valuePIX widget.
  FocusNode? valuePIXFocusNode;
  TextEditingController? valuePIXController;
  String? Function(BuildContext, String?)? valuePIXControllerValidator;
  // State field(s) for message widget.
  FocusNode? messageFocusNode;
  TextEditingController? messageController;
  String? Function(BuildContext, String?)? messageControllerValidator;
  // State field(s) for textId widget.
  FocusNode? textIdFocusNode;
  TextEditingController? textIdController;
  String? Function(BuildContext, String?)? textIdControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    valuePIXFocusNode?.dispose();
    valuePIXController?.dispose();

    messageFocusNode?.dispose();
    messageController?.dispose();

    textIdFocusNode?.dispose();
    textIdController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
