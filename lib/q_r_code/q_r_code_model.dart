import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class QRCodeModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for pixValue widget.
  TextEditingController? pixValueController;
  final pixValueMask = MaskTextInputFormatter(mask: '##.##.####');
  String? Function(BuildContext, String?)? pixValueControllerValidator;
  // State field(s) for message widget.
  TextEditingController? messageController;
  String? Function(BuildContext, String?)? messageControllerValidator;
  // State field(s) for textId widget.
  TextEditingController? textIdController;
  String? Function(BuildContext, String?)? textIdControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    pixValueController?.dispose();
    messageController?.dispose();
    textIdController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
