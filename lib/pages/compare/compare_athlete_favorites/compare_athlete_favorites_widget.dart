import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/compare/no_favorites_component/no_favorites_component_widget.dart';
import '/pages/generic/swimrankings_list_item/swimrankings_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'compare_athlete_favorites_model.dart';
export 'compare_athlete_favorites_model.dart';

class CompareAthleteFavoritesWidget extends StatefulWidget {
  const CompareAthleteFavoritesWidget({
    super.key,
    required this.otherAthlete,
    bool? isComparer,
    this.doubleBack,
  }) : isComparer = isComparer ?? true;

  final dynamic otherAthlete;
  final bool isComparer;
  final bool? doubleBack;

  @override
  State<CompareAthleteFavoritesWidget> createState() =>
      _CompareAthleteFavoritesWidgetState();
}

class _CompareAthleteFavoritesWidgetState
    extends State<CompareAthleteFavoritesWidget> {
  late CompareAthleteFavoritesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompareAthleteFavoritesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'compareAthleteFavorites'});
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
        backgroundColor: const Color(0xD8000000),
        appBar: AppBar(
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
              logFirebaseEvent('COMPARE_ATHLETE_FAVORITES_arrow_left_ICN');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'Vergelijken',
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
                    const Color(0xDA000000),
                    const Color(0xF2000000)
                  ],
                  stops: const [0.0, 0.25, 1.0],
                  begin: const AlignmentDirectional(0.0, -1.0),
                  end: const AlignmentDirectional(0, 1.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: Text(
                        'Je gaat de gekozen persoon vergelijken met',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).text2,
                            ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Text(
                          getJsonField(
                            widget.otherAthlete,
                            r'''$.fullName''',
                          ).toString(),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).text3,
                                  ),
                        ),
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        final favorite = getJsonField(
                          FFAppState().user,
                          r'''$.favorites''',
                        ).toList();
                        if (favorite.isEmpty) {
                          return const Center(
                            child: NoFavoritesComponentWidget(),
                          );
                        }
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children:
                              List.generate(favorite.length, (favoriteIndex) {
                            final favoriteItem = favorite[favoriteIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'COMPARE_ATHLETE_FAVORITES_Container_ur5s');
                                logFirebaseEvent(
                                    'SwimrankingsListItem_navigate_to');
                                if (Navigator.of(context).canPop()) {
                                  context.pop();
                                }
                                context.pushNamed(
                                  'compareAthletes',
                                  queryParameters: {
                                    'personA': serializeParam(
                                      widget.isComparer
                                          ? widget.otherAthlete
                                          : favoriteItem,
                                      ParamType.JSON,
                                    ),
                                    'personB': serializeParam(
                                      widget.isComparer
                                          ? favoriteItem
                                          : widget.otherAthlete,
                                      ParamType.JSON,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: SwimrankingsListItemWidget(
                                key: Key(
                                    'Keyur5_${favoriteIndex}_of_${favorite.length}'),
                                name: getJsonField(
                                  favoriteItem,
                                  r'''$.fullName''',
                                ).toString(),
                                date: getJsonField(
                                  favoriteItem,
                                  r'''$.birthYear''',
                                ).toString(),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
