import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start API Group Code

class ApiGroup {
  static String baseUrl = 'https://myswimstats.nl/api/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static DashboardCall dashboardCall = DashboardCall();
  static CreateUserByDeviceIdentifierCall createUserByDeviceIdentifierCall =
      CreateUserByDeviceIdentifierCall();
  static AddFavoritedUserCall addFavoritedUserCall = AddFavoritedUserCall();
  static SetActiveUserCall setActiveUserCall = SetActiveUserCall();
  static RaceListCall raceListCall = RaceListCall();
  static DeleteFavoritedUserCall deleteFavoritedUserCall =
      DeleteFavoritedUserCall();
  static RankingsCall rankingsCall = RankingsCall();
  static AdvicesCall advicesCall = AdvicesCall();
  static ContestsCall contestsCall = ContestsCall();
  static GetContestsVTwoCall getContestsVTwoCall = GetContestsVTwoCall();
  static DashboardGraphCall dashboardGraphCall = DashboardGraphCall();
  static UpdateUserPropertyCall updateUserPropertyCall =
      UpdateUserPropertyCall();
  static UpdateUserDistancePropertiesCall updateUserDistancePropertiesCall =
      UpdateUserDistancePropertiesCall();
  static UpdateUserStrokePropertiesCall updateUserStrokePropertiesCall =
      UpdateUserStrokePropertiesCall();
  static GetContestsCall getContestsCall = GetContestsCall();
  static GetContestCall getContestCall = GetContestCall();
  static GetRecomendationsCountCall getRecomendationsCountCall =
      GetRecomendationsCountCall();
  static MarkRecomendationAsReadCall markRecomendationAsReadCall =
      MarkRecomendationAsReadCall();
  static SwimTimeToClubIdCall swimTimeToClubIdCall = SwimTimeToClubIdCall();
  static GetAchievementCategoriesCall getAchievementCategoriesCall =
      GetAchievementCategoriesCall();
  static GetAchievementsInCategoryCall getAchievementsInCategoryCall =
      GetAchievementsInCategoryCall();
  static PremiumStateCall premiumStateCall = PremiumStateCall();
  static CompareCall compareCall = CompareCall();
  static GetTopAthletesCall getTopAthletesCall = GetTopAthletesCall();
}

class DashboardCall {
  Future<ApiCallResponse> call({
    String? deviceIdentifier = '',
    int? athleteId = 0,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Dashboard',
      apiUrl: '${ApiGroup.baseUrl}Dashboard',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'deviceIdentifier': deviceIdentifier,
        'athleteId': athleteId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  bool? isValid(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.linkedAccount''',
      ));
  List? freestylePerformances(dynamic response) => getJsonField(
        response,
        r'''$.data.performances.freeStyle''',
        true,
      ) as List?;
  List? butterflyPerformances(dynamic response) => getJsonField(
        response,
        r'''$.data.performances.butterfly''',
        true,
      ) as List?;
  List? backstrokePerformances(dynamic response) => getJsonField(
        response,
        r'''$.data.performances.backstroke''',
        true,
      ) as List?;
  List? breaststrokePerformances(dynamic response) => getJsonField(
        response,
        r'''$.data.performances.breaststroke''',
        true,
      ) as List?;
  List? medleyPerformances(dynamic response) => getJsonField(
        response,
        r'''$.data.performances.medley''',
        true,
      ) as List?;
}

class CreateUserByDeviceIdentifierCall {
  Future<ApiCallResponse> call({
    String? deviceIdentifier = '',
    String? swimrankingsIdentifier = '',
    String? fullName = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Create user by device identifier',
      apiUrl: '${ApiGroup.baseUrl}User/CreateByDeviceIdentifier',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'deviceIdentifier': deviceIdentifier,
        'swimrankingsIdentifier': swimrankingsIdentifier,
        'fullName': fullName,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  bool? exists(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.exists''',
      ));
  dynamic activeUser(dynamic response) => getJsonField(
        response,
        r'''$.data.active''',
      );
  List? favorites(dynamic response) => getJsonField(
        response,
        r'''$.data.favorites''',
        true,
      ) as List?;
}

class AddFavoritedUserCall {
  Future<ApiCallResponse> call({
    String? deviceIdentifier = '',
    String? swimrankingsIdentifier = '',
    String? fullName = '',
    bool? isPremium,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Add favorited user',
      apiUrl: '${ApiGroup.baseUrl}User/AddFavoriteToUser',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'deviceIdentifier': deviceIdentifier,
        'swimrankingsIdentifier': swimrankingsIdentifier,
        'fullName': fullName,
        'isPremium': isPremium,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SetActiveUserCall {
  Future<ApiCallResponse> call({
    String? deviceIdentifier = '',
    String? swimrankingsIdentifier = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Set active user',
      apiUrl: '${ApiGroup.baseUrl}user/SetActiveUser',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'deviceIdentifier': deviceIdentifier,
        'swimrankingsIdentifier': swimrankingsIdentifier,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RaceListCall {
  Future<ApiCallResponse> call({
    String? deviceIdentifier = '',
    String? style = '',
    String? course = '',
    String? raceId = '-1',
    String? year = '-1',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'raceList',
      apiUrl: '${ApiGroup.baseUrl}Race/GetByStyle',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'deviceIdentifier': deviceIdentifier,
        'style': style,
        'course': course,
        'raceId': raceId,
        'year': year,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? races(dynamic response) => getJsonField(
        response,
        r'''$.data.races''',
        true,
      ) as List?;
  List? rankings(dynamic response) => getJsonField(
        response,
        r'''$.data.rankings''',
        true,
      ) as List?;
  int? max(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.maxScore''',
      ));
  String? scoreTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.maxScoreTime''',
      ));
  bool? hasRankings(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.hasRankings''',
      ));
  dynamic achievement(dynamic response) => getJsonField(
        response,
        r'''$.data.achievement''',
      );
  dynamic achievementLevel(dynamic response) => getJsonField(
        response,
        r'''$.data.achievement.level.level''',
      );
  dynamic achievementLevelName(dynamic response) => getJsonField(
        response,
        r'''$.data.achievement.level.name''',
      );
  dynamic achievementLebelBadge(dynamic response) => getJsonField(
        response,
        r'''$.data.achievement.level.badge''',
      );
  dynamic achievementLevelCount(dynamic response) => getJsonField(
        response,
        r'''$.data.achievement.levelCount''',
      );
  List? achievementLevels(dynamic response) => getJsonField(
        response,
        r'''$.data.achievement.levels''',
        true,
      ) as List?;
}

class DeleteFavoritedUserCall {
  Future<ApiCallResponse> call({
    String? deviceIdentifier = '',
    String? swimrankingsIdentifier = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete favorited user',
      apiUrl: '${ApiGroup.baseUrl}User/DeleteFavoriteFromUser',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'deviceIdentifier': deviceIdentifier,
        'swimrankingsIdentifier': swimrankingsIdentifier,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RankingsCall {
  Future<ApiCallResponse> call({
    String? rankingId = '',
    String? fromPlace = '',
    String? toPlace = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'rankings',
      apiUrl: '${ApiGroup.baseUrl}Ranking',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'rankingId': rankingId,
        'fromPlace': fromPlace,
        'toPlace': toPlace,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic from(dynamic response) => getJsonField(
        response,
        r'''$.data.fromResult''',
      );
  dynamic to(dynamic response) => getJsonField(
        response,
        r'''$.data.toResult''',
      );
  List? results(dynamic response) => getJsonField(
        response,
        r'''$.data.results''',
        true,
      ) as List?;
}

class AdvicesCall {
  Future<ApiCallResponse> call({
    String? athleteIdentifier = '',
    String? deviceIdentifier = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'advices',
      apiUrl: '${ApiGroup.baseUrl}Advice',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'athleteIdentifier': athleteIdentifier,
        'deviceIdentifier': deviceIdentifier,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? advices(dynamic response) => getJsonField(
        response,
        r'''$.data.advices''',
        true,
      ) as List?;
}

class ContestsCall {
  Future<ApiCallResponse> call({
    String? swimrankingsIdentifier = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Contests',
      apiUrl: '${ApiGroup.baseUrl}Contest',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'swimrankingsIdentifier': swimrankingsIdentifier,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetContestsVTwoCall {
  Future<ApiCallResponse> call({
    String? deviceIdentifier = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getContests VTwo',
      apiUrl: '${ApiGroup.baseUrl}Contest/ByDevice',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'deviceIdentifier': deviceIdentifier,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic amountOfRaces(dynamic response) => getJsonField(
        response,
        r'''$.data.count''',
      );
  List? contests(dynamic response) => getJsonField(
        response,
        r'''$.data.contests''',
        true,
      ) as List?;
  dynamic achievement(dynamic response) => getJsonField(
        response,
        r'''$.data.achievement''',
      );
  dynamic achievementLevel(dynamic response) => getJsonField(
        response,
        r'''$.data.achievement.level.level''',
      );
  dynamic achievementBadge(dynamic response) => getJsonField(
        response,
        r'''$.data.achievement.level.badge''',
      );
  dynamic achievementLevelName(dynamic response) => getJsonField(
        response,
        r'''$.data.achievement.level.name''',
      );
  dynamic achievementValue(dynamic response) => getJsonField(
        response,
        r'''$.data.achievement.value''',
      );
  dynamic achievementMax(dynamic response) => getJsonField(
        response,
        r'''$.data.achievement.levelCount''',
      );
}

class DashboardGraphCall {
  Future<ApiCallResponse> call({
    String? swimrankingsIdentifier = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'DashboardGraph',
      apiUrl: '${ApiGroup.baseUrl}Dashboard/Graph',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'swimrankingsIdentifier': swimrankingsIdentifier,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? years(dynamic response) => getJsonField(
        response,
        r'''$.data.years''',
        true,
      ) as List?;
  List? points(dynamic response) => getJsonField(
        response,
        r'''$.data.points''',
        true,
      ) as List?;
}

class UpdateUserPropertyCall {
  Future<ApiCallResponse> call({
    String? deviceIdentifier = '',
    int? propertyId,
    String? value = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateUserProperty',
      apiUrl: '${ApiGroup.baseUrl}User/UpdateUserProperty',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'deviceIdentifier': deviceIdentifier,
        'propertyId': propertyId,
        'value': value,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateUserDistancePropertiesCall {
  Future<ApiCallResponse> call({
    String? deviceIdentifier = '',
    String? distance50m = '5',
    String? distance100m = '5',
    String? distance200m = '5',
    String? distance400m = '5',
    String? distanceMoreThen400m = '5',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateUserDistanceProperties',
      apiUrl: '${ApiGroup.baseUrl}User/UpdateDistanceSettings',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'deviceIdentifier': deviceIdentifier,
        'distance50m': distance50m,
        'distance100m': distance100m,
        'distance200m': distance200m,
        'distance400m': distance400m,
        'distanceMoreThen400m': distanceMoreThen400m,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic user(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class UpdateUserStrokePropertiesCall {
  Future<ApiCallResponse> call({
    String? deviceIdentifier = '',
    String? butterfly = '',
    String? backstroke = '',
    String? breaststroke = '',
    String? freestyle = '',
    String? medley = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateUserStrokeProperties',
      apiUrl: '${ApiGroup.baseUrl}User/UpdateStrokeSettings',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'deviceIdentifier': deviceIdentifier,
        'butterfly': butterfly,
        'backstroke': backstroke,
        'breaststroke': breaststroke,
        'freestyle': freestyle,
        'medley': medley,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic user(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class GetContestsCall {
  Future<ApiCallResponse> call({
    String? swimrankingsIdentifier = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getContests',
      apiUrl: '${ApiGroup.baseUrl}Contest',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'swimrankingsIdentifier': swimrankingsIdentifier,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  int? amount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.count''',
      ));
  List? contests(dynamic response) => getJsonField(
        response,
        r'''$.data.contests''',
        true,
      ) as List?;
}

class GetContestCall {
  Future<ApiCallResponse> call({
    String? swimrankingsIdentifier = '',
    String? clubId = '',
    String? contestId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetContest',
      apiUrl: '${ApiGroup.baseUrl}Contest/GetContest',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'swimrankingsIdentifier': swimrankingsIdentifier,
        'clubId': clubId,
        'contestId': contestId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  double? clubPerformance(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.clubPerformance''',
      ));
  List? clubSwimmers(dynamic response) => getJsonField(
        response,
        r'''$.data.users''',
        true,
      ) as List?;
  dynamic currentUser(dynamic response) => getJsonField(
        response,
        r'''$.data.active''',
      );
  dynamic bestPerformer(dynamic response) => getJsonField(
        response,
        r'''$.data.bestPerformer''',
      );
  dynamic worstPerformer(dynamic response) => getJsonField(
        response,
        r'''$.data.worstPerformer''',
      );
  dynamic myPerformance(dynamic response) => getJsonField(
        response,
        r'''$.data.active.averagePerformance''',
      );
}

class GetRecomendationsCountCall {
  Future<ApiCallResponse> call({
    String? deviceIdentifier = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetRecomendationsCount',
      apiUrl: '${ApiGroup.baseUrl}Advice/Amount',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'deviceIdentifier': deviceIdentifier,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  int? amount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.count''',
      ));
  dynamic unreadAmount(dynamic response) => getJsonField(
        response,
        r'''$.data.unreadCount''',
      );
}

class MarkRecomendationAsReadCall {
  Future<ApiCallResponse> call({
    String? deviceIdentifier = '',
    String? styleId = '',
    String? courseId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'markRecomendationAsRead',
      apiUrl: '${ApiGroup.baseUrl}Advice/MarkAsRead',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'deviceIdentifier': deviceIdentifier,
        'styleId': styleId,
        'courseId': courseId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SwimTimeToClubIdCall {
  Future<ApiCallResponse> call({
    String? swimrankingsIdentifier = '',
    String? contestId = '',
    String? genderId = '',
    String? styleId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'swimTimeToClubId',
      apiUrl: '${ApiGroup.baseUrl}Contest/GetClubId',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'swimrankingsIdentifier': swimrankingsIdentifier,
        'contestId': contestId,
        'genderId': genderId,
        'styleId': styleId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic clubId(dynamic response) => getJsonField(
        response,
        r'''$.data.clubId''',
      );
  dynamic raceName(dynamic response) => getJsonField(
        response,
        r'''$.data.raceName''',
      );
}

class GetAchievementCategoriesCall {
  Future<ApiCallResponse> call({
    String? deviceIdentifier = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAchievementCategories',
      apiUrl: '${ApiGroup.baseUrl}Achievement/Categories',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'deviceIdentifier': deviceIdentifier,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic myTotalAchievementLevel(dynamic response) => getJsonField(
        response,
        r'''$.data.myTotalAchievementLevel''',
      );
  dynamic totalAchievementsAvailable(dynamic response) => getJsonField(
        response,
        r'''$.data.totalAchievementMaxLevel''',
      );
  List? categories(dynamic response) => getJsonField(
        response,
        r'''$.data.categories''',
        true,
      ) as List?;
  dynamic categoryCount(dynamic response) => getJsonField(
        response,
        r'''$.data.categoryCount''',
      );
}

class GetAchievementsInCategoryCall {
  Future<ApiCallResponse> call({
    String? deviceIdentifier = '',
    String? categoryId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetAchievementsInCategory',
      apiUrl: '${ApiGroup.baseUrl}Achievement/Category',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'deviceIdentifier': deviceIdentifier,
        'categoryId': categoryId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? achievements(dynamic response) => getJsonField(
        response,
        r'''$.data.achievements''',
        true,
      ) as List?;
}

class PremiumStateCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'premiumState',
      apiUrl: '${ApiGroup.baseUrl}Dashboard/Get/Premium',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic premiumAllowed(dynamic response) => getJsonField(
        response,
        r'''$.data.premium''',
      );
}

class CompareCall {
  Future<ApiCallResponse> call({
    String? athleteA = '',
    String? athleteB = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'compare',
      apiUrl: '${ApiGroup.baseUrl}User/Compare',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'AthleteA': athleteA,
        'AthleteB': athleteB,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic athleteA(dynamic response) => getJsonField(
        response,
        r'''$.data.athleteA''',
      );
  dynamic athleteB(dynamic response) => getJsonField(
        response,
        r'''$.data.athleteB''',
      );
  List? compareables(dynamic response) => getJsonField(
        response,
        r'''$.data.compareables''',
        true,
      ) as List?;
}

class GetTopAthletesCall {
  Future<ApiCallResponse> call({
    String? deviceIdentifier = '',
    String? queryType = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetTopAthletes',
      apiUrl: '${ApiGroup.baseUrl}Achievement/Top',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'deviceIdentifier': deviceIdentifier,
        'queryType': queryType,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  int? myPlace(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.myPlace''',
      ));
  int? totalUsers(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.amountUsers''',
      ));
  List? topUsers(dynamic response) => getJsonField(
        response,
        r'''$.data.topUsers''',
        true,
      ) as List?;
}

/// End API Group Code

class GetUserByDeviceIdentifierCall {
  static Future<ApiCallResponse> call({
    String? deviceidentifier = '',
    bool? resetActiveToMe,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get User By DeviceIdentifier',
      apiUrl: 'https://myswimstats.nl/api/user/GetByDeviceIdentifier',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'deviceIdentifier': deviceidentifier,
        'resetActiveToMe': resetActiveToMe,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class VerifyFullNameCall {
  static Future<ApiCallResponse> call({
    String? fullName = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Verify fullName',
      apiUrl: 'https://myswimstats.nl/api/user/VerifyName',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'fullName': fullName,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? users(dynamic response) => getJsonField(
        response,
        r'''$.data.users''',
        true,
      ) as List?;
  static int? userCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.userCount''',
      ));
  static dynamic userId(dynamic response) => getJsonField(
        response,
        r'''$.data.users[:].identifier''',
      );
  static dynamic userFullname(dynamic response) => getJsonField(
        response,
        r'''$.data.users[:].fullname''',
      );
  static dynamic userDate(dynamic response) => getJsonField(
        response,
        r'''$.data.users[:].date''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
