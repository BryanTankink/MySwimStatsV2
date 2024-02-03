import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/achievement_category_widget.dart';
import '/components/premium_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/menu_item/menu_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'app_drawer_model.dart';
export 'app_drawer_model.dart';

class AppDrawerWidget extends StatefulWidget {
  const AppDrawerWidget({super.key});

  @override
  State<AppDrawerWidget> createState() => _AppDrawerWidgetState();
}

class _AppDrawerWidgetState extends State<AppDrawerWidget> {
  late AppDrawerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppDrawerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
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
              FlutterFlowTheme.of(context).transitionMiddle,
              FlutterFlowTheme.of(context).primary
            ],
            stops: const [0.0, 0.25, 1.0],
            begin: const AlignmentDirectional(0.0, -1.0),
            end: const AlignmentDirectional(0, 1.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/logo_wide.webp',
                      width: 200.0,
                      height: 50.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Text(
                    'Hallo, ${getJsonField(
                      FFAppState().user,
                      r'''$.me.fullName''',
                    ).toString()}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).text3,
                        ),
                  ),
                ),
                wrapWithModel(
                  model: _model.premiumButtonModel,
                  updateCallback: () => setState(() {}),
                  child: const PremiumButtonWidget(),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('APP_DRAWER_Container_t0je5cr1_ON_TAP');
                    logFirebaseEvent('AchievementCategory_haptic_feedback');
                    HapticFeedback.selectionClick();
                    logFirebaseEvent('AchievementCategory_navigate_to');

                    context.pushNamed('AchievementCategories');
                  },
                  child: wrapWithModel(
                    model: _model.achievementCategoryModel,
                    updateCallback: () => setState(() {}),
                    child: AchievementCategoryWidget(
                      categoryHeader: 'Achievements',
                      level: getJsonField(
                        FFAppState().user,
                        r'''$.swimLevel.level''',
                      ),
                      categoryLevelName: getJsonField(
                        FFAppState().user,
                        r'''$.swimLevel.name''',
                      ).toString(),
                      currentScore: getJsonField(
                        FFAppState().user,
                        r'''$.achievementsObtained''',
                      ),
                      maxScore: getJsonField(
                        FFAppState().user,
                        r'''$.maxAchievements''',
                      ),
                      badgePath: getJsonField(
                        FFAppState().user,
                        r'''$.swimLevel.badge''',
                      ).toString(),
                    ),
                  ),
                ),
                Divider(
                  height: 32.0,
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).accent4,
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('APP_DRAWER_Container_a7m5a4me_ON_TAP');
                    logFirebaseEvent('menuItem_haptic_feedback');
                    HapticFeedback.selectionClick();
                    logFirebaseEvent('menuItem_update_app_state');
                    FFAppState().activePageInfo = ActivePageInfoStruct(
                      activePage: PageId.Dashboard,
                    );
                    logFirebaseEvent('menuItem_navigate_to');

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
                  },
                  child: wrapWithModel(
                    model: _model.menuItemModel1,
                    updateCallback: () => setState(() {}),
                    child: MenuItemWidget(
                      title: 'Dashboard',
                      icon: Icon(
                        Icons.home_outlined,
                        color: FlutterFlowTheme.of(context).text,
                        size: 24.0,
                      ),
                      isOnPage: FFAppState().activePageInfo.activePage ==
                          PageId.Dashboard,
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('APP_DRAWER_Container_h8njhkpa_ON_TAP');
                    logFirebaseEvent('menuItem_haptic_feedback');
                    HapticFeedback.selectionClick();
                    logFirebaseEvent('menuItem_update_app_state');
                    FFAppState().activePageInfo = ActivePageInfoStruct(
                      activePage: PageId.PersonalRecords,
                    );
                    logFirebaseEvent('menuItem_navigate_to');

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
                  },
                  child: wrapWithModel(
                    model: _model.menuItemModel2,
                    updateCallback: () => setState(() {}),
                    child: MenuItemWidget(
                      title: 'Persoonlijke records',
                      icon: Icon(
                        Icons.fiber_smart_record_outlined,
                        color: FlutterFlowTheme.of(context).text,
                        size: 24.0,
                      ),
                      isOnPage: FFAppState().activePageInfo.activePage ==
                          PageId.PersonalRecords,
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('APP_DRAWER_Container_bgmxb1cm_ON_TAP');
                    logFirebaseEvent('menuItem_haptic_feedback');
                    HapticFeedback.selectionClick();
                    logFirebaseEvent('menuItem_update_app_state');
                    FFAppState().activePageInfo = ActivePageInfoStruct(
                      activePage: PageId.Races,
                    );
                    logFirebaseEvent('menuItem_navigate_to');

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
                  },
                  child: wrapWithModel(
                    model: _model.menuItemModel3,
                    updateCallback: () => setState(() {}),
                    child: MenuItemWidget(
                      title: 'Wedstrijden',
                      icon: Icon(
                        Icons.rocket_launch_outlined,
                        color: FlutterFlowTheme.of(context).text,
                        size: 24.0,
                      ),
                      isOnPage: FFAppState().activePageInfo.activePage ==
                          PageId.Races,
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('APP_DRAWER_Container_cii57p22_ON_TAP');
                    logFirebaseEvent('menuItem_haptic_feedback');
                    HapticFeedback.selectionClick();
                    logFirebaseEvent('menuItem_update_app_state');
                    FFAppState().activePageInfo = ActivePageInfoStruct(
                      activePage: PageId.Profile,
                    );
                    logFirebaseEvent('menuItem_navigate_to');

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
                  },
                  child: wrapWithModel(
                    model: _model.menuItemModel4,
                    updateCallback: () => setState(() {}),
                    child: MenuItemWidget(
                      title: 'Profiel',
                      icon: Icon(
                        Icons.person_outline,
                        color: FlutterFlowTheme.of(context).text,
                        size: 24.0,
                      ),
                      isOnPage: FFAppState().activePageInfo.activePage ==
                          PageId.Profile,
                    ),
                  ),
                ),
                Divider(
                  height: 32.0,
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).accent4,
                ),
                if (FFAppState().premium)
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('APP_DRAWER_Container_n58r52h0_ON_TAP');
                      logFirebaseEvent('menuItem_haptic_feedback');
                      HapticFeedback.selectionClick();
                      logFirebaseEvent('menuItem_navigate_to');

                      context.pushNamed(
                        'advice',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: wrapWithModel(
                      model: _model.menuItemModel5,
                      updateCallback: () => setState(() {}),
                      child: MenuItemWidget(
                        title: 'Aanbevelingen',
                        icon: Icon(
                          Icons.eco_outlined,
                          color: FlutterFlowTheme.of(context).text,
                          size: 24.0,
                        ),
                        isOnPage: false,
                      ),
                    ),
                  ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('APP_DRAWER_Container_1fqjl64c_ON_TAP');
                    logFirebaseEvent('menuItem_haptic_feedback');
                    HapticFeedback.selectionClick();
                    logFirebaseEvent('menuItem_navigate_to');

                    context.pushNamed(
                      'compareAthleteFavorites',
                      queryParameters: {
                        'otherAthlete': serializeParam(
                          getJsonField(
                            FFAppState().user,
                            r'''$.active''',
                          ),
                          ParamType.JSON,
                        ),
                        'isComparer': serializeParam(
                          true,
                          ParamType.bool,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  child: wrapWithModel(
                    model: _model.menuItemModel6,
                    updateCallback: () => setState(() {}),
                    child: MenuItemWidget(
                      title: 'Vergelijken',
                      icon: Icon(
                        Icons.compare_arrows,
                        color: FlutterFlowTheme.of(context).text,
                        size: 24.0,
                      ),
                      isOnPage: false,
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('APP_DRAWER_Container_93dvbwew_ON_TAP');
                    logFirebaseEvent('menuItem_haptic_feedback');
                    HapticFeedback.selectionClick();
                    logFirebaseEvent('menuItem_navigate_to');

                    context.pushNamed(
                      'about',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  child: wrapWithModel(
                    model: _model.menuItemModel7,
                    updateCallback: () => setState(() {}),
                    child: MenuItemWidget(
                      title: 'Over de app',
                      icon: Icon(
                        Icons.all_out_rounded,
                        color: FlutterFlowTheme.of(context).text,
                        size: 24.0,
                      ),
                      isOnPage: false,
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
}
