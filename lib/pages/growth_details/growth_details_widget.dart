import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'growth_details_model.dart';
export 'growth_details_model.dart';

class GrowthDetailsWidget extends StatefulWidget {
  const GrowthDetailsWidget({
    super.key,
    required this.graphResult,
  });

  final dynamic graphResult;

  @override
  _GrowthDetailsWidgetState createState() => _GrowthDetailsWidgetState();
}

class _GrowthDetailsWidgetState extends State<GrowthDetailsWidget> {
  late GrowthDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GrowthDetailsModel());
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
        backgroundColor: FlutterFlowTheme.of(context).primary,
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
              HapticFeedback.selectionClick();
              context.pop();
            },
          ),
          title: Text(
            'Persoonlijke groei',
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
                  'assets/images/Topical_Micellair_Water_2.jpg',
                ).image,
              ),
            ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
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
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    Text(
                      'Jou beste zwemjaar was',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).text3,
                          ),
                    ),
                    Text(
                      getJsonField(
                        widget.graphResult,
                        r'''$.bestYear.year''',
                      ).toString(),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).text3,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Text(
                        'Gemiddelde aantal fina punten',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).text3,
                            ),
                      ),
                    ),
                    Text(
                      getJsonField(
                        widget.graphResult,
                        r'''$.bestYear.points''',
                      ).toString(),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).text,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Builder(
                      builder: (context) {
                        final year = getJsonField(
                          widget.graphResult,
                          r'''$.info''',
                        ).toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          reverse: true,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: year.length,
                          itemBuilder: (context, yearIndex) {
                            final yearItem = year[yearIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                HapticFeedback.selectionClick();

                                context.pushNamed(
                                  'growthYearDetails',
                                  queryParameters: {
                                    'yearInfo': serializeParam(
                                      getJsonField(
                                        yearItem,
                                        r'''$''',
                                      ),
                                      ParamType.JSON,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            getJsonField(
                                              yearItem,
                                              r'''$.year''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .text3,
                                                ),
                                          ),
                                          Text(
                                            '${getJsonField(
                                              yearItem,
                                              r'''$.points''',
                                            ).toString()} (fina punten)',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .text3,
                                                ),
                                          ),
                                          Icon(
                                            Icons.chevron_right_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .text3,
                                            size: 24.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1.0,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
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
