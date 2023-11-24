import 'dart:convert';
import 'dart:typed_data';

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
    );
  }

  dynamic isValid(dynamic response) => getJsonField(
        response,
        r'''$.data.linkedAccount''',
      );
  dynamic freestylePerformances(dynamic response) => getJsonField(
        response,
        r'''$.data.performances.freeStyle''',
        true,
      );
  dynamic butterflyPerformances(dynamic response) => getJsonField(
        response,
        r'''$.data.performances.butterfly''',
        true,
      );
  dynamic backstrokePerformances(dynamic response) => getJsonField(
        response,
        r'''$.data.performances.backstroke''',
        true,
      );
  dynamic breaststrokePerformances(dynamic response) => getJsonField(
        response,
        r'''$.data.performances.breaststroke''',
        true,
      );
  dynamic medleyPerformances(dynamic response) => getJsonField(
        response,
        r'''$.data.performances.medley''',
        true,
      );
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
    );
  }

  dynamic exists(dynamic response) => getJsonField(
        response,
        r'''$.data.exists''',
      );
  dynamic activeUser(dynamic response) => getJsonField(
        response,
        r'''$.data.active''',
      );
  dynamic favorites(dynamic response) => getJsonField(
        response,
        r'''$.data.favorites''',
        true,
      );
}

class AddFavoritedUserCall {
  Future<ApiCallResponse> call({
    String? deviceIdentifier = '',
    String? swimrankingsIdentifier = '',
    String? fullName = '',
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
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
    );
  }
}

class RaceListCall {
  Future<ApiCallResponse> call({
    String? deviceIdentifier = '',
    String? style = '',
    String? course = '',
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
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic races(dynamic response) => getJsonField(
        response,
        r'''$.data.races''',
        true,
      );
  dynamic rankings(dynamic response) => getJsonField(
        response,
        r'''$.data.rankings''',
        true,
      );
  dynamic max(dynamic response) => getJsonField(
        response,
        r'''$.data.maxScore''',
      );
  dynamic scoreTime(dynamic response) => getJsonField(
        response,
        r'''$.data.maxScoreTime''',
      );
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
  dynamic results(dynamic response) => getJsonField(
        response,
        r'''$.data.results''',
        true,
      );
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
    );
  }

  dynamic advices(dynamic response) => getJsonField(
        response,
        r'''$.data.advices''',
        true,
      );
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
    );
  }
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
    );
  }

  dynamic years(dynamic response) => getJsonField(
        response,
        r'''$.data.years''',
        true,
      );
  dynamic points(dynamic response) => getJsonField(
        response,
        r'''$.data.points''',
        true,
      );
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
    );
  }

  dynamic amount(dynamic response) => getJsonField(
        response,
        r'''$.data.count''',
      );
  dynamic contests(dynamic response) => getJsonField(
        response,
        r'''$.data.contests''',
        true,
      );
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
    );
  }

  dynamic clubPerformance(dynamic response) => getJsonField(
        response,
        r'''$.data.clubPerformance''',
      );
  dynamic clubSwimmers(dynamic response) => getJsonField(
        response,
        r'''$.data.users''',
        true,
      );
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
    );
  }

  dynamic amount(dynamic response) => getJsonField(
        response,
        r'''$.data.count''',
      );
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
    );
  }
}

/// End API Group Code

class GetUserByDeviceIdentifierCall {
  static Future<ApiCallResponse> call({
    String? deviceidentifier = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get User By DeviceIdentifier',
      apiUrl: 'https://myswimstats.nl/api/user/GetByDeviceIdentifier',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'deviceIdentifier': deviceidentifier,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
    );
  }

  static dynamic users(dynamic response) => getJsonField(
        response,
        r'''$.data.users''',
        true,
      );
  static dynamic userCount(dynamic response) => getJsonField(
        response,
        r'''$.data.userCount''',
      );
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
