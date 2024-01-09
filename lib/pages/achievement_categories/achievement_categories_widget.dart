import '/backend/api_requests/api_calls.dart';
import '/components/achievement_category_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'achievement_categories_model.dart';
export 'achievement_categories_model.dart';

class AchievementCategoriesWidget extends StatefulWidget {
  const AchievementCategoriesWidget({super.key});

  @override
  _AchievementCategoriesWidgetState createState() =>
      _AchievementCategoriesWidgetState();
}

class _AchievementCategoriesWidgetState
    extends State<AchievementCategoriesWidget> with TickerProviderStateMixin {
  late AchievementCategoriesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'listViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'achievementCategoryOnPageLoadAnimation': AnimationInfo(
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
    _model = createModel(context, () => AchievementCategoriesModel());
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
            'Achievements',
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
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  'https://myswimstats.nl/Content/Images/General/background.webp',
                ),
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
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FutureBuilder<ApiCallResponse>(
                  future: ApiGroup.getAchievementCategoriesCall.call(
                    deviceIdentifier: FFAppState().deviceIdentifier,
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
                    final listViewGetAchievementCategoriesResponse =
                        snapshot.data!;
                    return Builder(
                      builder: (context) {
                        final category = ApiGroup.getAchievementCategoriesCall
                                .categories(
                                  listViewGetAchievementCategoriesResponse
                                      .jsonBody,
                                )
                                ?.toList() ??
                            [];
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: category.length,
                          itemBuilder: (context, categoryIndex) {
                            final categoryItem = category[categoryIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                HapticFeedback.selectionClick();

                                context.pushNamed(
                                  'AchievementCategoryDetails',
                                  queryParameters: {
                                    'categoryId': serializeParam(
                                      getJsonField(
                                        categoryItem,
                                        r'''$.id''',
                                      ).toString(),
                                      ParamType.String,
                                    ),
                                    'categoryName': serializeParam(
                                      functions.achievementCategoryIdToName(
                                          getJsonField(
                                        categoryItem,
                                        r'''$.id''',
                                      ).toString()),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: AchievementCategoryWidget(
                                key: Key(
                                    'Key38n_${categoryIndex}_of_${category.length}'),
                                categoryHeader: functions
                                    .achievementCategoryIdToName(getJsonField(
                                  categoryItem,
                                  r'''$.id''',
                                ).toString()),
                                level: getJsonField(
                                  categoryItem,
                                  r'''$.categoryLevel.level''',
                                ),
                                categoryLevelName: getJsonField(
                                  categoryItem,
                                  r'''$.categoryLevel.name''',
                                ).toString(),
                                currentScore: getJsonField(
                                  categoryItem,
                                  r'''$.myTotalCategoryLevel''',
                                ),
                                maxScore: getJsonField(
                                  categoryItem,
                                  r'''$.totalCategoryMaxLevel''',
                                ),
                                badgePath: getJsonField(
                                  categoryItem,
                                  r'''$.categoryLevel.badge''',
                                ).toString(),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'achievementCategoryOnPageLoadAnimation']!);
                          },
                        ).animateOnPageLoad(
                            animationsMap['listViewOnPageLoadAnimation']!);
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
