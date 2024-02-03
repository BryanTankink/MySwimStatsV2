import '/components/dashboard_performance_component_widget.dart';
import '/components/short_long_course_switcher_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'growth_year_details_widget.dart' show GrowthYearDetailsWidget;
import 'package:flutter/material.dart';

class GrowthYearDetailsModel extends FlutterFlowModel<GrowthYearDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for dashboardPerformanceComponent component.
  late DashboardPerformanceComponentModel dashboardPerformanceComponentModel;
  // Model for shortLongCourseSwitcher component.
  late ShortLongCourseSwitcherModel shortLongCourseSwitcherModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    dashboardPerformanceComponentModel =
        createModel(context, () => DashboardPerformanceComponentModel());
    shortLongCourseSwitcherModel =
        createModel(context, () => ShortLongCourseSwitcherModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    dashboardPerformanceComponentModel.dispose();
    shortLongCourseSwitcherModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
