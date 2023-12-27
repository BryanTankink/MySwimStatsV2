import '/backend/api_requests/api_calls.dart';
import '/components/achievement_category_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/loaders/loader_component/loader_component_widget.dart';
import 'race_list_widget.dart' show RaceListWidget;
import 'package:flutter/material.dart';

class RaceListModel extends FlutterFlowModel<RaceListWidget> {
  ///  Local state fields for this page.

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AchievementCategory component.
  late AchievementCategoryModel achievementCategoryModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Backend Call - API (swimTimeToClubId)] action in Container widget.
  ApiCallResponse? clubIdResult;
  // Model for LoaderComponent component.
  late LoaderComponentModel loaderComponentModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    achievementCategoryModel =
        createModel(context, () => AchievementCategoryModel());
    loaderComponentModel = createModel(context, () => LoaderComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    achievementCategoryModel.dispose();
    tabBarController?.dispose();
    loaderComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
