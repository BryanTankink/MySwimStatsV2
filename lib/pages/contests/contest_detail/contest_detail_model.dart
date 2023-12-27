import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/swimrankings_list_item/swimrankings_list_item_widget.dart';
import '/flutter_flow/request_manager.dart';

import 'contest_detail_widget.dart' show ContestDetailWidget;
import 'package:flutter/material.dart';

class ContestDetailModel extends FlutterFlowModel<ContestDetailWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SwimrankingsListItem component.
  late SwimrankingsListItemModel swimrankingsListItemModel;

  /// Query cache managers for this widget.

  final _raceInfoCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> raceInfoCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _raceInfoCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearRaceInfoCacheCache() => _raceInfoCacheManager.clear();
  void clearRaceInfoCacheCacheKey(String? uniqueKey) =>
      _raceInfoCacheManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    swimrankingsListItemModel =
        createModel(context, () => SwimrankingsListItemModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    swimrankingsListItemModel.dispose();

    /// Dispose query cache managers for this widget.

    clearRaceInfoCacheCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
