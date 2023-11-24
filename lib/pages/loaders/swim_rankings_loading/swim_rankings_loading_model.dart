import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/loaders/loader_component/loader_component_widget.dart';
import 'swim_rankings_loading_widget.dart' show SwimRankingsLoadingWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SwimRankingsLoadingModel
    extends FlutterFlowModel<SwimRankingsLoadingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
