import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/schema/enums/enums.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier, [Widget? entryPage]) =>
    GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Container(
                color: FlutterFlowTheme.of(context).primary,
                child: Center(
                  child: Image.asset(
                    'assets/images/logo_square.webp',
                    width: 125.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          : entryPage ?? const InitialLoadingWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: FlutterFlowTheme.of(context).primary,
                    child: Center(
                      child: Image.asset(
                        'assets/images/logo_square.webp',
                        width: 125.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              : entryPage ?? const InitialLoadingWidget(),
        ),
        FFRoute(
          name: 'Onboarding',
          path: '/onboarding',
          builder: (context, params) => const OnboardingWidget(),
        ),
        FFRoute(
          name: 'LinkSwimrankings',
          path: '/linkSwimrankings',
          builder: (context, params) => LinkSwimrankingsWidget(
            showHeader: params.getParam('showHeader', ParamType.bool),
            isFavorite: params.getParam('isFavorite', ParamType.bool),
            addState: params.getParam<UserAddState>('addState', ParamType.Enum),
          ),
        ),
        FFRoute(
          name: 'SwimRankingsLoading',
          path: '/swimRankingsLoading',
          builder: (context, params) => const SwimRankingsLoadingWidget(),
        ),
        FFRoute(
          name: 'InitialLoading',
          path: '/initialLoading',
          builder: (context, params) => const InitialLoadingWidget(),
        ),
        FFRoute(
          name: 'Dashboard',
          path: '/dashboard',
          builder: (context, params) => const DashboardWidget(),
        ),
        FFRoute(
          name: 'ListSwimrankingsAccounts',
          path: '/listSwimrankingsAccounts',
          builder: (context, params) => ListSwimrankingsAccountsWidget(
            accounts:
                params.getParam<dynamic>('accounts', ParamType.JSON, true),
            isFavorite: params.getParam('isFavorite', ParamType.bool),
            enteredName: params.getParam('enteredName', ParamType.String),
            addState: params.getParam<UserAddState>('addState', ParamType.Enum),
          ),
        ),
        FFRoute(
          name: 'RaceList',
          path: '/raceList',
          builder: (context, params) => RaceListWidget(
            style: params.getParam('style', ParamType.int),
            course: params.getParam('course', ParamType.int),
            title: params.getParam('title', ParamType.String),
            timeId: params.getParam('timeId', ParamType.int),
            year: params.getParam('year', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'rankings',
          path: '/rankings',
          builder: (context, params) => RankingsWidget(
            rankingId: params.getParam('rankingId', ParamType.int),
            fromRank: params.getParam('fromRank', ParamType.int),
            toRank: params.getParam('toRank', ParamType.int),
            title: params.getParam('title', ParamType.String),
            myRank: params.getParam('myRank', ParamType.int),
            myTime: params.getParam('myTime', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'advice',
          path: '/advice',
          builder: (context, params) => const AdviceWidget(),
        ),
        FFRoute(
          name: 'profile',
          path: '/profile',
          builder: (context, params) => ProfileWidget(
            distanceValueChanged:
                params.getParam('distanceValueChanged', ParamType.bool),
            page: params.getParam('page', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'contests',
          path: '/contests',
          builder: (context, params) => const ContestsWidget(),
        ),
        FFRoute(
          name: 'contestDetail',
          path: '/contestDetail',
          builder: (context, params) => ContestDetailWidget(
            raceName: params.getParam('raceName', ParamType.String),
            clubId: params.getParam('clubId', ParamType.String),
            contestId: params.getParam('contestId', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'adviceDetails',
          path: '/adviceDetails',
          builder: (context, params) => AdviceDetailsWidget(
            advice: params.getParam('advice', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'contestClubDetails',
          path: '/contestClubDetails',
          builder: (context, params) => ContestClubDetailsWidget(
            contestData: params.getParam('contestData', ParamType.JSON),
            raceName: params.getParam('raceName', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'genericLoader',
          path: '/genericLoader',
          builder: (context, params) => GenericLoaderWidget(
            loadingMessage: params.getParam('loadingMessage', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'personalRecords',
          path: '/personalRecords',
          builder: (context, params) => const PersonalRecordsWidget(),
        ),
        FFRoute(
          name: 'AchievementCategories',
          path: '/achievementCategories',
          builder: (context, params) => const AchievementCategoriesWidget(),
        ),
        FFRoute(
          name: 'AchievementCategoryDetails',
          path: '/achievementCategoryDetails',
          builder: (context, params) => AchievementCategoryDetailsWidget(
            categoryId: params.getParam('categoryId', ParamType.String),
            categoryName: params.getParam('categoryName', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'AchievementLevels',
          path: '/achievementLevels',
          builder: (context, params) => AchievementLevelsWidget(
            title: params.getParam('title', ParamType.String),
            achievement: params.getParam('achievement', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'growthDetails',
          path: '/growthDetails',
          builder: (context, params) => GrowthDetailsWidget(
            graphResult: params.getParam('graphResult', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'growthYearDetails',
          path: '/growthYearDetails',
          builder: (context, params) => GrowthYearDetailsWidget(
            yearInfo: params.getParam('yearInfo', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'compareAthletes',
          path: '/compareAthletes',
          builder: (context, params) => CompareAthletesWidget(
            personA: params.getParam('personA', ParamType.JSON),
            personB: params.getParam('personB', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'compareAthletesObtain',
          path: '/compareAthletesObtain',
          builder: (context, params) => const CompareAthletesObtainWidget(),
        ),
        FFRoute(
          name: 'compareAthleteFavorites',
          path: '/compareAthleteFavorites',
          builder: (context, params) => CompareAthleteFavoritesWidget(
            otherAthlete: params.getParam('otherAthlete', ParamType.JSON),
            isComparer: params.getParam('isComparer', ParamType.bool),
            doubleBack: params.getParam('doubleBack', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'about',
          path: '/about',
          builder: (context, params) => const AboutWidget(),
        ),
        FFRoute(
          name: 'achievementUsers',
          path: '/achievementUsers',
          builder: (context, params) => const AchievementUsersWidget(),
        ),
        FFRoute(
          name: 'ErrorPage',
          path: '/errorPage',
          builder: (context, params) => ErrorPageWidget(
            message: params.getParam('message', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'raceDetails',
          path: '/raceDetails',
          builder: (context, params) => RaceDetailsWidget(
            raceDetails: params.getParam('raceDetails', ParamType.JSON),
            event: params.getParam('event', ParamType.String),
            course: params.getParam('course', ParamType.String),
            style: params.getParam('style', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'ProfileQuickEdit',
          path: '/profileQuickEdit',
          builder: (context, params) => ProfileQuickEditWidget(
            page: params.getParam('page', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'DashboardV2',
          path: '/dashboardV2',
          builder: (context, params) => const DashboardV2Widget(),
        ),
        FFRoute(
          name: 'LimitsRaceList',
          path: '/limitsRaceList',
          builder: (context, params) => const LimitsRaceListWidget(),
        ),
        FFRoute(
          name: 'LimitsRace',
          path: '/limitsRace',
          builder: (context, params) => LimitsRaceWidget(
            raceName: params.getParam('raceName', ParamType.String),
            raceId: params.getParam('raceId', ParamType.String),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
