import '/components/dashboard_feature_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/app_drawer/app_drawer_widget.dart';
import '/pages/generic/base_header/base_header_widget.dart';
import '/pages/generic/bottom_navigator/bottom_navigator_widget.dart';
import 'dashboard_v2_widget.dart' show DashboardV2Widget;
import 'package:flutter/material.dart';

class DashboardV2Model extends FlutterFlowModel<DashboardV2Widget> {
  ///  Local state fields for this page.

  int index = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for dashboardFeature component.
  late DashboardFeatureModel dashboardFeatureModel1;
  // Model for dashboardFeature component.
  late DashboardFeatureModel dashboardFeatureModel2;
  // Model for dashboardFeature component.
  late DashboardFeatureModel dashboardFeatureModel3;
  // Model for dashboardFeature component.
  late DashboardFeatureModel dashboardFeatureModel4;
  // Model for dashboardFeature component.
  late DashboardFeatureModel dashboardFeatureModel5;
  // Model for dashboardFeature component.
  late DashboardFeatureModel dashboardFeatureModel6;
  // Model for dashboardFeature component.
  late DashboardFeatureModel dashboardFeatureModel7;
  // Model for dashboardFeature component.
  late DashboardFeatureModel dashboardFeatureModel8;
  // Model for dashboardFeature component.
  late DashboardFeatureModel dashboardFeatureModel9;
  // Model for bottomNavigator component.
  late BottomNavigatorModel bottomNavigatorModel;
  // Model for baseHeader component.
  late BaseHeaderModel baseHeaderModel;
  // Model for appDrawer component.
  late AppDrawerModel appDrawerModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    dashboardFeatureModel1 =
        createModel(context, () => DashboardFeatureModel());
    dashboardFeatureModel2 =
        createModel(context, () => DashboardFeatureModel());
    dashboardFeatureModel3 =
        createModel(context, () => DashboardFeatureModel());
    dashboardFeatureModel4 =
        createModel(context, () => DashboardFeatureModel());
    dashboardFeatureModel5 =
        createModel(context, () => DashboardFeatureModel());
    dashboardFeatureModel6 =
        createModel(context, () => DashboardFeatureModel());
    dashboardFeatureModel7 =
        createModel(context, () => DashboardFeatureModel());
    dashboardFeatureModel8 =
        createModel(context, () => DashboardFeatureModel());
    dashboardFeatureModel9 =
        createModel(context, () => DashboardFeatureModel());
    bottomNavigatorModel = createModel(context, () => BottomNavigatorModel());
    baseHeaderModel = createModel(context, () => BaseHeaderModel());
    appDrawerModel = createModel(context, () => AppDrawerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    dashboardFeatureModel1.dispose();
    dashboardFeatureModel2.dispose();
    dashboardFeatureModel3.dispose();
    dashboardFeatureModel4.dispose();
    dashboardFeatureModel5.dispose();
    dashboardFeatureModel6.dispose();
    dashboardFeatureModel7.dispose();
    dashboardFeatureModel8.dispose();
    dashboardFeatureModel9.dispose();
    bottomNavigatorModel.dispose();
    baseHeaderModel.dispose();
    appDrawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
