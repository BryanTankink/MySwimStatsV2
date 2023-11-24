import '/flutter_flow/flutter_flow_util.dart';
import '/pages/profile/profile_users_page/profile_users_page_widget.dart';
import 'profile_default_component_widget.dart'
    show ProfileDefaultComponentWidget;
import 'package:flutter/material.dart';

class ProfileDefaultComponentModel
    extends FlutterFlowModel<ProfileDefaultComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for profileUsersPage component.
  late ProfileUsersPageModel profileUsersPageModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    profileUsersPageModel = createModel(context, () => ProfileUsersPageModel());
  }

  @override
  void dispose() {
    profileUsersPageModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
