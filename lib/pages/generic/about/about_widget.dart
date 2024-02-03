import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/operation_button/operation_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'about_model.dart';
export 'about_model.dart';

class AboutWidget extends StatefulWidget {
  const AboutWidget({super.key});

  @override
  State<AboutWidget> createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  late AboutModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AboutModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'about'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xD8000000),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_left,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('ABOUT_PAGE_arrow_left_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'Over',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/background.webp',
                ).image,
              ),
            ),
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).primary,
                    const Color(0xD9000000),
                    const Color(0xF2000000)
                  ],
                  stops: const [0.0, 0.25, 1.0],
                  begin: const AlignmentDirectional(0.0, -1.0),
                  end: const AlignmentDirectional(0, 1.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Text(
                        'MySwimStats',
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).text3,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                      child: Text(
                        'Deze app is ontworpen voor zwemmers die hun gegevens gemakkelijk en overzichtelijk willen bekijken.\n\nBij vragen of opmerkingen over de app kun je contact met ons opnemen via e-mail: contact@swimscore.nl\n\nDeze app wordt ontwikkeld door twee enthousiastelingen uit de zwemwereld, namelijk Bryan Tankink en Michelle van Wijk. Naast het ontwikkelen van deze app verzorgen wij ook livestreams bij diverse Nederlandse Kampioenschappen\n\nDeveloper: Bryan Tankink\nDesigner: Michelle van Wijk',
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).text3,
                                ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.operationButtonModel1,
                        updateCallback: () => setState(() {}),
                        child: OperationButtonWidget(
                          text: 'Bekijk de EULA',
                          onClick: () async {
                            logFirebaseEvent(
                                'ABOUT_PAGE_Container_s7mczu27_CALLBACK');
                            logFirebaseEvent('OperationButton_launch_u_r_l');
                            await launchURL(
                                'https://swimscore.nl/myswimstats/myswimstats-eula/');
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.operationButtonModel2,
                        updateCallback: () => setState(() {}),
                        child: OperationButtonWidget(
                          text: 'Privacyverklaring',
                          onClick: () async {
                            logFirebaseEvent(
                                'ABOUT_PAGE_Container_oaya2id8_CALLBACK');
                            logFirebaseEvent('OperationButton_launch_u_r_l');
                            await launchURL(
                                'https://swimscore.nl/myswimstats/privacyverklaring-voor-myswimstats/');
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.operationButtonModel3,
                        updateCallback: () => setState(() {}),
                        child: OperationButtonWidget(
                          text: 'Website',
                          onClick: () async {
                            logFirebaseEvent(
                                'ABOUT_PAGE_Container_71hsg6es_CALLBACK');
                            logFirebaseEvent('OperationButton_launch_u_r_l');
                            await launchURL('https://swimscore.nl/');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
