import '/flutter_flow/flutter_flow_util.dart';
import '/pages/profile/profile_distance_settings/profile_distance_settings_widget.dart';
import '/pages/profile/profile_stroke_settings/profile_stroke_settings_widget.dart';
import '/pages/profile/profile_users_page/profile_users_page_widget.dart';
import 'profile_premium_component_widget.dart'
    show ProfilePremiumComponentWidget;
import 'package:flutter/material.dart';

class ProfilePremiumComponentModel
    extends FlutterFlowModel<ProfilePremiumComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for profileUsersPage component.
  late ProfileUsersPageModel profileUsersPageModel;
  // Model for profileDistanceSettings component.
  late ProfileDistanceSettingsModel profileDistanceSettingsModel;
  // Model for profileStrokeSettings component.
  late ProfileStrokeSettingsModel profileStrokeSettingsModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    profileUsersPageModel = createModel(context, () => ProfileUsersPageModel());
    profileDistanceSettingsModel =
        createModel(context, () => ProfileDistanceSettingsModel());
    profileStrokeSettingsModel =
        createModel(context, () => ProfileStrokeSettingsModel());
  }

  @override
  void dispose() {
    profileUsersPageModel.dispose();
    profileDistanceSettingsModel.dispose();
    profileStrokeSettingsModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
