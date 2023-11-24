import '/flutter_flow/flutter_flow_util.dart';
import '/pages/loaders/loader_component/loader_component_widget.dart';
import 'generic_loader_widget.dart' show GenericLoaderWidget;
import 'package:flutter/material.dart';

class GenericLoaderModel extends FlutterFlowModel<GenericLoaderWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
