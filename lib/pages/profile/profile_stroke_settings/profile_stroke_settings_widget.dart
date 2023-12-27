import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/custom_slider/custom_slider_widget.dart';
import '/pages/generic/operation_button/operation_button_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'profile_stroke_settings_model.dart';
export 'profile_stroke_settings_model.dart';

class ProfileStrokeSettingsWidget extends StatefulWidget {
  const ProfileStrokeSettingsWidget({super.key});

  @override
  _ProfileStrokeSettingsWidgetState createState() =>
      _ProfileStrokeSettingsWidgetState();
}

class _ProfileStrokeSettingsWidgetState
    extends State<ProfileStrokeSettingsWidget> {
  late ProfileStrokeSettingsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileStrokeSettingsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isPremium = await action_blocks.isPremium(context);
      setState(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Welke slagen vindt jij leuk?',
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
                  model: _model.strokeButterflyModel,
                  updateCallback: () => setState(() {}),
                  child: CustomSliderWidget(
                    title: 'Vlinderslag',
                    value: getJsonField(
                      FFAppState().user,
                      r'''$.strokeButterfly''',
                    ),
                    onValueChanged: () async {
                      setState(() {
                        _model.strokeSettingChanged = true;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                child: wrapWithModel(
                  model: _model.strokeBackstrokeModel,
                  updateCallback: () => setState(() {}),
                  child: CustomSliderWidget(
                    title: 'Rugcrawl',
                    value: getJsonField(
                      FFAppState().user,
                      r'''$.strokeBackstroke''',
                    ),
                    onValueChanged: () async {
                      setState(() {
                        _model.strokeSettingChanged = true;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                child: wrapWithModel(
                  model: _model.strokeBreaststrokeModel,
                  updateCallback: () => setState(() {}),
                  child: CustomSliderWidget(
                    title: 'Schoolslag',
                    value: getJsonField(
                      FFAppState().user,
                      r'''$.strokeBreaststroke''',
                    ),
                    onValueChanged: () async {
                      setState(() {
                        _model.strokeSettingChanged = true;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                child: wrapWithModel(
                  model: _model.strokeFreestyleModel,
                  updateCallback: () => setState(() {}),
                  child: CustomSliderWidget(
                    title: 'Borstcrawl',
                    value: getJsonField(
                      FFAppState().user,
                      r'''$.strokeFreestyle''',
                    ),
                    onValueChanged: () async {
                      setState(() {
                        _model.strokeSettingChanged = true;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                child: wrapWithModel(
                  model: _model.strokeMedleyModel,
                  updateCallback: () => setState(() {}),
                  child: CustomSliderWidget(
                    title: 'Wisselslag',
                    value: getJsonField(
                      FFAppState().user,
                      r'''$.strokeMedley''',
                    ),
                    onValueChanged: () async {
                      setState(() {
                        _model.strokeSettingChanged = true;
                      });
                    },
                  ),
                ),
              ),
              if (_model.strokeSettingChanged)
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.operationButtonModel,
                    updateCallback: () => setState(() {}),
                    child: OperationButtonWidget(
                      text: 'Opslaan',
                      onClick: () async {
                        _model.apiResulte3q =
                            await ApiGroup.updateUserStrokePropertiesCall.call(
                          deviceIdentifier: FFAppState().deviceIdentifier,
                          butterfly: formatNumber(
                            _model.strokeButterflyModel.sliderValue,
                            formatType: FormatType.custom,
                            format: '##',
                            locale: '',
                          ),
                          backstroke: formatNumber(
                            _model.strokeBackstrokeModel.sliderValue,
                            formatType: FormatType.custom,
                            format: '##',
                            locale: '',
                          ),
                          breaststroke: formatNumber(
                            _model.strokeBreaststrokeModel.sliderValue,
                            formatType: FormatType.custom,
                            format: '##',
                            locale: '',
                          ),
                          freestyle: formatNumber(
                            _model.strokeFreestyleModel.sliderValue,
                            formatType: FormatType.custom,
                            format: '##',
                            locale: '',
                          ),
                          medley: formatNumber(
                            _model.strokeMedleyModel.sliderValue,
                            formatType: FormatType.custom,
                            format: '##',
                            locale: '',
                          ),
                        );
                        if ((_model.apiResulte3q?.succeeded ?? true)) {
                          setState(() {
                            _model.strokeSettingChanged = false;
                          });
                        }
                        await action_blocks.getUserAuth(context);

                        setState(() {});
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
