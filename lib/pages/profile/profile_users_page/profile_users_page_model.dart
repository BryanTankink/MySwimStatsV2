import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/operation_button/operation_button_widget.dart';
import '/pages/generic/swimrankings_list_item/swimrankings_list_item_widget.dart';
import 'profile_users_page_widget.dart' show ProfileUsersPageWidget;
import 'package:flutter/material.dart';

class ProfileUsersPageModel extends FlutterFlowModel<ProfileUsersPageWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for OperationButton component.
  late OperationButtonModel operationButtonModel;
  // Stores action output result for [RevenueCat - Purchase] action in OperationButton widget.
  bool? purchaseState;
  // Model for SwimrankingsListItem component.
  late SwimrankingsListItemModel swimrankingsListItemModel1;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    operationButtonModel = createModel(context, () => OperationButtonModel());
    swimrankingsListItemModel1 =
        createModel(context, () => SwimrankingsListItemModel());
  }

  @override
  void dispose() {
    operationButtonModel.dispose();
    swimrankingsListItemModel1.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
