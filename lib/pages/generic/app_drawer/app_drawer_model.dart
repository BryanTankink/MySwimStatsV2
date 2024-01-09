import '/components/achievement_category_widget.dart';
import '/components/premium_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/menu_item/menu_item_widget.dart';
import 'app_drawer_widget.dart' show AppDrawerWidget;
import 'package:flutter/material.dart';

class AppDrawerModel extends FlutterFlowModel<AppDrawerWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PremiumButton component.
  late PremiumButtonModel premiumButtonModel;
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
  // Model for menuItem component.
  late MenuItemModel menuItemModel6;
  // Model for menuItem component.
  late MenuItemModel menuItemModel7;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    premiumButtonModel = createModel(context, () => PremiumButtonModel());
    achievementCategoryModel =
        createModel(context, () => AchievementCategoryModel());
    menuItemModel1 = createModel(context, () => MenuItemModel());
    menuItemModel2 = createModel(context, () => MenuItemModel());
    menuItemModel3 = createModel(context, () => MenuItemModel());
    menuItemModel4 = createModel(context, () => MenuItemModel());
    menuItemModel5 = createModel(context, () => MenuItemModel());
    menuItemModel6 = createModel(context, () => MenuItemModel());
    menuItemModel7 = createModel(context, () => MenuItemModel());
  }

  @override
  void dispose() {
    premiumButtonModel.dispose();
    achievementCategoryModel.dispose();
    menuItemModel1.dispose();
    menuItemModel2.dispose();
    menuItemModel3.dispose();
    menuItemModel4.dispose();
    menuItemModel5.dispose();
    menuItemModel6.dispose();
    menuItemModel7.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
