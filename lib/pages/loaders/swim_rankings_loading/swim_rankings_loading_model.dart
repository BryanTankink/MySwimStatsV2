import '/flutter_flow/flutter_flow_util.dart';
import '/pages/loaders/loader_component/loader_component_widget.dart';
import 'swim_rankings_loading_widget.dart' show SwimRankingsLoadingWidget;
import 'package:flutter/material.dart';

class SwimRankingsLoadingModel
    extends FlutterFlowModel<SwimRankingsLoadingWidget> {
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
