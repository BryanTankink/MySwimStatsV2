import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'achievement_category_details_model.dart';
export 'achievement_category_details_model.dart';

class AchievementCategoryDetailsWidget extends StatefulWidget {
  const AchievementCategoryDetailsWidget({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  final String? categoryId;
  final String? categoryName;

  @override
  State<AchievementCategoryDetailsWidget> createState() =>
      _AchievementCategoryDetailsWidgetState();
}

class _AchievementCategoryDetailsWidgetState
    extends State<AchievementCategoryDetailsWidget>
    with TickerProviderStateMixin {
  late AchievementCategoryDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'staggeredViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
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
    'containerOnPageLoadAnimation': AnimationInfo(
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
    _model = createModel(context, () => AchievementCategoryDetailsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AchievementCategoryDetails'});
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
              logFirebaseEvent('ACHIEVEMENT_CATEGORY_DETAILS_arrow_left_');
              logFirebaseEvent('IconButton_haptic_feedback');
              HapticFeedback.selectionClick();
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            widget.categoryName!,
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
                  future: ApiGroup.getAchievementsInCategoryCall.call(
                    deviceIdentifier: FFAppState().deviceIdentifier,
                    categoryId: widget.categoryId,
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
                    final staggeredViewGetAchievementsInCategoryResponse =
                        snapshot.data!;
                    return Builder(
                      builder: (context) {
                        final achievement =
                            ApiGroup.getAchievementsInCategoryCall
                                    .achievements(
                                      staggeredViewGetAchievementsInCategoryResponse
                                          .jsonBody,
                                    )
                                    ?.toList() ??
                                [];
                        return MasonryGridView.builder(
                          gridDelegate:
                              const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          itemCount: achievement.length,
                          itemBuilder: (context, achievementIndex) {
                            final achievementItem =
                                achievement[achievementIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'ACHIEVEMENT_CATEGORY_DETAILS_Container_2');
                                logFirebaseEvent('Container_haptic_feedback');
                                HapticFeedback.selectionClick();
                                logFirebaseEvent('Container_navigate_to');

                                context.pushNamed(
                                  'AchievementLevels',
                                  queryParameters: {
                                    'title': serializeParam(
                                      getJsonField(
                                        achievementItem,
                                        r'''$.name''',
                                      ).toString(),
                                      ParamType.String,
                                    ),
                                    'achievement': serializeParam(
                                      achievementItem,
                                      ParamType.JSON,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                height: 170.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).cards,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 0.0),
                                      child: Container(
                                        width: 60.0,
                                        height: 60.0,
                                        decoration: const BoxDecoration(),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: CachedNetworkImage(
                                            fadeInDuration:
                                                const Duration(milliseconds: 500),
                                            fadeOutDuration:
                                                const Duration(milliseconds: 500),
                                            imageUrl:
                                                'https://myswimstats.nl/${getJsonField(
                                              achievementItem,
                                              r'''$.level.badge''',
                                            ).toString()}',
                                            width: 300.0,
                                            height: 200.0,
                                            fit: BoxFit.cover,
                                            errorWidget:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              'assets/images/error_image.webp',
                                              width: 300.0,
                                              height: 200.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: AutoSizeText(
                                          getJsonField(
                                            achievementItem,
                                            r'''$.name''',
                                          ).toString(),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .text3,
                                              ),
                                          minFontSize: 11.0,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 1.0),
                                        child: AutoSizeText(
                                          getJsonField(
                                            achievementItem,
                                            r'''$.level.name''',
                                          ).toString(),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .text3,
                                                fontSize: 12.0,
                                              ),
                                          minFontSize: 8.0,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 1.0),
                                      child: LinearPercentIndicator(
                                        percent: functions.calculatePercentage(
                                            getJsonField(
                                              achievementItem,
                                              r'''$.level.level''',
                                            ),
                                            getJsonField(
                                              achievementItem,
                                              r'''$.levelCount''',
                                            )),
                                        lineHeight: 18.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor:
                                            FlutterFlowTheme.of(context).text,
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                        center: Text(
                                          '${getJsonField(
                                            achievementItem,
                                            r'''$.level.level''',
                                          ).toString()} / ${getJsonField(
                                            achievementItem,
                                            r'''$.levelCount''',
                                          ).toString()}',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 12.0,
                                              ),
                                        ),
                                        barRadius: const Radius.circular(15.0),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ).animateOnPageLoad(
                                animationsMap['containerOnPageLoadAnimation']!);
                          },
                        ).animateOnPageLoad(
                            animationsMap['staggeredViewOnPageLoadAnimation']!);
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
