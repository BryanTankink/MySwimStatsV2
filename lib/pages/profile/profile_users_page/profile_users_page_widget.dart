import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/operation_button/operation_button_widget.dart';
import '/pages/generic/swimrankings_list_item/swimrankings_list_item_widget.dart';
import '/pages/profile/favorite_bottom_sheet/favorite_bottom_sheet_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_users_page_model.dart';
export 'profile_users_page_model.dart';

class ProfileUsersPageWidget extends StatefulWidget {
  const ProfileUsersPageWidget({Key? key}) : super(key: key);

  @override
  _ProfileUsersPageWidgetState createState() => _ProfileUsersPageWidgetState();
}

class _ProfileUsersPageWidgetState extends State<ProfileUsersPageWidget> {
  late ProfileUsersPageModel _model;

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
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (!FFAppState().premium)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: wrapWithModel(
                model: _model.operationButtonModel,
                updateCallback: () => setState(() {}),
                child: OperationButtonWidget(
                  text: 'Unlock premium',
                  onClick: () async {
                    _model.purchaseState = await revenue_cat.purchasePackage(
                        revenue_cat.offerings!.current!.monthly!.identifier);
                    if (_model.purchaseState!) {
                      await action_blocks.getUserAuth(context);

                      context.goNamed('Dashboard');
                    }

                    setState(() {});
                  },
                ),
              ),
            ),
          Align(
            alignment: AlignmentDirectional(-1.00, 0.00),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
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
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: Text(
                    getJsonField(
                      FFAppState().user,
                      r'''$.active.fullName''',
                    ).toString(),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).text3,
                          fontSize: 18.0,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: Text(
                    ' (${getJsonField(
                      FFAppState().user,
                      r'''$.active.birthYear''',
                    ).toString()})',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).text3,
                          fontSize: 18.0,
                        ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: AlignmentDirectional(-1.00, 0.00),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 8.0),
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
              context.pushNamed(
                'LinkSwimrankings',
                queryParameters: {
                  'showHeader': serializeParam(
                    true,
                    ParamType.bool,
                  ),
                  'isFavorite': serializeParam(
                    false,
                    ParamType.bool,
                  ),
                }.withoutNulls,
              );
            },
            child: wrapWithModel(
              model: _model.swimrankingsListItemModel1,
              updateCallback: () => setState(() {}),
              child: SwimrankingsListItemWidget(
                name: valueOrDefault<String>(
                  getJsonField(
                    FFAppState().user,
                    r'''$.me.fullName''',
                  ).toString(),
                  'Onbekend',
                ),
                date: valueOrDefault<String>(
                  getJsonField(
                    FFAppState().user,
                    r'''$.me.birthYear''',
                  ).toString(),
                  '-',
                ),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Text(
                    'Favoriete zwemmers',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
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
              if (revenue_cat.activeEntitlementIds
                      .contains(FFAppConstants.premiumEntitelment) ||
                  !functions.greaterThan(
                      valueOrDefault<int>(
                        functions.getJsonListCount(getJsonField(
                          FFAppState().user,
                          r'''$.favorites''',
                          true,
                        )!),
                        3,
                      ),
                      3) ||
                  isWeb) {
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
                      }.withoutNulls,
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.add,
                            color: FlutterFlowTheme.of(context).text3,
                            size: 24.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Nieuwe favoriet toevoegen',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).text3,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Container(
                  width: double.infinity,
                  height: 1.0,
                  decoration: BoxDecoration(),
                );
              }
            },
          ),
          Expanded(
            child: Builder(
              builder: (context) {
                final favoriteSwimmer = getJsonField(
                  FFAppState().user,
                  r'''$.favorites''',
                ).toList();
                return ListView.builder(
                  padding: EdgeInsets.zero,
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
                              padding: MediaQuery.viewInsetsOf(context),
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
                          ).toString(),
                          'Onbekend',
                        ),
                        date: valueOrDefault<String>(
                          getJsonField(
                            favoriteSwimmerItem,
                            r'''$.birthYear''',
                          ).toString(),
                          '-',
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
    );
  }
}
