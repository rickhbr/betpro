import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'apppro_model.dart';
export 'apppro_model.dart';

class AppproWidget extends StatefulWidget {
  const AppproWidget({Key? key}) : super(key: key);

  @override
  _AppproWidgetState createState() => _AppproWidgetState();
}

class _AppproWidgetState extends State<AppproWidget> {
  late AppproModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppproModel());

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
        title: 'apppro',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryText,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.circle_notifications,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    size: 24.0,
                  ),
                  Text(
                    'PLANO FREE',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Arimo',
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Icon(
                    Icons.support_agent,
                    color: Colors.white,
                    size: 24.0,
                  ),
                ],
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowWebView(
                    content:
                        'https://checkout.perfectpay.com.br/pay/PPU38CMICHD',
                    bypass: false,
                    height: 726.0,
                    verticalScroll: false,
                    horizontalScroll: false,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
