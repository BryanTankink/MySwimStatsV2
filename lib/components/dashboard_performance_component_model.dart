import '/flutter_flow/flutter_flow_util.dart';
import '/pages/dashboard/dashboard_tab_page/dashboard_tab_page_widget.dart';
import 'dashboard_performance_component_widget.dart'
    show DashboardPerformanceComponentWidget;
import 'package:flutter/material.dart';

class DashboardPerformanceComponentModel
    extends FlutterFlowModel<DashboardPerformanceComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for dashboardTabPage component.
  late DashboardTabPageModel dashboardTabPageModel1;
  // Model for dashboardTabPage component.
  late DashboardTabPageModel dashboardTabPageModel2;
  // Model for dashboardTabPage component.
  late DashboardTabPageModel dashboardTabPageModel3;
  // Model for dashboardTabPage component.
  late DashboardTabPageModel dashboardTabPageModel4;
  // Model for dashboardTabPage component.
  late DashboardTabPageModel dashboardTabPageModel5;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    dashboardTabPageModel1 =
        createModel(context, () => DashboardTabPageModel());
    dashboardTabPageModel2 =
        createModel(context, () => DashboardTabPageModel());
    dashboardTabPageModel3 =
        createModel(context, () => DashboardTabPageModel());
    dashboardTabPageModel4 =
        createModel(context, () => DashboardTabPageModel());
    dashboardTabPageModel5 =
        createModel(context, () => DashboardTabPageModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    dashboardTabPageModel1.dispose();
    dashboardTabPageModel2.dispose();
    dashboardTabPageModel3.dispose();
    dashboardTabPageModel4.dispose();
    dashboardTabPageModel5.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
