import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FootballModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<String> resultadoLocalState = [];
  void addToResultadoLocalState(String item) => resultadoLocalState.add(item);
  void removeFromResultadoLocalState(String item) =>
      resultadoLocalState.remove(item);
  void removeAtIndexFromResultadoLocalState(int index) =>
      resultadoLocalState.removeAt(index);
  void updateResultadoLocalStateAtIndex(int index, Function(String) updateFn) =>
      resultadoLocalState[index] = updateFn(resultadoLocalState[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Fut)] action in FOOTBALL widget.
  ApiCallResponse? apiResultFut;
  // Stores action output result for [Custom Action - actionSplit] action in FOOTBALL widget.
  List<String>? outResultList;
  // State field(s) for Timer widget.
  int timerMilliseconds = 10000;
  String timerValue = StopWatchTimer.getDisplayTime(
    10000,
    hours: false,
    milliSecond: false,
  );
  StopWatchTimer timerController =
      StopWatchTimer(mode: StopWatchMode.countDown);

  // Stores action output result for [Backend Call - API (Fut)] action in Timer widget.
  ApiCallResponse? callApiInstant;
  // Stores action output result for [Custom Action - actionSplit] action in Timer widget.
  List<String>? results;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    timerController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
