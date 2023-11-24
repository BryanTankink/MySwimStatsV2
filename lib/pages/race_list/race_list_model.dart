import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'race_list_widget.dart' show RaceListWidget;
import 'package:flutter/material.dart';

class RaceListModel extends FlutterFlowModel<RaceListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Backend Call - API (swimTimeToClubId)] action in Container widget.
  ApiCallResponse? clubIdResult;

  /// Query cache managers for this widget.

  final _raceDetailPageManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> raceDetailPage({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _raceDetailPageManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearRaceDetailPageCache() => _raceDetailPageManager.clear();
  void clearRaceDetailPageCacheKey(String? uniqueKey) =>
      _raceDetailPageManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();

    /// Dispose query cache managers for this widget.

    clearRaceDetailPageCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
