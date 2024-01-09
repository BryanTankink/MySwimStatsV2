import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/loaders/loader_component/loader_component_widget.dart';
import 'achievement_users_widget.dart' show AchievementUsersWidget;
import 'package:flutter/material.dart';

class AchievementUsersModel extends FlutterFlowModel<AchievementUsersWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  int filter = 5;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Set active user)] action in Container widget.
  ApiCallResponse? apiResult5z2Copy;
  // Model for LoaderComponent component.
  late LoaderComponentModel loaderComponentModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    loaderComponentModel = createModel(context, () => LoaderComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    loaderComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
