import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/generic/app_drawer/app_drawer_widget.dart';
import '/pages/generic/base_header/base_header_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'contests_widget.dart' show ContestsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ContestsModel extends FlutterFlowModel<ContestsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for baseHeader component.
  late BaseHeaderModel baseHeaderModel;
  // Model for appDrawer component.
  late AppDrawerModel appDrawerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    baseHeaderModel = createModel(context, () => BaseHeaderModel());
    appDrawerModel = createModel(context, () => AppDrawerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    baseHeaderModel.dispose();
    appDrawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
