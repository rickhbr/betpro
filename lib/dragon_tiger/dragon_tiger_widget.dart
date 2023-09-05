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
import 'dragon_tiger_model.dart';
export 'dragon_tiger_model.dart';

class DragonTigerWidget extends StatefulWidget {
  const DragonTigerWidget({
    Key? key,
    this.pNome,
  }) : super(key: key);

  final String? pNome;

  @override
  _DragonTigerWidgetState createState() => _DragonTigerWidgetState();
}

class _DragonTigerWidgetState extends State<DragonTigerWidget> {
  late DragonTigerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DragonTigerModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultljv = await HackeandoGroup.dragonTigerCall.call();
      if ((_model.apiResultljv?.succeeded ?? true)) {
        _model.outResultList = await actions.actionSplit(
          getJsonField(
            (_model.apiResultljv?.jsonBody ?? ''),
            r'''$.results''',
          ).toString().toString(),
        );
        setState(() {
          _model.resultadoLocalState =
              _model.outResultList!.toList().cast<String>();
        });
        _model.timerController.onExecute.add(StopWatchExecute.start);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'DragonTiger',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryText,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                widget.pNome!,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Arimo',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Histórico',
                            style: FlutterFlowTheme.of(context).titleMedium,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final lista = _model.resultadoLocalState
                              .map((e) => e)
                              .toList()
                              .take(3)
                              .toList();
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(lista.length, (listaIndex) {
                              final listaItem = lista[listaIndex];
                              return Material(
                                color: Colors.transparent,
                                elevation: 3.0,
                                shape: const CircleBorder(),
                                child: Container(
                                  width: 32.0,
                                  height: 32.0,
                                  decoration: BoxDecoration(
                                    color: valueOrDefault<Color>(
                                      () {
                                        if (listaItem == 'Yellow') {
                                          return Color(0xFFFFFF00);
                                        } else if (listaItem == 'Red') {
                                          return FlutterFlowTheme.of(context)
                                              .error;
                                        } else {
                                          return Color(0xFFFFFF00);
                                        }
                                      }(),
                                      Color(0xFF3AFF00),
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              );
                            }).divide(SizedBox(width: 10.0)),
                          );
                        },
                      ),
                    ),
                    FlutterFlowTimer(
                      initialTime: _model.timerMilliseconds,
                      getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                        value,
                        hours: false,
                        milliSecond: false,
                      ),
                      timer: _model.timerController,
                      onChanged: (value, displayTime, shouldUpdate) {
                        _model.timerMilliseconds = value;
                        _model.timerValue = displayTime;
                        if (shouldUpdate) setState(() {});
                      },
                      onEnded: () async {
                        _model.callApiInstant =
                            await HackeandoGroup.dragonTigerCall.call();
                        if ((_model.callApiInstant?.succeeded ?? true)) {
                          _model.results = await actions.actionSplit(
                            getJsonField(
                              (_model.callApiInstant?.jsonBody ?? ''),
                              r'''$.results''',
                            ).toString(),
                          );
                          setState(() {
                            _model.resultadoLocalState =
                                _model.results!.toList().cast<String>();
                          });
                          _model.timerController
                              .setPresetTime(mSec: 10000, add: false);
                          _model.timerController.onExecute
                              .add(StopWatchExecute.reset);
                        }
                        if (_model.timerMilliseconds == 10000) {
                          _model.timerController.onExecute
                              .add(StopWatchExecute.start);
                        }

                        setState(() {});
                      },
                      textAlign: TextAlign.start,
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Arimo',
                                color: Colors.black,
                              ),
                    ),
                    Text(
                      'Busque',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 3.0,
                        shape: const CircleBorder(),
                        child: Container(
                          width: 32.0,
                          height: 32.0,
                          decoration: BoxDecoration(
                            color: valueOrDefault<Color>(
                              _model.resultadoLocalState.length == 0
                                  ? FlutterFlowTheme.of(context)
                                      .secondaryBackground
                                  : valueOrDefault<Color>(
                                      () {
                                        if (valueOrDefault<bool>(
                                              valueOrDefault<bool>(
                                                    _model.resultadoLocalState
                                                            .first ==
                                                        getJsonField(
                                                          FFAppState()
                                                              .dragonTigerAppState,
                                                          r'''$.y''',
                                                        ),
                                                    true,
                                                  ) &&
                                                  valueOrDefault<bool>(
                                                    _model.resultadoLocalState[
                                                            1] ==
                                                        getJsonField(
                                                          FFAppState()
                                                              .dragonTigerAppState,
                                                          r'''$.y''',
                                                        ),
                                                    true,
                                                  ),
                                              true,
                                            ) ||
                                            valueOrDefault<bool>(
                                              valueOrDefault<bool>(
                                                    _model.resultadoLocalState
                                                            .first ==
                                                        getJsonField(
                                                          FFAppState()
                                                              .dragonTigerAppState,
                                                          r'''$.y''',
                                                        ),
                                                    true,
                                                  ) &&
                                                  valueOrDefault<bool>(
                                                    _model.resultadoLocalState[
                                                            1] ==
                                                        getJsonField(
                                                          FFAppState()
                                                              .dragonTigerAppState,
                                                          r'''$.r''',
                                                        ),
                                                    true,
                                                  ),
                                              true,
                                            )) {
                                          return Color(0xFFFFFF00);
                                        } else if (valueOrDefault<bool>(
                                              valueOrDefault<bool>(
                                                    _model.resultadoLocalState
                                                            .first ==
                                                        getJsonField(
                                                          FFAppState()
                                                              .dragonTigerAppState,
                                                          r'''$.r''',
                                                        ),
                                                    true,
                                                  ) &&
                                                  valueOrDefault<bool>(
                                                    _model.resultadoLocalState[
                                                            1] ==
                                                        getJsonField(
                                                          FFAppState()
                                                              .resultado,
                                                          r'''$.r''',
                                                        ),
                                                    true,
                                                  ),
                                              true,
                                            ) ||
                                            valueOrDefault<bool>(
                                              valueOrDefault<bool>(
                                                    _model.resultadoLocalState
                                                            .first ==
                                                        getJsonField(
                                                          FFAppState()
                                                              .dragonTigerAppState,
                                                          r'''$.r''',
                                                        ),
                                                    true,
                                                  ) &&
                                                  valueOrDefault<bool>(
                                                    _model.resultadoLocalState[
                                                            1] ==
                                                        getJsonField(
                                                          FFAppState()
                                                              .dragonTigerAppState,
                                                          r'''$.y''',
                                                        ),
                                                    true,
                                                  ),
                                              true,
                                            )) {
                                          return FlutterFlowTheme.of(context)
                                              .error;
                                        } else {
                                          return Color(0xFF3AFF00);
                                        }
                                      }(),
                                      Color(0xFF3AFF00),
                                    ),
                              FlutterFlowTheme.of(context).secondaryBackground,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: FlutterFlowWebView(
                        content:
                            'https://universo.bet/game/evolution-dragon-tiger',
                        bypass: false,
                        height: 599.0,
                        verticalScroll: false,
                        horizontalScroll: false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
