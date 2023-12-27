import '/components/dashboard_performance_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'growth_year_details_widget.dart' show GrowthYearDetailsWidget;
import 'package:flutter/material.dart';

class GrowthYearDetailsModel extends FlutterFlowModel<GrowthYearDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for dashboardPerformanceComponent component.
  late DashboardPerformanceComponentModel dashboardPerformanceComponentModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    dashboardPerformanceComponentModel =
        createModel(context, () => DashboardPerformanceComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    dashboardPerformanceComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
