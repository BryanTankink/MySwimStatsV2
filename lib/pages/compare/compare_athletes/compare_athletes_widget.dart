import '/backend/api_requests/api_calls.dart';
import '/components/compare_side_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/swimrankings_list_item/swimrankings_list_item_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'compare_athletes_model.dart';
export 'compare_athletes_model.dart';

class CompareAthletesWidget extends StatefulWidget {
  const CompareAthletesWidget({
    super.key,
    required this.personA,
    this.personB,
  });

  final dynamic personA;
  final dynamic personB;

  @override
  _CompareAthletesWidgetState createState() => _CompareAthletesWidgetState();
}

class _CompareAthletesWidgetState extends State<CompareAthletesWidget> {
  late CompareAthletesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompareAthletesModel());
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
              context.goNamed('Dashboard');
            },
          ),
          title: Text(
            'Vergelijken',
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
              color: FlutterFlowTheme.of(context).primary,
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  'https://myswimstats.nl/Content/Images/General/background.webp',
                ),
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 4.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'compareAthleteFavorites',
                                  queryParameters: {
                                    'otherAthlete': serializeParam(
                                      widget.personB,
                                      ParamType.JSON,
                                    ),
                                    'isComparer': serializeParam(
                                      false,
                                      ParamType.bool,
                                    ),
                                    'doubleBack': serializeParam(
                                      true,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: wrapWithModel(
                                model: _model.swimrankingsListItemModel1,
                                updateCallback: () => setState(() {}),
                                child: SwimrankingsListItemWidget(
                                  name: getJsonField(
                                    widget.personA,
                                    r'''$.fullName''',
                                  ).toString(),
                                  date: getJsonField(
                                    widget.personA,
                                    r'''$.birthYear''',
                                  ).toString(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 4.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'compareAthleteFavorites',
                                  queryParameters: {
                                    'otherAthlete': serializeParam(
                                      widget.personA,
                                      ParamType.JSON,
                                    ),
                                    'isComparer': serializeParam(
                                      true,
                                      ParamType.bool,
                                    ),
                                    'doubleBack': serializeParam(
                                      true,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: wrapWithModel(
                                model: _model.swimrankingsListItemModel2,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: SwimrankingsListItemWidget(
                                  name: widget.personB != null
                                      ? getJsonField(
                                          widget.personB,
                                          r'''$.fullName''',
                                        ).toString()
                                      : 'Kies persoon',
                                  date: widget.personB != null
                                      ? getJsonField(
                                          widget.personB,
                                          r'''$.birthYear''',
                                        ).toString()
                                      : 'KLIK HIER',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (widget.personB != null)
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: ApiGroup.compareCall.call(
                            athleteA: getJsonField(
                              widget.personA,
                              r'''$.athleteId''',
                            ).toString(),
                            athleteB: getJsonField(
                              widget.personB,
                              r'''$.athleteId''',
                            ).toString(),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 32.0,
                                  height: 32.0,
                                  child: SpinKitWave(
                                    color: FlutterFlowTheme.of(context).text,
                                    size: 32.0,
                                  ),
                                ),
                              );
                            }
                            final listViewCompareResponse = snapshot.data!;
                            return Builder(
                              builder: (context) {
                                final compareable = getJsonField(
                                  listViewCompareResponse.jsonBody,
                                  r'''$.data.compareables''',
                                ).toList();
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: compareable.length,
                                  itemBuilder: (context, compareableIndex) {
                                    final compareableItem =
                                        compareable[compareableIndex];
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: const BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    getJsonField(
                                                      compareableItem,
                                                      r'''$.event''',
                                                    ).toString(),
                                                    textAlign: TextAlign.end,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .text3,
                                                        ),
                                                  ),
                                                  Text(
                                                    ' ',
                                                    textAlign: TextAlign.end,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .text3,
                                                        ),
                                                  ),
                                                  Text(
                                                    functions
                                                        .convertCourseTypeToString(
                                                            getJsonField(
                                                      compareableItem,
                                                      r'''$.courseType''',
                                                    )),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .text2,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: CompareSideWidget(
                                                    key: Key(
                                                        'Keync4_${compareableIndex}_of_${compareable.length}'),
                                                    baseData: getJsonField(
                                                      compareableItem,
                                                      r'''$.athleteA''',
                                                    ),
                                                    isBest: getJsonField(
                                                      compareableItem,
                                                      r'''$.aIsBest''',
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: CompareSideWidget(
                                                    key: Key(
                                                        'Keykvm_${compareableIndex}_of_${compareable.length}'),
                                                    baseData: getJsonField(
                                                      compareableItem,
                                                      r'''$.athleteB''',
                                                    ),
                                                    isBest: !getJsonField(
                                                      compareableItem,
                                                      r'''$.aIsBest''',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              thickness: 1.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .text2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
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
    );
  }
}
