import '/components/achievement_category_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/menu_item/menu_item_widget.dart';
import '/pages/generic/operation_button/operation_button_widget.dart';
import 'app_drawer_widget.dart' show AppDrawerWidget;
import 'package:flutter/material.dart';

class AppDrawerModel extends FlutterFlowModel<AppDrawerWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for OperationButton component.
  late OperationButtonModel operationButtonModel;
  // Stores action output result for [RevenueCat - Purchase] action in OperationButton widget.
  bool? purchaseState;
  // Model for AchievementCategory component.
  late AchievementCategoryModel achievementCategoryModel;
  // Model for menuItem component.
  late MenuItemModel menuItemModel1;
  // Model for menuItem component.
  late MenuItemModel menuItemModel2;
  // Model for menuItem component.
  late MenuItemModel menuItemModel3;
  // Model for menuItem component.
  late MenuItemModel menuItemModel4;
  // Model for menuItem component.
  late MenuItemModel menuItemModel5;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    operationButtonModel = createModel(context, () => OperationButtonModel());
    achievementCategoryModel =
        createModel(context, () => AchievementCategoryModel());
    menuItemModel1 = createModel(context, () => MenuItemModel());
    menuItemModel2 = createModel(context, () => MenuItemModel());
    menuItemModel3 = createModel(context, () => MenuItemModel());
    menuItemModel4 = createModel(context, () => MenuItemModel());
    menuItemModel5 = createModel(context, () => MenuItemModel());
  }

  @override
  void dispose() {
    operationButtonModel.dispose();
    achievementCategoryModel.dispose();
    menuItemModel1.dispose();
    menuItemModel2.dispose();
    menuItemModel3.dispose();
    menuItemModel4.dispose();
    menuItemModel5.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
