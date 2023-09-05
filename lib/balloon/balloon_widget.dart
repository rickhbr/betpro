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
import 'balloon_model.dart';
export 'balloon_model.dart';

class BalloonWidget extends StatefulWidget {
  const BalloonWidget({
    Key? key,
    required this.pNome,
  }) : super(key: key);

  final String? pNome;

  @override
  _BalloonWidgetState createState() => _BalloonWidgetState();
}

class _BalloonWidgetState extends State<BalloonWidget> {
  late BalloonModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BalloonModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.outImgActionPageLoad = await actions.randomImage(
        FFAppState().ballonAppState.toList(),
      );
      setState(() {
        _model.ativarBotao = true;
        _model.imgUrl = valueOrDefault<String>(
          _model.outImgActionPageLoad,
          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/jbasduvw7os6/..2.jpg',
        );
      });
      _model.contadorController.onExecute.add(StopWatchExecute.start);
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
        title: 'balloon',
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 20.0, 20.0, 20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: CachedNetworkImage(
                                          fadeInDuration:
                                              Duration(milliseconds: 300),
                                          fadeOutDuration:
                                              Duration(milliseconds: 300),
                                          imageUrl: valueOrDefault<String>(
                                            _model.imgUrl,
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/9f9ucvntg49c/.2_penalty.jpg',
                                          ),
                                          width: 169.0,
                                          height: 164.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Até 3 Tentativas',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  FlutterFlowTimer(
                                    initialTime: _model.contadorMilliseconds,
                                    getDisplayTime: (value) =>
                                        StopWatchTimer.getDisplayTime(
                                      value,
                                      hours: false,
                                      milliSecond: false,
                                    ),
                                    timer: _model.contadorController,
                                    onChanged:
                                        (value, displayTime, shouldUpdate) {
                                      _model.contadorMilliseconds = value;
                                      _model.contadorValue = displayTime;
                                      if (shouldUpdate) setState(() {});
                                    },
                                    onEnded: () async {
                                      setState(() {
                                        _model.ativarBotao = false;
                                      });
                                      _model.contadorController.onExecute
                                          .add(StopWatchExecute.reset);
                                    },
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Arimo',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: FFButtonWidget(
                                      onPressed: _model.ativarBotao
                                          ? null
                                          : () async {
                                              _model.outImage =
                                                  await actions.randomImage(
                                                FFAppState()
                                                    .ballonAppState
                                                    .toList(),
                                              );
                                              setState(() {
                                                _model.imgUrl =
                                                    valueOrDefault<String>(
                                                  _model.outImage,
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/jbasduvw7os6/..2.jpg',
                                                );
                                                _model.ativarBotao = true;
                                              });
                                              _model
                                                  .contadorController.onExecute
                                                  .add(StopWatchExecute.start);

                                              setState(() {});
                                            },
                                      text: 'Buscar Sinal',
                                      options: FFButtonOptions(
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFF33E100),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        disabledColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        disabledTextColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: FlutterFlowWebView(
                                content:
                                    'https://universo.bet/game/smartsoft-balloon',
                                bypass: false,
                                height: 500.0,
                                verticalScroll: false,
                                horizontalScroll: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
