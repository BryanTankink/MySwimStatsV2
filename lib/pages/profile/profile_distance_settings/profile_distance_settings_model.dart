import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/custom_slider/custom_slider_widget.dart';
import '/pages/generic/operation_button/operation_button_widget.dart';
import 'profile_distance_settings_widget.dart'
    show ProfileDistanceSettingsWidget;
import 'package:flutter/material.dart';

class ProfileDistanceSettingsModel
    extends FlutterFlowModel<ProfileDistanceSettingsWidget> {
  ///  Local state fields for this component.

  bool distancePropertyChanged = false;

  ///  State fields for stateful widgets in this component.

  // Model for meter50.
  late CustomSliderModel meter50Model;
  // Model for meter100.
  late CustomSliderModel meter100Model;
  // Model for meter200.
  late CustomSliderModel meter200Model;
  // Model for meter400.
  late CustomSliderModel meter400Model;
  // Model for meterMoreThen400.
  late CustomSliderModel meterMoreThen400Model;
  // Model for OperationButton component.
  late OperationButtonModel operationButtonModel;
  // Stores action output result for [Backend Call - API (UpdateUserDistanceProperties)] action in OperationButton widget.
  ApiCallResponse? apiResulte3q;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    meter50Model = createModel(context, () => CustomSliderModel());
    meter100Model = createModel(context, () => CustomSliderModel());
    meter200Model = createModel(context, () => CustomSliderModel());
    meter400Model = createModel(context, () => CustomSliderModel());
    meterMoreThen400Model = createModel(context, () => CustomSliderModel());
    operationButtonModel = createModel(context, () => OperationButtonModel());
  }

  @override
  void dispose() {
    meter50Model.dispose();
    meter100Model.dispose();
    meter200Model.dispose();
    meter400Model.dispose();
    meterMoreThen400Model.dispose();
    operationButtonModel.dispose();
  }

  /// Action blocks are added here.

  Future distancePropertyChangedComp(BuildContext context) async {
    if (distancePropertyChanged) {
      return;
    }

    logFirebaseEvent('distancePropertyChangedComp_update_compo');
    distancePropertyChanged = true;
    return;
  }

  /// Additional helper methods are added here.
}
