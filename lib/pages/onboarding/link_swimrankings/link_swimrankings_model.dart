import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/generic/operation_button/operation_button_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'link_swimrankings_widget.dart' show LinkSwimrankingsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LinkSwimrankingsModel extends FlutterFlowModel<LinkSwimrankingsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldController;
  String? Function(BuildContext, String?)? nameFieldControllerValidator;
  // Model for OperationButton component.
  late OperationButtonModel operationButtonModel;
  // Stores action output result for [Backend Call - API (Verify fullName)] action in OperationButton widget.
  ApiCallResponse? nameVerifyResultCopy;
  // Stores action output result for [Backend Call - API (Add favorited user)] action in OperationButton widget.
  ApiCallResponse? apiResultbp8;
  // Stores action output result for [Action Block - GetUserAuth] action in OperationButton widget.
  bool? hasValidUserAuthCopy;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    operationButtonModel = createModel(context, () => OperationButtonModel());
  }

  void dispose() {
    unfocusNode.dispose();
    nameFieldFocusNode?.dispose();
    nameFieldController?.dispose();

    operationButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
