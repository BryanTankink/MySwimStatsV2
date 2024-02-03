import '/flutter_flow/flutter_flow_util.dart';
import '/pages/profile/profile_default_component/profile_default_component_widget.dart';
import '/pages/profile/profile_premium_component/profile_premium_component_widget.dart';
import 'profile_quick_edit_widget.dart' show ProfileQuickEditWidget;
import 'package:flutter/material.dart';

class ProfileQuickEditModel extends FlutterFlowModel<ProfileQuickEditWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for profilePremiumComponent component.
  late ProfilePremiumComponentModel profilePremiumComponentModel;
  // Model for profileDefaultComponent component.
  late ProfileDefaultComponentModel profileDefaultComponentModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    profilePremiumComponentModel =
        createModel(context, () => ProfilePremiumComponentModel());
    profileDefaultComponentModel =
        createModel(context, () => ProfileDefaultComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    profilePremiumComponentModel.dispose();
    profileDefaultComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
