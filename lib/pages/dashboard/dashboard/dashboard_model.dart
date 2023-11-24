import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/dashboard/dashboard_tab_page/dashboard_tab_page_widget.dart';
import '/pages/generic/app_drawer/app_drawer_widget.dart';
import '/pages/generic/base_header/base_header_widget.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
  // Model for baseHeader component.
  late BaseHeaderModel baseHeaderModel;
  // Model for appDrawer component.
  late AppDrawerModel appDrawerModel;

  /// Initialization and disposal methods.

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
    baseHeaderModel = createModel(context, () => BaseHeaderModel());
    appDrawerModel = createModel(context, () => AppDrawerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    dashboardTabPageModel1.dispose();
    dashboardTabPageModel2.dispose();
    dashboardTabPageModel3.dispose();
    dashboardTabPageModel4.dispose();
    dashboardTabPageModel5.dispose();
    baseHeaderModel.dispose();
    appDrawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}