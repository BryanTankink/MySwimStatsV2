import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/custom_slider/custom_slider_widget.dart';
import '/pages/generic/operation_button/operation_button_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'profile_stroke_settings_widget.dart' show ProfileStrokeSettingsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileStrokeSettingsModel
    extends FlutterFlowModel<ProfileStrokeSettingsWidget> {
  ///  Local state fields for this component.

  bool strokeSettingChanged = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Action Block - isPremium] action in profileStrokeSettings widget.
  bool? isPremium;
  // Model for strokeButterfly.
  late CustomSliderModel strokeButterflyModel;
  // Model for strokeBackstroke.
  late CustomSliderModel strokeBackstrokeModel;
  // Model for strokeBreaststroke.
  late CustomSliderModel strokeBreaststrokeModel;
  // Model for strokeFreestyle.
  late CustomSliderModel strokeFreestyleModel;
  // Model for strokeMedley.
  late CustomSliderModel strokeMedleyModel;
  // Model for OperationButton component.
  late OperationButtonModel operationButtonModel;
  // Stores action output result for [Backend Call - API (UpdateUserStrokeProperties)] action in OperationButton widget.
  ApiCallResponse? apiResulte3q;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    strokeButterflyModel = createModel(context, () => CustomSliderModel());
    strokeBackstrokeModel = createModel(context, () => CustomSliderModel());
    strokeBreaststrokeModel = createModel(context, () => CustomSliderModel());
    strokeFreestyleModel = createModel(context, () => CustomSliderModel());
    strokeMedleyModel = createModel(context, () => CustomSliderModel());
    operationButtonModel = createModel(context, () => OperationButtonModel());
  }

  void dispose() {
    strokeButterflyModel.dispose();
    strokeBackstrokeModel.dispose();
    strokeBreaststrokeModel.dispose();
    strokeFreestyleModel.dispose();
    strokeMedleyModel.dispose();
    operationButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
