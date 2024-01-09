import '/backend/api_requests/api_calls.dart';
import '/components/achievement_category_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/split_times_display/split_times_display_widget.dart';
import '/pages/loaders/loader_component/loader_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'race_list_model.dart';
export 'race_list_model.dart';

class RaceListWidget extends StatefulWidget {
  const RaceListWidget({
    super.key,
    required this.style,
    required this.course,
    required this.title,
    int? timeId,
    String? year,
  })  : timeId = timeId ?? 0,
        year = year ?? '-1';

  final int? style;
  final int? course;
  final String? title;
  final int timeId;
  final String year;

  @override
  _RaceListWidgetState createState() => _RaceListWidgetState();
}

class _RaceListWidgetState extends State<RaceListWidget>
    with TickerProviderStateMixin {
  late RaceListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'achievementCategoryOnPageLoadAnimation': AnimationInfo(
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
    'tabBarOnPageLoadAnimation': AnimationInfo(
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
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 100.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 100.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
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
    _model = createModel(context, () => RaceListModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
        appBar: !_model.loading
            ? AppBar(
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
                  'Races',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                ),
                actions: const [],
                centerTitle: true,
                elevation: 2.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  'https://myswimstats.nl/Content/Images/General/background.webp',
                ),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).primary,
                    const Color(0xD9000000),
                    const Color(0xF3000000)
                  ],
                  stops: const [0.0, 0.25, 1.0],
                  begin: const AlignmentDirectional(0.0, -1.0),
                  end: const AlignmentDirectional(0, 1.0),
                ),
              ),
              child: Stack(
                children: [
                  FutureBuilder<ApiCallResponse>(
                    future: ApiGroup.raceListCall.call(
                      deviceIdentifier: FFAppState().deviceIdentifier,
                      style: widget.style?.toString(),
                      course: widget.course?.toString(),
                      raceId: widget.timeId.toString(),
                      year: widget.year,
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
                      final containerRaceListResponse = snapshot.data!;
                      return Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    '${widget.title}',
                                    '50m Vrije slag',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color:
                                            FlutterFlowTheme.of(context).text3,
                                      ),
                                ),
                              ),
                            ),
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
                                    HapticFeedback.selectionClick();

                                    context.pushNamed(
                                      'AchievementLevels',
                                      queryParameters: {
                                        'title': serializeParam(
                                          ApiGroup.raceListCall
                                              .achievementLevelName(
                                                containerRaceListResponse
                                                    .jsonBody,
                                              )
                                              .toString(),
                                          ParamType.String,
                                        ),
                                        'achievement': serializeParam(
                                          ApiGroup.raceListCall.achievement(
                                            containerRaceListResponse.jsonBody,
                                          ),
                                          ParamType.JSON,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: wrapWithModel(
                                    model: _model.achievementCategoryModel,
                                    updateCallback: () => setState(() {}),
                                    child: AchievementCategoryWidget(
                                      categoryHeader: 'Achievement',
                                      level: ApiGroup.raceListCall
                                          .achievementLevel(
                                        containerRaceListResponse.jsonBody,
                                      ),
                                      categoryLevelName: ApiGroup.raceListCall
                                          .achievementLevelName(
                                            containerRaceListResponse.jsonBody,
                                          )
                                          .toString(),
                                      currentScore: ApiGroup.raceListCall
                                          .achievementLevel(
                                        containerRaceListResponse.jsonBody,
                                      ),
                                      maxScore: ApiGroup.raceListCall
                                          .achievementLevelCount(
                                        containerRaceListResponse.jsonBody,
                                      ),
                                      badgePath: ApiGroup.raceListCall
                                          .achievementLebelBadge(
                                            containerRaceListResponse.jsonBody,
                                          )
                                          .toString(),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'achievementCategoryOnPageLoadAnimation']!),
                              ),
                            Expanded(
                              child: Column(
                                children: [
                                  Align(
                                    alignment: const Alignment(0.0, 0),
                                    child: TabBar(
                                      labelColor:
                                          FlutterFlowTheme.of(context).text,
                                      unselectedLabelColor:
                                          FlutterFlowTheme.of(context).text2,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 14.0,
                                          ),
                                      unselectedLabelStyle: const TextStyle(),
                                      indicatorColor:
                                          FlutterFlowTheme.of(context).primary,
                                      padding: const EdgeInsets.all(4.0),
                                      tabs: const [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.clock,
                                              ),
                                            ),
                                            Tab(
                                              text: 'Tijden',
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: Icon(
                                                Icons.query_stats,
                                              ),
                                            ),
                                            Tab(
                                              text: 'Ranglijst',
                                            ),
                                          ],
                                        ),
                                      ],
                                      controller: _model.tabBarController,
                                      onTap: (i) async {
                                        [() async {}, () async {}][i]();
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      controller: _model.tabBarController,
                                      children: [
                                        KeepAliveWidgetWrapper(
                                          builder: (context) => ListView(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 15.0, 15.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: 25.0,
                                                  decoration: const BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        width: 275.0,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                1.0,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: 150.0,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      1.0,
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Plaats',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
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
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: 75.0,
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        'Tijd',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).text3,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          'Score',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .text3,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final race =
                                                        ApiGroup.raceListCall
                                                                .races(
                                                                  containerRaceListResponse
                                                                      .jsonBody,
                                                                )
                                                                ?.toList() ??
                                                            [];
                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: race.length,
                                                      itemBuilder:
                                                          (context, raceIndex) {
                                                        final raceItem =
                                                            race[raceIndex];
                                                        return Builder(
                                                          builder: (context) =>
                                                              InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              HapticFeedback
                                                                  .selectionClick();
                                                              setState(() {
                                                                _model.loading =
                                                                    true;
                                                              });
                                                              _model.clubIdResult =
                                                                  await ApiGroup
                                                                      .swimTimeToClubIdCall
                                                                      .call(
                                                                swimrankingsIdentifier:
                                                                    FFAppState()
                                                                        .activeUserId,
                                                                contestId:
                                                                    getJsonField(
                                                                  raceItem,
                                                                  r'''$.meetId''',
                                                                ).toString(),
                                                                genderId:
                                                                    getJsonField(
                                                                  raceItem,
                                                                  r'''$.genderId''',
                                                                ).toString(),
                                                                styleId: widget
                                                                    .style
                                                                    ?.toString(),
                                                              );
                                                              setState(() {});
                                                              if ((_model
                                                                      .clubIdResult
                                                                      ?.succeeded ??
                                                                  true)) {
                                                                context
                                                                    .pushNamed(
                                                                  'contestDetail',
                                                                  queryParameters:
                                                                      {
                                                                    'clubId':
                                                                        serializeParam(
                                                                      ApiGroup
                                                                          .swimTimeToClubIdCall
                                                                          .clubId(
                                                                            (_model.clubIdResult?.jsonBody ??
                                                                                ''),
                                                                          )
                                                                          .toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'contestId':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        raceItem,
                                                                        r'''$.meetId''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'raceName':
                                                                        serializeParam(
                                                                      ApiGroup
                                                                          .swimTimeToClubIdCall
                                                                          .raceName(
                                                                            (_model.clubIdResult?.jsonBody ??
                                                                                ''),
                                                                          )
                                                                          .toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              } else {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: const Text(
                                                                          'Error'),
                                                                      content: const Text(
                                                                          'Kan geen verdere gegevens inzien!'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              const Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                              }

                                                              setState(() {
                                                                _model.loading =
                                                                    false;
                                                              });

                                                              setState(() {});
                                                            },
                                                            onLongPress:
                                                                () async {
                                                              if (getJsonField(
                                                                    raceItem,
                                                                    r'''$.splits''',
                                                                  ) !=
                                                                  null) {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap: () => _model.unfocusNode.canRequestFocus
                                                                            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                            : FocusScope.of(context).unfocus(),
                                                                        child:
                                                                            SplitTimesDisplayWidget(
                                                                          splits:
                                                                              getJsonField(
                                                                            raceItem,
                                                                            r'''$.splits''',
                                                                            true,
                                                                          )!,
                                                                          title:
                                                                              widget.title!,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));
                                                              } else {
                                                                HapticFeedback
                                                                    .mediumImpact();
                                                              }
                                                            },
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height: 50.0,
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    width:
                                                                        275.0,
                                                                    height:
                                                                        MediaQuery.sizeOf(context).height *
                                                                            1.0,
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 150.0,
                                                                              height: MediaQuery.sizeOf(context).height * 1.0,
                                                                              decoration: const BoxDecoration(),
                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                              child: Align(
                                                                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Align(
                                                                                      alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          getJsonField(
                                                                                            raceItem,
                                                                                            r'''$.place''',
                                                                                          ).toString(),
                                                                                          'Winterswijk',
                                                                                        ),
                                                                                        textAlign: TextAlign.start,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              color: FlutterFlowTheme.of(context).text2,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          getJsonField(
                                                                                            raceItem,
                                                                                            r'''$.dateFull''',
                                                                                          ).toString(),
                                                                                          '11-11-2022',
                                                                                        ),
                                                                                        textAlign: TextAlign.start,
                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              color: FlutterFlowTheme.of(context).text2,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Align(
                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                              child: Container(
                                                                                width: 75.0,
                                                                                decoration: const BoxDecoration(),
                                                                                child: Align(
                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      getJsonField(
                                                                                        raceItem,
                                                                                        r'''$.time''',
                                                                                      ).toString(),
                                                                                      '25.25',
                                                                                    ),
                                                                                    textAlign: TextAlign.start,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: FlutterFlowTheme.of(context).text2,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                      child:
                                                                          LinearPercentIndicator(
                                                                        percent: functions.calculatePercentage(
                                                                            getJsonField(
                                                                              raceItem,
                                                                              r'''$.points''',
                                                                            ),
                                                                            ApiGroup.raceListCall.max(
                                                                              containerRaceListResponse.jsonBody,
                                                                            )),
                                                                        lineHeight:
                                                                            50.0,
                                                                        animation:
                                                                            false,
                                                                        animateFromLastPercent:
                                                                            true,
                                                                        progressColor:
                                                                            const Color(0xFFBE9E44),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).text3,
                                                                        center:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            getJsonField(
                                                                              raceItem,
                                                                              r'''$.points''',
                                                                            ).toString(),
                                                                            '525',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                        barRadius:
                                                                            const Radius.circular(0.0),
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'containerOnPageLoadAnimation1']!),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        KeepAliveWidgetWrapper(
                                          builder: (context) => ListView(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 15.0, 15.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: 40.0,
                                                  decoration: const BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  -1.0, -1.0),
                                                          child: Text(
                                                            'Plaats',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .text3,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      22.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Alle\nTijden',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .text3,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                1.0, -1.0),
                                                        child: Text(
                                                          'Seizoen',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .text3,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final ranking =
                                                        ApiGroup.raceListCall
                                                                .rankings(
                                                                  containerRaceListResponse
                                                                      .jsonBody,
                                                                )
                                                                ?.toList() ??
                                                            [];
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          ranking.length,
                                                          (rankingIndex) {
                                                        final rankingItem =
                                                            ranking[
                                                                rankingIndex];
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: 50.0,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Expanded(
                                                                  flex: 2,
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              -1.0,
                                                                              1.0),
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              getJsonField(
                                                                                rankingItem,
                                                                                r'''$.name''',
                                                                              ).toString(),
                                                                              'Nederland',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).text2,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              -1.0,
                                                                              -1.0),
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              getJsonField(
                                                                                rankingItem,
                                                                                r'''$.ageGroup''',
                                                                              ).toString(),
                                                                              'Open',
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).text2,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          1.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          35.0,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child:
                                                                          Visibility(
                                                                        visible:
                                                                            functions.hasValidPlacement(getJsonField(
                                                                          rankingItem,
                                                                          r'''$.placeAllTime''',
                                                                        )),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            HapticFeedback.selectionClick();

                                                                            context.pushNamed(
                                                                              'rankings',
                                                                              queryParameters: {
                                                                                'rankingId': serializeParam(
                                                                                  getJsonField(
                                                                                    rankingItem,
                                                                                    r'''$.rankingIdAllTime''',
                                                                                  ),
                                                                                  ParamType.int,
                                                                                ),
                                                                                'fromRank': serializeParam(
                                                                                  functions.addValues(
                                                                                      getJsonField(
                                                                                        rankingItem,
                                                                                        r'''$.placeAllTime''',
                                                                                      ),
                                                                                      -50),
                                                                                  ParamType.int,
                                                                                ),
                                                                                'toRank': serializeParam(
                                                                                  functions.addValues(
                                                                                      getJsonField(
                                                                                        rankingItem,
                                                                                        r'''$.placeAllTime''',
                                                                                      ),
                                                                                      10),
                                                                                  ParamType.int,
                                                                                ),
                                                                                'title': serializeParam(
                                                                                  '${widget.title} - Altijd',
                                                                                  ParamType.String,
                                                                                ),
                                                                                'myRank': serializeParam(
                                                                                  getJsonField(
                                                                                    rankingItem,
                                                                                    r'''$.placeAllTime''',
                                                                                  ),
                                                                                  ParamType.int,
                                                                                ),
                                                                                'myTime': serializeParam(
                                                                                  ApiGroup.raceListCall
                                                                                      .scoreTime(
                                                                                        containerRaceListResponse.jsonBody,
                                                                                      )
                                                                                      .toString(),
                                                                                  ParamType.String,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).text,
                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                functions.placementFunction(getJsonField(
                                                                                  rankingItem,
                                                                                  r'''$.placeAllTime''',
                                                                                )),
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: FlutterFlowTheme.of(context).text3,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          1.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: 50.0,
                                                                    height:
                                                                        35.0,
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    child:
                                                                        Visibility(
                                                                      visible: functions
                                                                          .hasValidPlacement(
                                                                              getJsonField(
                                                                        rankingItem,
                                                                        r'''$.placeSeason''',
                                                                      )),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            HapticFeedback.selectionClick();

                                                                            context.pushNamed(
                                                                              'rankings',
                                                                              queryParameters: {
                                                                                'rankingId': serializeParam(
                                                                                  getJsonField(
                                                                                    rankingItem,
                                                                                    r'''$.rankingIdSeason''',
                                                                                  ),
                                                                                  ParamType.int,
                                                                                ),
                                                                                'fromRank': serializeParam(
                                                                                  functions.addValues(
                                                                                      getJsonField(
                                                                                        rankingItem,
                                                                                        r'''$.placeSeason''',
                                                                                      ),
                                                                                      -50),
                                                                                  ParamType.int,
                                                                                ),
                                                                                'toRank': serializeParam(
                                                                                  functions.addValues(
                                                                                      getJsonField(
                                                                                        rankingItem,
                                                                                        r'''$.placeSeason''',
                                                                                      ),
                                                                                      10),
                                                                                  ParamType.int,
                                                                                ),
                                                                                'title': serializeParam(
                                                                                  '${widget.title} - Dit seizoen',
                                                                                  ParamType.String,
                                                                                ),
                                                                                'myRank': serializeParam(
                                                                                  getJsonField(
                                                                                    rankingItem,
                                                                                    r'''$.placeSeason''',
                                                                                  ),
                                                                                  ParamType.int,
                                                                                ),
                                                                                'myTime': serializeParam(
                                                                                  ApiGroup.raceListCall
                                                                                      .scoreTime(
                                                                                        containerRaceListResponse.jsonBody,
                                                                                      )
                                                                                      .toString(),
                                                                                  ParamType.String,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).text,
                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                valueOrDefault<String>(
                                                                                  functions.placementFunction(getJsonField(
                                                                                    rankingItem,
                                                                                    r'''$.placeSeason''',
                                                                                  )),
                                                                                  '1',
                                                                                ),
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: FlutterFlowTheme.of(context).text3,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'containerOnPageLoadAnimation2']!),
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ).animateOnPageLoad(
                                  animationsMap['tabBarOnPageLoadAnimation']!),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  if (_model.loading)
                    wrapWithModel(
                      model: _model.loaderComponentModel,
                      updateCallback: () => setState(() {}),
                      child: const LoaderComponentWidget(),
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
