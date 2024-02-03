import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/components/achievement_category_widget.dart';
import '/components/short_long_course_switcher_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/app_drawer/app_drawer_widget.dart';
import '/pages/generic/base_header/base_header_widget.dart';
import '/pages/generic/bottom_navigator/bottom_navigator_widget.dart';
import '/pages/generic/swimrankings_list_item/swimrankings_list_item_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'contests_model.dart';
export 'contests_model.dart';

class ContestsWidget extends StatefulWidget {
  const ContestsWidget({super.key});

  @override
  State<ContestsWidget> createState() => _ContestsWidgetState();
}

class _ContestsWidgetState extends State<ContestsWidget>
    with TickerProviderStateMixin {
  late ContestsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'swimrankingsListItemOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 50.0),
          end: const Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 50.0),
          end: const Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'achievementCategoryOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 50.0),
          end: const Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'listViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 450.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContestsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'contests'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CONTESTS_PAGE_contests_ON_INIT_STATE');
      logFirebaseEvent('contests_update_app_state');
      setState(() {
        FFAppState().updateActivePageInfoStruct(
          (e) => e..activePage = PageId.Races,
        );
      });
    });
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
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.appDrawerModel,
            updateCallback: () => setState(() {}),
            child: const AppDrawerWidget(),
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: wrapWithModel(
            model: _model.baseHeaderModel,
            updateCallback: () => setState(() {}),
            child: BaseHeaderWidget(
              drawerClick: () async {
                logFirebaseEvent('CONTESTS_Container_fqenpwl0_CALLBACK');
                logFirebaseEvent('baseHeader_drawer');
                scaffoldKey.currentState!.openDrawer();
              },
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/background.webp',
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
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: FutureBuilder<ApiCallResponse>(
                            future: FFAppState().racesList(
                              uniqueQueryKey: FFAppState().activeUserId,
                              requestFn: () =>
                                  ApiGroup.getContestsVTwoCall.call(
                                deviceIdentifier: FFAppState().deviceIdentifier,
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
                              final listViewGetContestsVTwoResponse =
                                  snapshot.data!;
                              return ListView(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 16.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'CONTESTS_PAGE_Container_1o2603q1_ON_TAP');
                                        logFirebaseEvent(
                                            'SwimrankingsListItem_navigate_to');

                                        context.pushNamed(
                                          'LinkSwimrankings',
                                          queryParameters: {
                                            'addState': serializeParam(
                                              UserAddState.AsViewOnly,
                                              ParamType.Enum,
                                            ),
                                            'showHeader': serializeParam(
                                              true,
                                              ParamType.bool,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: wrapWithModel(
                                        model: _model.swimrankingsListItemModel,
                                        updateCallback: () => setState(() {}),
                                        updateOnChange: true,
                                        child: SwimrankingsListItemWidget(
                                          name: valueOrDefault<String>(
                                            getJsonField(
                                              FFAppState().user,
                                              r'''$.active.fullName''',
                                            )?.toString(),
                                            'Onbekend',
                                          ),
                                          date: valueOrDefault<String>(
                                            getJsonField(
                                              FFAppState().user,
                                              r'''$.active.birthYear''',
                                            )?.toString(),
                                            '-',
                                          ),
                                        ),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'swimrankingsListItemOnPageLoadAnimation']!),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: Text(
                                          getJsonField(
                                            listViewGetContestsVTwoResponse
                                                .jsonBody,
                                            r'''$.data.count''',
                                          ).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .text3,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                        child: Text(
                                          'wedstrijden gezwommen!',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .text3,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ).animateOnPageLoad(animationsMap[
                                      'columnOnPageLoadAnimation']!),
                                  if (getJsonField(
                                    FFAppState().user,
                                    r'''$.activeIsMe''',
                                  ))
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'CONTESTS_PAGE_Container_yyznetf4_ON_TAP');
                                          logFirebaseEvent(
                                              'AchievementCategory_navigate_to');

                                          context.pushNamed(
                                            'AchievementLevels',
                                            queryParameters: {
                                              'title': serializeParam(
                                                ApiGroup.getContestsVTwoCall
                                                    .achievementLevelName(
                                                      listViewGetContestsVTwoResponse
                                                          .jsonBody,
                                                    )
                                                    .toString(),
                                                ParamType.String,
                                              ),
                                              'achievement': serializeParam(
                                                ApiGroup.getContestsVTwoCall
                                                    .achievement(
                                                  listViewGetContestsVTwoResponse
                                                      .jsonBody,
                                                ),
                                                ParamType.JSON,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: wrapWithModel(
                                          model:
                                              _model.achievementCategoryModel,
                                          updateCallback: () => setState(() {}),
                                          child: AchievementCategoryWidget(
                                            categoryHeader:
                                                'Wedstrijden achievement',
                                            level: ApiGroup.getContestsVTwoCall
                                                .achievementLevel(
                                              listViewGetContestsVTwoResponse
                                                  .jsonBody,
                                            ),
                                            categoryLevelName:
                                                ApiGroup.getContestsVTwoCall
                                                    .achievementLevelName(
                                                      listViewGetContestsVTwoResponse
                                                          .jsonBody,
                                                    )
                                                    .toString(),
                                            currentScore: ApiGroup
                                                .getContestsVTwoCall
                                                .achievementLevel(
                                              listViewGetContestsVTwoResponse
                                                  .jsonBody,
                                            ),
                                            maxScore: ApiGroup
                                                .getContestsVTwoCall
                                                .achievementMax(
                                              listViewGetContestsVTwoResponse
                                                  .jsonBody,
                                            ),
                                            badgePath:
                                                ApiGroup.getContestsVTwoCall
                                                    .achievementBadge(
                                                      listViewGetContestsVTwoResponse
                                                          .jsonBody,
                                                    )
                                                    .toString(),
                                          ),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'achievementCategoryOnPageLoadAnimation']!),
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Builder(
                                      builder: (context) {
                                        final contest = functions
                                            .filterRacesForCourse(
                                                getJsonField(
                                                  listViewGetContestsVTwoResponse
                                                      .jsonBody,
                                                  r'''$.data.contests''',
                                                  true,
                                                ),
                                                FFAppState().displayLongCourse)
                                            .toList();
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: contest.length,
                                          itemBuilder: (context, contestIndex) {
                                            final contestItem =
                                                contest[contestIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'CONTESTS_PAGE_Container_bz7bkb05_ON_TAP');
                                                logFirebaseEvent(
                                                    'Container_navigate_to');

                                                context.pushNamed(
                                                  'contestDetail',
                                                  queryParameters: {
                                                    'raceName': serializeParam(
                                                      getJsonField(
                                                        contestItem,
                                                        r'''$.contestName''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'clubId': serializeParam(
                                                      getJsonField(
                                                        contestItem,
                                                        r'''$.clubId''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'contestId': serializeParam(
                                                      getJsonField(
                                                        contestItem,
                                                        r'''$.contestId''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                decoration: const BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Container(
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    getJsonField(
                                                                      contestItem,
                                                                      r'''$.contestName''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).text3,
                                                                        ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        getJsonField(
                                                                          contestItem,
                                                                          r'''$.city''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          functions
                                                                              .convertCourseTypeToString(getJsonField(
                                                                            contestItem,
                                                                            r'''$.courseType''',
                                                                          )),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Text(
                                                                    getJsonField(
                                                                      contestItem,
                                                                      r'''$.dateFull''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).text2,
                                                                          fontSize:
                                                                              12.0,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons.play_arrow,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .text,
                                                          size: 18.0,
                                                        ),
                                                      ],
                                                    ),
                                                    Divider(
                                                      height: 10.0,
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .cards,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ).animateOnPageLoad(animationsMap[
                                            'listViewOnPageLoadAnimation']!);
                                      },
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 8.0, 8.0, 8.0),
                          child: wrapWithModel(
                            model: _model.shortLongCourseSwitcherModel,
                            updateCallback: () => setState(() {}),
                            child: const ShortLongCourseSwitcherWidget(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.bottomNavigatorModel,
                updateCallback: () => setState(() {}),
                child: const BottomNavigatorWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
