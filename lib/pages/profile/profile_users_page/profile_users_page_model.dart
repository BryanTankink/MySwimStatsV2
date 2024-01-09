import '/components/premium_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/swimrankings_list_item/swimrankings_list_item_widget.dart';
import 'profile_users_page_widget.dart' show ProfileUsersPageWidget;
import 'package:flutter/material.dart';

class ProfileUsersPageModel extends FlutterFlowModel<ProfileUsersPageWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PremiumButton component.
  late PremiumButtonModel premiumButtonModel;
  // Model for SwimrankingsListItem component.
  late SwimrankingsListItemModel swimrankingsListItemModel1;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    premiumButtonModel = createModel(context, () => PremiumButtonModel());
    swimrankingsListItemModel1 =
        createModel(context, () => SwimrankingsListItemModel());
  }

  @override
  void dispose() {
    premiumButtonModel.dispose();
    swimrankingsListItemModel1.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
