import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/custom_slider/custom_slider_widget.dart';
import '/pages/generic/operation_button/operation_button_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'profile_distance_settings_model.dart';
export 'profile_distance_settings_model.dart';

class ProfileDistanceSettingsWidget extends StatefulWidget {
  const ProfileDistanceSettingsWidget({super.key});

  @override
  _ProfileDistanceSettingsWidgetState createState() =>
      _ProfileDistanceSettingsWidgetState();
}

class _ProfileDistanceSettingsWidgetState
    extends State<ProfileDistanceSettingsWidget> {
  late ProfileDistanceSettingsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileDistanceSettingsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, -1.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Welke afstanden vindt jij leuk?',
                  style: FlutterFlowTheme.of(context).titleMedium,
                ),
                Divider(
                  height: 50.0,
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).accent4,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: wrapWithModel(
                    model: _model.meter50Model,
                    updateCallback: () => setState(() {}),
                    child: CustomSliderWidget(
                      title: '50 Meters',
                      value: getJsonField(
                        FFAppState().user,
                        r'''$.distance50m''',
                      ),
                      onValueChanged: () async {
                        await _model.distancePropertyChangedComp(context);
                        setState(() {});
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: wrapWithModel(
                    model: _model.meter100Model,
                    updateCallback: () => setState(() {}),
                    child: CustomSliderWidget(
                      title: '100 Meters',
                      value: getJsonField(
                        FFAppState().user,
                        r'''$.distance100m''',
                      ),
                      onValueChanged: () async {
                        await _model.distancePropertyChangedComp(context);
                        setState(() {});
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: wrapWithModel(
                    model: _model.meter200Model,
                    updateCallback: () => setState(() {}),
                    child: CustomSliderWidget(
                      title: '200 Meters',
                      value: getJsonField(
                        FFAppState().user,
                        r'''$.distance200m''',
                      ),
                      onValueChanged: () async {
                        await _model.distancePropertyChangedComp(context);
                        setState(() {});
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: wrapWithModel(
                    model: _model.meter400Model,
                    updateCallback: () => setState(() {}),
                    child: CustomSliderWidget(
                      title: '400 Meters',
                      value: getJsonField(
                        FFAppState().user,
                        r'''$.distance400m''',
                      ),
                      onValueChanged: () async {
                        await _model.distancePropertyChangedComp(context);
                        setState(() {});
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: wrapWithModel(
                    model: _model.meterMoreThen400Model,
                    updateCallback: () => setState(() {}),
                    child: CustomSliderWidget(
                      title: '> 400 Meters',
                      value: getJsonField(
                        FFAppState().user,
                        r'''$.distanceMoreThen400''',
                      ),
                      onValueChanged: () async {
                        await _model.distancePropertyChangedComp(context);
                        setState(() {});
                      },
                    ),
                  ),
                ),
                if (_model.distancePropertyChanged)
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: wrapWithModel(
                      model: _model.operationButtonModel,
                      updateCallback: () => setState(() {}),
                      child: OperationButtonWidget(
                        text: 'Opslaan',
                        onClick: () async {
                          _model.apiResulte3q = await ApiGroup
                              .updateUserDistancePropertiesCall
                              .call(
                            deviceIdentifier: FFAppState().deviceIdentifier,
                            distance50m: formatNumber(
                              _model.meter50Model.sliderValue,
                              formatType: FormatType.custom,
                              format: '##',
                              locale: '',
                            ),
                            distance100m: formatNumber(
                              _model.meter100Model.sliderValue,
                              formatType: FormatType.custom,
                              format: '##',
                              locale: '',
                            ),
                            distance200m: formatNumber(
                              _model.meter200Model.sliderValue,
                              formatType: FormatType.custom,
                              format: '##',
                              locale: '',
                            ),
                            distance400m: formatNumber(
                              _model.meter400Model.sliderValue,
                              formatType: FormatType.custom,
                              format: '##',
                              locale: '',
                            ),
                            distanceMoreThen400m: formatNumber(
                              _model.meterMoreThen400Model.sliderValue,
                              formatType: FormatType.custom,
                              format: '##',
                              locale: '',
                            ),
                          );
                          if ((_model.apiResulte3q?.succeeded ?? true)) {
                            _model.updatePage(() {
                              _model.distancePropertyChanged = false;
                            });
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('Fout'),
                                  content: Text(
                                      'Er is iets fout gegaan bij het opslaan van jou gegevens! - ${(_model.apiResulte3q?.jsonBody ?? '').toString()}'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }

                          await action_blocks.getUserAuth(context);
                          setState(() {});

                          setState(() {});
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
