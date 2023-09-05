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
import 'bacbo_model.dart';
export 'bacbo_model.dart';

class BacboWidget extends StatefulWidget {
  const BacboWidget({
    Key? key,
    this.pNome,
  }) : super(key: key);

  final String? pNome;

  @override
  _BacboWidgetState createState() => _BacboWidgetState();
}

class _BacboWidgetState extends State<BacboWidget> {
  late BacboModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BacboModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultljv = await HackeandoGroup.bacBoCall.call();
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
        title: 'BACBO',
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
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Histórico',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 16.0,
                                  ),
                            ),
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
                                  width: 20.0,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    color: valueOrDefault<Color>(
                                      () {
                                        if (listaItem == 'Banker') {
                                          return FlutterFlowTheme.of(context)
                                              .error;
                                        } else if (listaItem == 'Player') {
                                          return Color(0xFF11386F);
                                        } else {
                                          return Color(0xFFF29C1F);
                                        }
                                      }(),
                                      Color(0xFFF29C1F),
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [],
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
                            await HackeandoGroup.bacBoCall.call();
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
                          await Future.delayed(
                              const Duration(milliseconds: 20000));
                          setState(() {
                            _model.firstResulStringLocalState =
                                valueOrDefault<String>(
                              _model.resultadoLocalState.length == 0
                                  ? 'vazio'
                                  : valueOrDefault<String>(
                                      () {
                                        if ((valueOrDefault<bool>(
                                                  _model.resultadoLocalState
                                                          .first ==
                                                      getJsonField(
                                                        FFAppState().resultado,
                                                        r'''$.p''',
                                                      ),
                                                  false,
                                                ) &&
                                                valueOrDefault<bool>(
                                                  _model.resultadoLocalState[
                                                          1] ==
                                                      getJsonField(
                                                        FFAppState().resultado,
                                                        r'''$.p''',
                                                      ),
                                                  false,
                                                )) ||
                                            (valueOrDefault<bool>(
                                                  _model.resultadoLocalState
                                                          .first ==
                                                      getJsonField(
                                                        FFAppState().resultado,
                                                        r'''$.p''',
                                                      ),
                                                  false,
                                                ) &&
                                                valueOrDefault<bool>(
                                                  _model.resultadoLocalState[
                                                          1] ==
                                                      getJsonField(
                                                        FFAppState().resultado,
                                                        r'''$.b''',
                                                      ),
                                                  false,
                                                ))) {
                                          return 'Banker';
                                        } else if ((valueOrDefault<bool>(
                                                  _model.resultadoLocalState
                                                          .first ==
                                                      getJsonField(
                                                        FFAppState().resultado,
                                                        r'''$.b''',
                                                      ),
                                                  false,
                                                ) &&
                                                valueOrDefault<bool>(
                                                  _model.resultadoLocalState[
                                                          1] ==
                                                      getJsonField(
                                                        FFAppState().resultado,
                                                        r'''$.b''',
                                                      ),
                                                  false,
                                                )) ||
                                            (valueOrDefault<bool>(
                                                  _model.resultadoLocalState
                                                          .first ==
                                                      getJsonField(
                                                        FFAppState().resultado,
                                                        r'''$.b''',
                                                      ),
                                                  false,
                                                ) &&
                                                valueOrDefault<bool>(
                                                  _model.resultadoLocalState[
                                                          1] ==
                                                      getJsonField(
                                                        FFAppState().resultado,
                                                        r'''$.p''',
                                                      ),
                                                  false,
                                                ))) {
                                          return 'Player';
                                        } else {
                                          return 'Falso';
                                        }
                                      }(),
                                      'Falso',
                                    ),
                              'Falso',
                            );
                          });
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
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Busque',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 3.0,
                        shape: const CircleBorder(),
                        child: Container(
                          width: 26.0,
                          height: 26.0,
                          decoration: BoxDecoration(
                            color: valueOrDefault<Color>(
                              _model.resultadoLocalState.length == 0
                                  ? FlutterFlowTheme.of(context)
                                      .secondaryBackground
                                  : valueOrDefault<Color>(
                                      () {
                                        if (((_model.resultadoLocalState
                                                        .first ==
                                                    getJsonField(
                                                      FFAppState().resultado,
                                                      r'''$.p''',
                                                    )) &&
                                                valueOrDefault<bool>(
                                                  _model.resultadoLocalState[
                                                          1] ==
                                                      getJsonField(
                                                        FFAppState().resultado,
                                                        r'''$.p''',
                                                      ),
                                                  true,
                                                )) ||
                                            valueOrDefault<bool>(
                                              (_model.resultadoLocalState
                                                          .first ==
                                                      getJsonField(
                                                        FFAppState().resultado,
                                                        r'''$.p''',
                                                      )) &&
                                                  valueOrDefault<bool>(
                                                    _model.resultadoLocalState[
                                                            1] ==
                                                        getJsonField(
                                                          FFAppState()
                                                              .resultado,
                                                          r'''$.b''',
                                                        ),
                                                    true,
                                                  ),
                                              true,
                                            )) {
                                          return FlutterFlowTheme.of(context)
                                              .error;
                                        } else if (valueOrDefault<bool>(
                                              valueOrDefault<bool>(
                                                    _model.resultadoLocalState
                                                            .first ==
                                                        getJsonField(
                                                          FFAppState()
                                                              .resultado,
                                                          r'''$.b''',
                                                        ),
                                                    true,
                                                  ) &&
                                                  valueOrDefault<bool>(
                                                    _model.resultadoLocalState[
                                                            1] ==
                                                        getJsonField(
                                                          FFAppState()
                                                              .resultado,
                                                          r'''$.b''',
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
                                                              .resultado,
                                                          r'''$.b''',
                                                        ),
                                                    true,
                                                  ) &&
                                                  valueOrDefault<bool>(
                                                    _model.resultadoLocalState[
                                                            1] ==
                                                        getJsonField(
                                                          FFAppState()
                                                              .resultado,
                                                          r'''$.p''',
                                                        ),
                                                    true,
                                                  ),
                                              true,
                                            )) {
                                          return Color(0xFF11386F);
                                        } else {
                                          return Color(0xFFF29C1F);
                                        }
                                      }(),
                                      Color(0xFFF29C1F),
                                    ),
                              FlutterFlowTheme.of(context).secondaryBackground,
                            ),
                            shape: BoxShape.circle,
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                        ),
                      ),
                    ),
                    if (valueOrDefault<bool>(
                      _model.firstResulStringLocalState ==
                          valueOrDefault<String>(
                            _model.resultadoLocalState.first,
                            'vazio',
                          ),
                      false,
                    ))
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Text(
                                'Green!!!',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Color(0xFF00C902),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: FlutterFlowWebView(
                        content: 'https://universo.bet/game/evolution-bac-bo',
                        height: 530.0,
                        verticalScroll: false,
                        horizontalScroll: false,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
