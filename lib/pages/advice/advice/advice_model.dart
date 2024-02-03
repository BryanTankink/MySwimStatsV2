import '/components/short_long_course_switcher_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/operation_button/operation_button_widget.dart';
import 'advice_widget.dart' show AdviceWidget;
import 'package:flutter/material.dart';

class AdviceModel extends FlutterFlowModel<AdviceWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for OperationButton component.
  late OperationButtonModel operationButtonModel;
  // Model for shortLongCourseSwitcher component.
  late ShortLongCourseSwitcherModel shortLongCourseSwitcherModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    operationButtonModel = createModel(context, () => OperationButtonModel());
    shortLongCourseSwitcherModel =
        createModel(context, () => ShortLongCourseSwitcherModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    operationButtonModel.dispose();
    shortLongCourseSwitcherModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
