import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/app_drawer/app_drawer_widget.dart';
import '/pages/generic/base_header/base_header_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'contests_model.dart';
export 'contests_model.dart';

class ContestsWidget extends StatefulWidget {
  const ContestsWidget({super.key});

  @override
  _ContestsWidgetState createState() => _ContestsWidgetState();
}

class _ContestsWidgetState extends State<ContestsWidget> {
  late ContestsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContestsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().updateActivePageInfoStruct(
        (e) => e..activePage = PageId.Races,
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          15.0, 15.0, 15.0, 15.0),
                      child: FutureBuilder<ApiCallResponse>(
                        future: FFAppState().raceList(
                          uniqueQueryKey: FFAppState().activeUserId,
                          requestFn: () => ApiGroup.getContestsCall.call(
                            swimrankingsIdentifier: FFAppState().activeUserId,
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
                          final listViewGetContestsResponse = snapshot.data!;
                          return Builder(
                            builder: (context) {
                              final contest = ApiGroup.getContestsCall
                                      .contests(
                                        listViewGetContestsResponse.jsonBody,
                                      )
                                      ?.toList() ??
                                  [];
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: contest.length,
                                itemBuilder: (context, contestIndex) {
                                  final contestItem = contest[contestIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
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
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -1.00, 0.00),
                                                  child: Container(
                                                    decoration: const BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
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
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              getJsonField(
                                                                contestItem,
                                                                r'''$.city''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .text2,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                functions
                                                                    .convertCourseTypeToString(
                                                                        getJsonField(
                                                                  contestItem,
                                                                  r'''$.courseType''',
                                                                )),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .text2,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          getJsonField(
                                                            contestItem,
                                                            r'''$.date''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .text2,
                                                                fontSize: 12.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Icon(
                                                Icons.play_arrow,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 18.0,
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            height: 30.0,
                                            thickness: 1.0,
                                            color: FlutterFlowTheme.of(context)
                                                .accent4,
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
