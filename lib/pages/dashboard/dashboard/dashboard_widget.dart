import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/dashboard/dashboard_tab_page/dashboard_tab_page_widget.dart';
import '/pages/generic/app_drawer/app_drawer_widget.dart';
import '/pages/generic/base_header/base_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dashboard_model.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key? key}) : super(key: key);

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget>
    with TickerProviderStateMixin {
  late DashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().updateActivePageInfoStruct(
        (e) => e..activePage = PageId.Dashboard,
      );
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
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
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.appDrawerModel,
            updateCallback: () => setState(() {}),
            child: AppDrawerWidget(),
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
                scaffoldKey.currentState!.openDrawer();
              },
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
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
                    Color(0xD9000000),
                    Color(0xF2000000)
                  ],
                  stops: [0.0, 0.25, 1.0],
                  begin: AlignmentDirectional(0.0, -1.0),
                  end: AlignmentDirectional(0, 1.0),
                ),
              ),
              child: FutureBuilder<ApiCallResponse>(
                future: FFAppState().dashboard(
                  uniqueQueryKey: FFAppState().activeUserId,
                  requestFn: () => ApiGroup.dashboardCall.call(
                    deviceIdentifier: FFAppState().deviceIdentifier,
                    athleteId: valueOrDefault<int>(
                      getJsonField(
                        FFAppState().user,
                        r'''$.active.athleteId''',
                      ),
                      0,
                    ),
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
                  final containerDashboardResponse = snapshot.data!;
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(),
                    child: Builder(
                      builder: (context) {
                        if (containerDashboardResponse.succeeded &&
                            ApiGroup.dashboardCall.isValid(
                              containerDashboardResponse.jsonBody,
                            )) {
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 16.0),
                                child: Text(
                                  'Informatie van: ${getJsonField(
                                    FFAppState().user,
                                    r'''$.active.fullName''',
                                  ).toString()}',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color:
                                            FlutterFlowTheme.of(context).text3,
                                      ),
                                ),
                              ),
                              if (FFAppState().premium)
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: FutureBuilder<ApiCallResponse>(
                                          future: FFAppState().dashboardGraph(
                                            uniqueQueryKey:
                                                FFAppState().activeUserId,
                                            requestFn: () => ApiGroup
                                                .dashboardGraphCall
                                                .call(
                                              swimrankingsIdentifier:
                                                  FFAppState().activeUserId,
                                            ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 25.0, 0.0, 25.0),
                                                  child: SizedBox(
                                                    width: 80.0,
                                                    height: 80.0,
                                                    child: SpinKitRipple(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .text,
                                                      size: 80.0,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            final chartDashboardGraphResponse =
                                                snapshot.data!;
                                            return Container(
                                              width: double.infinity,
                                              height: 150.0,
                                              child: FlutterFlowLineChart(
                                                data: [
                                                  FFLineChartData(
                                                    xData: ApiGroup
                                                        .dashboardGraphCall
                                                        .years(
                                                      chartDashboardGraphResponse
                                                          .jsonBody,
                                                    )!,
                                                    yData: ApiGroup
                                                        .dashboardGraphCall
                                                        .points(
                                                      chartDashboardGraphResponse
                                                          .jsonBody,
                                                    )!,
                                                    settings: LineChartBarData(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      barWidth: 2.0,
                                                      isCurved: true,
                                                    ),
                                                  )
                                                ],
                                                chartStylingInfo:
                                                    ChartStylingInfo(
                                                  enableTooltip: true,
                                                  backgroundColor:
                                                      Color(0x00FFFFFF),
                                                  showBorder: false,
                                                ),
                                                axisBounds: AxisBounds(),
                                                xAxisLabelInfo: AxisLabelInfo(),
                                                yAxisLabelInfo: AxisLabelInfo(),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 16.0),
                                        child: Container(
                                          decoration: BoxDecoration(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment(0.0, 0),
                                      child: TabBar(
                                        isScrollable: true,
                                        labelColor:
                                            FlutterFlowTheme.of(context).text,
                                        unselectedLabelColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 14.0,
                                            ),
                                        unselectedLabelStyle: TextStyle(),
                                        indicatorColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 4.0, 4.0, 4.0),
                                        tabs: [
                                          Tab(
                                            key: ValueKey('Tab_uw2r'),
                                            text: 'Vlinderslag',
                                          ),
                                          Tab(
                                            text: 'Rugcrawl',
                                          ),
                                          Tab(
                                            text: 'Schoolslag',
                                          ),
                                          Tab(
                                            text: 'Vrije slag',
                                          ),
                                          Tab(
                                            text: 'Wisselslag',
                                          ),
                                        ],
                                        controller: _model.tabBarController,
                                      ),
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        controller: _model.tabBarController,
                                        children: [
                                          Align(
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: wrapWithModel(
                                              model:
                                                  _model.dashboardTabPageModel1,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: DashboardTabPageWidget(
                                                strokes: ApiGroup.dashboardCall
                                                    .butterflyPerformances(
                                                  containerDashboardResponse
                                                      .jsonBody,
                                                )!,
                                              ),
                                            ),
                                          ),
                                          wrapWithModel(
                                            model:
                                                _model.dashboardTabPageModel2,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: DashboardTabPageWidget(
                                              strokes: ApiGroup.dashboardCall
                                                  .backstrokePerformances(
                                                containerDashboardResponse
                                                    .jsonBody,
                                              )!,
                                            ),
                                          ),
                                          wrapWithModel(
                                            model:
                                                _model.dashboardTabPageModel3,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: DashboardTabPageWidget(
                                              strokes: ApiGroup.dashboardCall
                                                  .breaststrokePerformances(
                                                containerDashboardResponse
                                                    .jsonBody,
                                              )!,
                                            ),
                                          ),
                                          wrapWithModel(
                                            model:
                                                _model.dashboardTabPageModel4,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: DashboardTabPageWidget(
                                              strokes: ApiGroup.dashboardCall
                                                  .freestylePerformances(
                                                containerDashboardResponse
                                                    .jsonBody,
                                              )!,
                                            ),
                                          ),
                                          wrapWithModel(
                                            model:
                                                _model.dashboardTabPageModel5,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: DashboardTabPageWidget(
                                              strokes: ApiGroup.dashboardCall
                                                  .medleyPerformances(
                                                containerDashboardResponse
                                                    .jsonBody,
                                              )!,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 150.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).error,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 8.0, 8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Oeps...',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium,
                                      ),
                                      Text(
                                        'Er is iets fout gegaan met jou account! helaas moeten wij hem opnieuw instellen.',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .text3,
                                            ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              context.goNamed('Onboarding');
                                            },
                                            text: 'Opnieuw instellen',
                                            options: FFButtonOptions(
                                              width: 230.0,
                                              height: 52.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge,
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      },
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
