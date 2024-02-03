import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bottom_navigator_model.dart';
export 'bottom_navigator_model.dart';

class BottomNavigatorWidget extends StatefulWidget {
  const BottomNavigatorWidget({super.key});

  @override
  State<BottomNavigatorWidget> createState() => _BottomNavigatorWidgetState();
}

class _BottomNavigatorWidgetState extends State<BottomNavigatorWidget> {
  late BottomNavigatorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomNavigatorModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: 65.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primary,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('BOTTOM_NAVIGATOR_Container_xm077wzi_ON_T');
                  logFirebaseEvent('Container_navigate_to');

                  context.goNamed(
                    'Dashboard',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );

                  logFirebaseEvent('Container_update_app_state');
                  setState(() {
                    FFAppState().activePageInfo = ActivePageInfoStruct(
                      activePage: PageId.Dashboard,
                    );
                  });
                },
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home_sharp,
                        color: valueOrDefault<Color>(
                          FFAppState().activePageInfo.activePage ==
                                  PageId.Dashboard
                              ? FlutterFlowTheme.of(context).text
                              : FlutterFlowTheme.of(context).text2,
                          FlutterFlowTheme.of(context).text2,
                        ),
                        size: 24.0,
                      ),
                      Text(
                        'Dashboard',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: valueOrDefault<Color>(
                                FFAppState().activePageInfo.activePage ==
                                        PageId.Dashboard
                                    ? FlutterFlowTheme.of(context).text
                                    : FlutterFlowTheme.of(context).text2,
                                FlutterFlowTheme.of(context).text2,
                              ),
                              fontSize: 12.0,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('BOTTOM_NAVIGATOR_Container_suqpx8j0_ON_T');
                  logFirebaseEvent('Container_navigate_to');

                  context.goNamed(
                    'personalRecords',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );

                  logFirebaseEvent('Container_update_app_state');
                  setState(() {
                    FFAppState().activePageInfo = ActivePageInfoStruct(
                      activePage: PageId.PersonalRecords,
                    );
                  });
                },
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.fiber_smart_record_outlined,
                        color: valueOrDefault<Color>(
                          FFAppState().activePageInfo.activePage ==
                                  PageId.PersonalRecords
                              ? FlutterFlowTheme.of(context).text
                              : FlutterFlowTheme.of(context).text2,
                          FlutterFlowTheme.of(context).text2,
                        ),
                        size: 24.0,
                      ),
                      Text(
                        'Records',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: valueOrDefault<Color>(
                                FFAppState().activePageInfo.activePage ==
                                        PageId.PersonalRecords
                                    ? FlutterFlowTheme.of(context).text
                                    : FlutterFlowTheme.of(context).text2,
                                FlutterFlowTheme.of(context).text2,
                              ),
                              fontSize: 12.0,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('BOTTOM_NAVIGATOR_Container_lre1rpuc_ON_T');
                  logFirebaseEvent('Container_navigate_to');

                  context.goNamed(
                    'contests',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );

                  logFirebaseEvent('Container_update_app_state');
                  setState(() {
                    FFAppState().activePageInfo = ActivePageInfoStruct(
                      activePage: PageId.Races,
                    );
                  });
                },
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.rocket_launch_outlined,
                        color: valueOrDefault<Color>(
                          FFAppState().activePageInfo.activePage == PageId.Races
                              ? FlutterFlowTheme.of(context).text
                              : FlutterFlowTheme.of(context).text2,
                          FlutterFlowTheme.of(context).text2,
                        ),
                        size: 24.0,
                      ),
                      Text(
                        'Wedstrijden',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: valueOrDefault<Color>(
                                FFAppState().activePageInfo.activePage ==
                                        PageId.Races
                                    ? FlutterFlowTheme.of(context).text
                                    : FlutterFlowTheme.of(context).text2,
                                FlutterFlowTheme.of(context).text2,
                              ),
                              fontSize: 12.0,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('BOTTOM_NAVIGATOR_Container_ba7h0scw_ON_T');
                  logFirebaseEvent('Container_navigate_to');

                  context.goNamed(
                    'profile',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );

                  logFirebaseEvent('Container_update_app_state');
                  setState(() {
                    FFAppState().activePageInfo = ActivePageInfoStruct(
                      activePage: PageId.Profile,
                    );
                  });
                },
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person_outline,
                        color: valueOrDefault<Color>(
                          FFAppState().activePageInfo.activePage ==
                                  PageId.Profile
                              ? FlutterFlowTheme.of(context).text
                              : FlutterFlowTheme.of(context).text2,
                          FlutterFlowTheme.of(context).text2,
                        ),
                        size: 24.0,
                      ),
                      Text(
                        'Profiel',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: valueOrDefault<Color>(
                                FFAppState().activePageInfo.activePage ==
                                        PageId.Profile
                                    ? FlutterFlowTheme.of(context).text
                                    : FlutterFlowTheme.of(context).text2,
                                FlutterFlowTheme.of(context).text2,
                              ),
                              fontSize: 12.0,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
