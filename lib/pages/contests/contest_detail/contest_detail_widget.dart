import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/contests/contest_swim_line/contest_swim_line_widget.dart';
import '/pages/generic/swimrankings_list_item/swimrankings_list_item_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'contest_detail_model.dart';
export 'contest_detail_model.dart';

class ContestDetailWidget extends StatefulWidget {
  const ContestDetailWidget({
    super.key,
    required this.raceName,
    required this.clubId,
    required this.contestId,
  });

  final String? raceName;
  final String? clubId;
  final String? contestId;

  @override
  _ContestDetailWidgetState createState() => _ContestDetailWidgetState();
}

class _ContestDetailWidgetState extends State<ContestDetailWidget> {
  late ContestDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContestDetailModel());
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
            'Wedstrijdsinformatie',
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
                padding: const EdgeInsets.all(15.0),
                child: FutureBuilder<ApiCallResponse>(
                  future: _model.raceInfoCache(
                    uniqueQueryKey:
                        '${widget.clubId}-${widget.contestId}-${FFAppState().activeUserId}',
                    requestFn: () => ApiGroup.getContestCall.call(
                      swimrankingsIdentifier: FFAppState().activeUserId,
                      clubId: widget.clubId,
                      contestId: widget.contestId,
                    ),
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
                    final listViewGetContestResponse = snapshot.data!;
                    return ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            widget.raceName!,
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).text3,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Text(
                            'Mijn gemiddelde performance',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).titleMedium,
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              '${ApiGroup.getContestCall.myPerformance(
                                    listViewGetContestResponse.jsonBody,
                                  ).toString()}%',
                              '100%',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Poppins',
                                  color: functions.isGoodPercentage(
                                          ApiGroup.getContestCall
                                              .myPerformance(
                                                listViewGetContestResponse
                                                    .jsonBody,
                                              )
                                              .toString())!
                                      ? FlutterFlowTheme.of(context)
                                          .performanceGood
                                      : FlutterFlowTheme.of(context)
                                          .performanceBad,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 25.0,
                            decoration: const BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      'Afstand',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .text3,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      '%',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .text3,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      'Tijd',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .text3,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Text(
                                      'Punten',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .text3,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final race = getJsonField(
                                listViewGetContestResponse.jsonBody,
                                r'''$.data.active.swimResults''',
                              ).toList();
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children:
                                    List.generate(race.length, (raceIndex) {
                                  final raceItem = race[raceIndex];
                                  return ContestSwimLineWidget(
                                    key: Key(
                                        'Keyub1_${raceIndex}_of_${race.length}'),
                                    stroke: raceItem,
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Text(
                            'Gemiddelde performance club',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).titleMedium,
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              '${ApiGroup.getContestCall.clubPerformance(
                                    listViewGetContestResponse.jsonBody,
                                  ).toString().toString()}%',
                              '100%',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Poppins',
                                  color: functions.isGoodPercentage(
                                          ApiGroup.getContestCall
                                              .clubPerformance(
                                                listViewGetContestResponse
                                                    .jsonBody,
                                              )
                                              .toString()
                                              .toString())!
                                      ? FlutterFlowTheme.of(context)
                                          .performanceGood
                                      : FlutterFlowTheme.of(context)
                                          .performanceBad,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        if (FFAppState().premium)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 32.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                HapticFeedback.selectionClick();

                                context.pushNamed(
                                  'contestClubDetails',
                                  queryParameters: {
                                    'contestData': serializeParam(
                                      getJsonField(
                                        listViewGetContestResponse.jsonBody,
                                        r'''$.data''',
                                      ),
                                      ParamType.JSON,
                                    ),
                                    'raceName': serializeParam(
                                      widget.raceName,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: wrapWithModel(
                                model: _model.swimrankingsListItemModel,
                                updateCallback: () => setState(() {}),
                                child: SwimrankingsListItemWidget(
                                  name: 'Bekijk resultaten van clubgenoten',
                                  date:
                                      '${functions.addValues(ApiGroup.getContestCall.clubSwimmers(
                                            listViewGetContestResponse.jsonBody,
                                          )?.length, 0).toString()} zwemmers',
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
