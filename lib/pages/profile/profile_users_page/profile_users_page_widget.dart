import '/backend/schema/enums/enums.dart';
import '/components/premium_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/swimrankings_list_item/swimrankings_list_item_widget.dart';
import '/pages/profile/active_user_switch/active_user_switch_widget.dart';
import '/pages/profile/favorite_bottom_sheet/favorite_bottom_sheet_widget.dart';
import '/pages/profile/premium_required/premium_required_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'profile_users_page_model.dart';
export 'profile_users_page_model.dart';

class ProfileUsersPageWidget extends StatefulWidget {
  const ProfileUsersPageWidget({super.key});

  @override
  _ProfileUsersPageWidgetState createState() => _ProfileUsersPageWidgetState();
}

class _ProfileUsersPageWidgetState extends State<ProfileUsersPageWidget>
    with TickerProviderStateMixin {
  late ProfileUsersPageModel _model;

  final animationsMap = {
    'columnOnPageLoadAnimation1': AnimationInfo(
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
    'columnOnPageLoadAnimation2': AnimationInfo(
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
    'columnOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 450.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 50.0),
          end: const Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 450.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'listViewOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 800.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'listViewOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 800.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileUsersPageModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            wrapWithModel(
              model: _model.premiumButtonModel,
              updateCallback: () => setState(() {}),
              child: const PremiumButtonWidget(),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: Text(
                      'Momenteel zien wij de data van',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).text2,
                          ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: Text(
                          getJsonField(
                            FFAppState().user,
                            r'''$.active.fullName''',
                          ).toString(),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).text3,
                                    fontSize: 18.0,
                                  ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: Text(
                          ' (${getJsonField(
                            FFAppState().user,
                            r'''$.active.birthYear''',
                          ).toString()})',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).text3,
                                    fontSize: 18.0,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation1']!),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 8.0),
                    child: Text(
                      'Account verbonden met',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).text2,
                          ),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: const ActiveUserSwitchWidget(),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                  child: wrapWithModel(
                    model: _model.swimrankingsListItemModel1,
                    updateCallback: () => setState(() {}),
                    child: SwimrankingsListItemWidget(
                      name: valueOrDefault<String>(
                        getJsonField(
                          FFAppState().user,
                          r'''$.me.fullName''',
                        )?.toString(),
                        'Onbekend',
                      ),
                      date: valueOrDefault<String>(
                        getJsonField(
                          FFAppState().user,
                          r'''$.me.birthYear''',
                        )?.toString(),
                        '-',
                      ),
                    ),
                  ),
                ),
              ],
            ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation2']!),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Text(
                          'Favoriete zwemmers',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).text2,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
                Builder(
                  builder: (context) {
                    if ((!FFAppState().premium &&
                            (functions.greaterThan(
                                    getJsonField(
                                      FFAppState().user,
                                      r'''$.favoriteCount''',
                                    ),
                                    3) ==
                                false)) ||
                        FFAppState().premium) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'LinkSwimrankings',
                            queryParameters: {
                              'showHeader': serializeParam(
                                true,
                                ParamType.bool,
                              ),
                              'isFavorite': serializeParam(
                                true,
                                ParamType.bool,
                              ),
                              'addState': serializeParam(
                                UserAddState.AsFavorite,
                                ParamType.Enum,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50.0,
                          decoration: const BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.add,
                                  color: FlutterFlowTheme.of(context).text3,
                                  size: 24.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Nieuwe favoriet toevoegen',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color:
                                            FlutterFlowTheme.of(context).text3,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Builder(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: const AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: const PremiumRequiredWidget(
                                    description:
                                        'Om meer favorieten toe te voegen heb je een premium account nodig!',
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50.0,
                            decoration: const BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 0.0),
                                  child: Icon(
                                    Icons.add,
                                    color: FlutterFlowTheme.of(context).text3,
                                    size: 24.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Nieuwe favoriet toevoegen',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .text3,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
                Container(
                  decoration: const BoxDecoration(),
                  child: Builder(
                    builder: (context) {
                      if (!FFAppState().premium) {
                        return Builder(
                          builder: (context) {
                            final favoriteSwimmer = getJsonField(
                              FFAppState().user,
                              r'''$.favorites''',
                            ).toList().take(4).toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: favoriteSwimmer.length,
                              itemBuilder: (context, favoriteSwimmerIndex) {
                                final favoriteSwimmerItem =
                                    favoriteSwimmer[favoriteSwimmerIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: FavoriteBottomSheetWidget(
                                            favoriteAthleteId: getJsonField(
                                              favoriteSwimmerItem,
                                              r'''$.athleteId''',
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: SwimrankingsListItemWidget(
                                    key: Key(
                                        'Key3im_${favoriteSwimmerIndex}_of_${favoriteSwimmer.length}'),
                                    name: valueOrDefault<String>(
                                      getJsonField(
                                        favoriteSwimmerItem,
                                        r'''$.fullName''',
                                      )?.toString(),
                                      'Onbekend',
                                    ),
                                    date: valueOrDefault<String>(
                                      getJsonField(
                                        favoriteSwimmerItem,
                                        r'''$.birthYear''',
                                      )?.toString(),
                                      '-',
                                    ),
                                  ),
                                );
                              },
                            ).animateOnPageLoad(
                                animationsMap['listViewOnPageLoadAnimation1']!);
                          },
                        );
                      } else {
                        return Builder(
                          builder: (context) {
                            final favoriteSwimmer = getJsonField(
                              FFAppState().user,
                              r'''$.favorites''',
                            ).toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: favoriteSwimmer.length,
                              itemBuilder: (context, favoriteSwimmerIndex) {
                                final favoriteSwimmerItem =
                                    favoriteSwimmer[favoriteSwimmerIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: FavoriteBottomSheetWidget(
                                            favoriteAthleteId: getJsonField(
                                              favoriteSwimmerItem,
                                              r'''$.athleteId''',
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: SwimrankingsListItemWidget(
                                    key: Key(
                                        'Keynvu_${favoriteSwimmerIndex}_of_${favoriteSwimmer.length}'),
                                    name: valueOrDefault<String>(
                                      getJsonField(
                                        favoriteSwimmerItem,
                                        r'''$.fullName''',
                                      )?.toString(),
                                      'Onbekend',
                                    ),
                                    date: valueOrDefault<String>(
                                      getJsonField(
                                        favoriteSwimmerItem,
                                        r'''$.birthYear''',
                                      )?.toString(),
                                      '-',
                                    ),
                                  ),
                                );
                              },
                            ).animateOnPageLoad(
                                animationsMap['listViewOnPageLoadAnimation2']!);
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation3']!),
          ],
        ),
      ),
    );
  }
}
