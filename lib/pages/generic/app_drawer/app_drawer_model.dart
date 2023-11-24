import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/menu_item/menu_item_widget.dart';
import '/pages/generic/operation_button/operation_button_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'app_drawer_widget.dart' show AppDrawerWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppDrawerModel extends FlutterFlowModel<AppDrawerWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for OperationButton component.
  late OperationButtonModel operationButtonModel;
  // Stores action output result for [RevenueCat - Purchase] action in OperationButton widget.
  bool? purchaseState;
  // Model for menuItem component.
  late MenuItemModel menuItemModel1;
  // Model for menuItem component.
  late MenuItemModel menuItemModel2;
  // Model for menuItem component.
  late MenuItemModel menuItemModel3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    operationButtonModel = createModel(context, () => OperationButtonModel());
    menuItemModel1 = createModel(context, () => MenuItemModel());
    menuItemModel2 = createModel(context, () => MenuItemModel());
    menuItemModel3 = createModel(context, () => MenuItemModel());
  }

  void dispose() {
    operationButtonModel.dispose();
    menuItemModel1.dispose();
    menuItemModel2.dispose();
    menuItemModel3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
