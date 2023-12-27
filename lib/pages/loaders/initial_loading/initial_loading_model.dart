import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/loaders/loader_component/loader_component_widget.dart';
import 'initial_loading_widget.dart' show InitialLoadingWidget;
import 'package:flutter/material.dart';

class InitialLoadingModel extends FlutterFlowModel<InitialLoadingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getDeviceIdentifier] action in InitialLoading widget.
  String? deviceIdentifier;
  // Stores action output result for [Action Block - GetUserAuth] action in InitialLoading widget.
  bool? hasValidUser;
  // Stores action output result for [Backend Call - API (premiumState)] action in InitialLoading widget.
  ApiCallResponse? premiumStateResult;
  // Model for LoaderComponent component.
  late LoaderComponentModel loaderComponentModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    loaderComponentModel = createModel(context, () => LoaderComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    loaderComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
