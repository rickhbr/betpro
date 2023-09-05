import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txtEmail widget.
  TextEditingController? txtEmailController;
  String? Function(BuildContext, String?)? txtEmailControllerValidator;
  // State field(s) for txtSenha widget.
  TextEditingController? txtSenhaController;
  late bool txtSenhaVisibility;
  String? Function(BuildContext, String?)? txtSenhaControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtSenhaVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    txtEmailController?.dispose();
    txtSenhaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
