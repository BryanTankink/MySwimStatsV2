import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/dashboard_performance_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/generic/app_drawer/app_drawer_widget.dart';
import '/pages/generic/base_header/base_header_widget.dart';
import '/pages/generic/swimrankings_list_item/swimrankings_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'personal_records_model.dart';
export 'personal_records_model.dart';

class PersonalRecordsWidget extends StatefulWidget {
  const PersonalRecordsWidget({super.key});

  @override
  _PersonalRecordsWidgetState createState() => _PersonalRecordsWidgetState();
}

class _PersonalRecordsWidgetState extends State<PersonalRecordsWidget> {
  late PersonalRecordsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PersonalRecordsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().activePageInfo = ActivePageInfoStruct(
        activePage: PageId.PersonalRecords,
      );
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
        backgroundColor: const Color(0xF1000000),
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
                    decoration: const BoxDecoration(),
                    child: Builder(
                      builder: (context) {
                        if (containerDashboardResponse.succeeded &&
                            ApiGroup.dashboardCall.isValid(
                              containerDashboardResponse.jsonBody,
                            )!) {
                          return Column(
                            mainAxisSize: MainAxisSize.max,
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
                                    HapticFeedback.selectionClick();

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
                                    child: SwimrankingsListItemWidget(
                                      name: valueOrDefault<String>(
                                        getJsonField(
                                          FFAppState().user,
                                          r'''$.active.fullName''',
                                        ).toString(),
                                        'Onbekend',
                                      ),
                                      date: valueOrDefault<String>(
                                        getJsonField(
                                          FFAppState().user,
                                          r'''$.active.birthYear''',
                                        ).toString(),
                                        '-',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model
                                        .dashboardPerformanceComponentModel,
                                    updateCallback: () => setState(() {}),
                                    child: DashboardPerformanceComponentWidget(
                                      dashboardperformances: getJsonField(
                                        containerDashboardResponse.jsonBody,
                                        r'''$.data.performances''',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 150.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).error,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              HapticFeedback.selectionClick();

                                              context.goNamed('Onboarding');
                                            },
                                            text: 'Opnieuw instellen',
                                            options: FFButtonOptions(
                                              width: 230.0,
                                              height: 52.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
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
