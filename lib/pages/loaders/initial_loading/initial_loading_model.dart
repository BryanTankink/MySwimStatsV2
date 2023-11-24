import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/loaders/loader_component/loader_component_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'initial_loading_widget.dart' show InitialLoadingWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InitialLoadingModel extends FlutterFlowModel<InitialLoadingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getDeviceIdentifier] action in InitialLoading widget.
  String? deviceIdentifier;
  // Stores action output result for [Action Block - GetUserAuth] action in InitialLoading widget.
  bool? hasValidUser;
  // Model for LoaderComponent component.
  late LoaderComponentModel loaderComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    loaderComponentModel = createModel(context, () => LoaderComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    loaderComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
