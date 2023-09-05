import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MousefortuneModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String imgUrl = 'false';

  bool ativarBotao = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - randomImage] action in mousefortune widget.
  String? outImgActionPageLoad;
  // State field(s) for contador widget.
  int contadorMilliseconds = 30000;
  String contadorValue = StopWatchTimer.getDisplayTime(
    30000,
    hours: false,
    milliSecond: false,
  );
  StopWatchTimer contadorController =
      StopWatchTimer(mode: StopWatchMode.countDown);

  // Stores action output result for [Custom Action - randomImage] action in Button widget.
  String? outImage;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    contadorController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
