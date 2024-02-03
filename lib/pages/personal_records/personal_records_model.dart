import '/components/dashboard_performance_component_widget.dart';
import '/components/short_long_course_switcher_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/app_drawer/app_drawer_widget.dart';
import '/pages/generic/base_header/base_header_widget.dart';
import '/pages/generic/bottom_navigator/bottom_navigator_widget.dart';
import '/pages/generic/swimrankings_list_item/swimrankings_list_item_widget.dart';
import 'personal_records_widget.dart' show PersonalRecordsWidget;
import 'package:flutter/material.dart';

class PersonalRecordsModel extends FlutterFlowModel<PersonalRecordsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SwimrankingsListItem component.
  late SwimrankingsListItemModel swimrankingsListItemModel;
  // Model for dashboardPerformanceComponent component.
  late DashboardPerformanceComponentModel dashboardPerformanceComponentModel;
  // Model for shortLongCourseSwitcher component.
  late ShortLongCourseSwitcherModel shortLongCourseSwitcherModel;
  // Model for bottomNavigator component.
  late BottomNavigatorModel bottomNavigatorModel;
  // Model for baseHeader component.
  late BaseHeaderModel baseHeaderModel;
  // Model for appDrawer component.
  late AppDrawerModel appDrawerModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    swimrankingsListItemModel =
        createModel(context, () => SwimrankingsListItemModel());
    dashboardPerformanceComponentModel =
        createModel(context, () => DashboardPerformanceComponentModel());
    shortLongCourseSwitcherModel =
        createModel(context, () => ShortLongCourseSwitcherModel());
    bottomNavigatorModel = createModel(context, () => BottomNavigatorModel());
    baseHeaderModel = createModel(context, () => BaseHeaderModel());
    appDrawerModel = createModel(context, () => AppDrawerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    swimrankingsListItemModel.dispose();
    dashboardPerformanceComponentModel.dispose();
    shortLongCourseSwitcherModel.dispose();
    bottomNavigatorModel.dispose();
    baseHeaderModel.dispose();
    appDrawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
