import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/app_drawer/app_drawer_widget.dart';
import '/pages/generic/base_header/base_header_widget.dart';
import 'contests_widget.dart' show ContestsWidget;
import 'package:flutter/material.dart';

class ContestsModel extends FlutterFlowModel<ContestsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for baseHeader component.
  late BaseHeaderModel baseHeaderModel;
  // Model for appDrawer component.
  late AppDrawerModel appDrawerModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    baseHeaderModel = createModel(context, () => BaseHeaderModel());
    appDrawerModel = createModel(context, () => AppDrawerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    baseHeaderModel.dispose();
    appDrawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
