import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  });

  final int? style;
  final int? course;
  final String? title;

  @override
  _RaceListWidgetState createState() => _RaceListWidgetState();
}

class _RaceListWidgetState extends State<RaceListWidget>
    with TickerProviderStateMixin {
  late RaceListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
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
        ),
        body: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/Topical_Micellair_Water_2.jpg',
                ).image,
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
              child: FutureBuilder<ApiCallResponse>(
                future: _model.raceDetailPage(
                  requestFn: () => ApiGroup.raceListCall.call(
                    deviceIdentifier: FFAppState().deviceIdentifier,
                    style: widget.style?.toString(),
                    course: widget.course?.toString(),
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
                  final containerRaceListResponse = snapshot.data!;
                  return Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.00, -1.00),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 16.0),
                            child: Text(
                              widget.title!,
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).text3,
                                  ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Align(
                                alignment: const Alignment(0.0, 0),
                                child: TabBar(
                                  labelColor: FlutterFlowTheme.of(context).text,
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      4.0, 4.0, 4.0, 4.0),
                                  tabs: const [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 16.0, 0.0),
                                          child: Icon(
                                            Icons.query_stats_outlined,
                                          ),
                                        ),
                                        Tab(
                                          text: 'Ranglijst',
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                  ],
                                  controller: _model.tabBarController,
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  controller: _model.tabBarController,
                                  children: [
                                    KeepAliveWidgetWrapper(
                                      builder: (context) => ListView(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 15.0, 15.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 40.0,
                                              decoration: const BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.00, -1.00),
                                                      child: Text(
                                                        'Plaats',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                            0.00, -1.00),
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
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                            1.00, -1.00),
                                                    child: Text(
                                                      'Seizoen',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
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
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: ranking.length,
                                                  itemBuilder:
                                                      (context, rankingIndex) {
                                                    final rankingItem =
                                                        ranking[rankingIndex];
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  8.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 50.0,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
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
                                                                          -1.00,
                                                                          1.00),
                                                                      child:
                                                                          Text(
                                                                        getJsonField(
                                                                          rankingItem,
                                                                          r'''$.name''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
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
                                                                          -1.00,
                                                                          -1.00),
                                                                      child:
                                                                          Text(
                                                                        getJsonField(
                                                                          rankingItem,
                                                                          r'''$.ageGroup''',
                                                                        ).toString(),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
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
                                                                      1.00,
                                                                      0.00),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 50.0,
                                                                  height: 35.0,
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child:
                                                                      Visibility(
                                                                    visible: functions
                                                                        .hasValidPlacement(
                                                                            getJsonField(
                                                                      rankingItem,
                                                                      r'''$.placeAllTime''',
                                                                    )),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          'rankings',
                                                                          queryParameters:
                                                                              {
                                                                            'rankingId':
                                                                                serializeParam(
                                                                              getJsonField(
                                                                                rankingItem,
                                                                                r'''$.rankingIdAllTime''',
                                                                              ),
                                                                              ParamType.int,
                                                                            ),
                                                                            'fromRank':
                                                                                serializeParam(
                                                                              functions.addValues(
                                                                                  getJsonField(
                                                                                    rankingItem,
                                                                                    r'''$.placeAllTime''',
                                                                                  ),
                                                                                  -50),
                                                                              ParamType.int,
                                                                            ),
                                                                            'toRank':
                                                                                serializeParam(
                                                                              functions.addValues(
                                                                                  getJsonField(
                                                                                    rankingItem,
                                                                                    r'''$.placeAllTime''',
                                                                                  ),
                                                                                  10),
                                                                              ParamType.int,
                                                                            ),
                                                                            'title':
                                                                                serializeParam(
                                                                              '${widget.title} - Altijd',
                                                                              ParamType.String,
                                                                            ),
                                                                            'myRank':
                                                                                serializeParam(
                                                                              getJsonField(
                                                                                rankingItem,
                                                                                r'''$.placeAllTime''',
                                                                              ),
                                                                              ParamType.int,
                                                                            ),
                                                                            'myTime':
                                                                                serializeParam(
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
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            double.infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).text,
                                                                          borderRadius:
                                                                              BorderRadius.circular(16.0),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              0.00,
                                                                              0.00),
                                                                          child:
                                                                              Text(
                                                                            functions.placementFunction(getJsonField(
                                                                              rankingItem,
                                                                              r'''$.placeAllTime''',
                                                                            )),
                                                                            textAlign:
                                                                                TextAlign.center,
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
                                                                      1.00,
                                                                      0.00),
                                                              child: Container(
                                                                width: 50.0,
                                                                height: 35.0,
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
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          'rankings',
                                                                          queryParameters:
                                                                              {
                                                                            'rankingId':
                                                                                serializeParam(
                                                                              getJsonField(
                                                                                rankingItem,
                                                                                r'''$.rankingIdSeason''',
                                                                              ),
                                                                              ParamType.int,
                                                                            ),
                                                                            'fromRank':
                                                                                serializeParam(
                                                                              functions.addValues(
                                                                                  getJsonField(
                                                                                    rankingItem,
                                                                                    r'''$.placeSeason''',
                                                                                  ),
                                                                                  -50),
                                                                              ParamType.int,
                                                                            ),
                                                                            'toRank':
                                                                                serializeParam(
                                                                              functions.addValues(
                                                                                  getJsonField(
                                                                                    rankingItem,
                                                                                    r'''$.placeSeason''',
                                                                                  ),
                                                                                  10),
                                                                              ParamType.int,
                                                                            ),
                                                                            'title':
                                                                                serializeParam(
                                                                              '${widget.title} - Dit seizoen',
                                                                              ParamType.String,
                                                                            ),
                                                                            'myRank':
                                                                                serializeParam(
                                                                              getJsonField(
                                                                                rankingItem,
                                                                                r'''$.placeSeason''',
                                                                              ),
                                                                              ParamType.int,
                                                                            ),
                                                                            'myTime':
                                                                                serializeParam(
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
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            double.infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).text,
                                                                          borderRadius:
                                                                              BorderRadius.circular(16.0),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              0.00,
                                                                              0.00),
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              functions.placementFunction(getJsonField(
                                                                                rankingItem,
                                                                                r'''$.placeSeason''',
                                                                              )),
                                                                              '1',
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
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
                                                      ),
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
                                        scrollDirection: Axis.vertical,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 15.0, 15.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 25.0,
                                              decoration: const BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: 275.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        1.0,
                                                    decoration: const BoxDecoration(),
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
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -1.00,
                                                                    0.00),
                                                            child: Container(
                                                              width: 150.0,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  1.0,
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.00,
                                                                      0.00),
                                                              child: Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        -1.00,
                                                                        0.00),
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .text3,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.00,
                                                                      0.00),
                                                              child: Container(
                                                                width: 75.0,
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child: Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.00,
                                                                          0.00),
                                                                  child: Text(
                                                                    'Tijd',
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
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
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
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'genericLoader',
                                                          queryParameters: {
                                                            'loadingMessage':
                                                                serializeParam(
                                                              'Wij zijn jou wedstrijd gegevens aan het verzamelen..  Even geduld A.U.B.',
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );

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
                                                          styleId: widget.style
                                                              ?.toString(),
                                                        );
                                                        if ((_model.clubIdResult
                                                                ?.succeeded ??
                                                            true)) {
                                                          if (Navigator.of(
                                                                  context)
                                                              .canPop()) {
                                                            context.pop();
                                                          }
                                                          context.pushNamed(
                                                            'contestDetail',
                                                            queryParameters: {
                                                              'clubId':
                                                                  serializeParam(
                                                                ApiGroup
                                                                    .swimTimeToClubIdCall
                                                                    .clubId(
                                                                      (_model.clubIdResult
                                                                              ?.jsonBody ??
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
                                                                      (_model.clubIdResult
                                                                              ?.jsonBody ??
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
                                                            context: context,
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
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: const Text(
                                                                        'Ok'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                          context.safePop();
                                                        }

                                                        setState(() {});
                                                      },
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 50.0,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              width: 275.0,
                                                              height: MediaQuery
                                                                          .sizeOf(
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
                                                                      alignment: const AlignmentDirectional(
                                                                          -1.00,
                                                                          0.00),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            1.0,
                                                                        decoration:
                                                                            const BoxDecoration(),
                                                                        alignment: const AlignmentDirectional(
                                                                            0.00,
                                                                            0.00),
                                                                        child:
                                                                            Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              -1.00,
                                                                              0.00),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Align(
                                                                                alignment: const AlignmentDirectional(-1.00, 0.00),
                                                                                child: Text(
                                                                                  getJsonField(
                                                                                    raceItem,
                                                                                    r'''$.place''',
                                                                                  ).toString(),
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: FlutterFlowTheme.of(context).text2,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Align(
                                                                                alignment: const AlignmentDirectional(-1.00, 0.00),
                                                                                child: Text(
                                                                                  getJsonField(
                                                                                    raceItem,
                                                                                    r'''$.date''',
                                                                                  ).toString(),
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
                                                                        alignment: const AlignmentDirectional(
                                                                            0.00,
                                                                            0.00),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              75.0,
                                                                          decoration:
                                                                              const BoxDecoration(),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(0.00, 0.00),
                                                                            child:
                                                                                Text(
                                                                              getJsonField(
                                                                                raceItem,
                                                                                r'''$.time''',
                                                                              ).toString(),
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
                                                              child: Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        1.00,
                                                                        0.00),
                                                                child:
                                                                    LinearPercentIndicator(
                                                                  percent: functions
                                                                      .calculatePercentage(
                                                                          getJsonField(
                                                                            raceItem,
                                                                            r'''$.points''',
                                                                          ),
                                                                          ApiGroup
                                                                              .raceListCall
                                                                              .max(
                                                                            containerRaceListResponse.jsonBody,
                                                                          )),
                                                                  lineHeight:
                                                                      50.0,
                                                                  animation:
                                                                      false,
                                                                  animateFromLastPercent:
                                                                      true,
                                                                  progressColor:
                                                                      const Color(
                                                                          0xFFBE9E44),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .text3,
                                                                  center: Text(
                                                                    getJsonField(
                                                                      raceItem,
                                                                      r'''$.points''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                  barRadius: const Radius
                                                                      .circular(
                                                                          0.0),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
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
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
