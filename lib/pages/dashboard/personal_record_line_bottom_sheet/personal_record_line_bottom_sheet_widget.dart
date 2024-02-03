import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'personal_record_line_bottom_sheet_model.dart';
export 'personal_record_line_bottom_sheet_model.dart';

class PersonalRecordLineBottomSheetWidget extends StatefulWidget {
  const PersonalRecordLineBottomSheetWidget({
    super.key,
    required this.stroke,
    required this.titleAddon,
    required this.year,
  });

  final dynamic stroke;
  final String? titleAddon;
  final String? year;

  @override
  State<PersonalRecordLineBottomSheetWidget> createState() =>
      _PersonalRecordLineBottomSheetWidgetState();
}

class _PersonalRecordLineBottomSheetWidgetState
    extends State<PersonalRecordLineBottomSheetWidget> {
  late PersonalRecordLineBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PersonalRecordLineBottomSheetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      height: 230.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
        boxShadow: const [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(0.0, -3.0),
          )
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('PERSONAL_RECORD_LINE_BOTTOM_SHEET_ALLE_T');
                logFirebaseEvent('Button_haptic_feedback');
                HapticFeedback.selectionClick();
                logFirebaseEvent('Button_navigate_to');

                context.pushNamed(
                  'RaceList',
                  queryParameters: {
                    'style': serializeParam(
                      getJsonField(
                        widget.stroke,
                        r'''$.styleId''',
                      ),
                      ParamType.int,
                    ),
                    'course': serializeParam(
                      getJsonField(
                        widget.stroke,
                        r'''$.courseType''',
                      ),
                      ParamType.int,
                    ),
                    'title': serializeParam(
                      '${getJsonField(
                        widget.stroke,
                        r'''$.event''',
                      ).toString()} ${functions.convertCourseTypeToString(getJsonField(
                        widget.stroke,
                        r'''$.courseType''',
                      ))}${widget.titleAddon != null && widget.titleAddon != '' ? widget.titleAddon : ' '}',
                      ParamType.String,
                    ),
                    'timeId': serializeParam(
                      getJsonField(
                        widget.stroke,
                        r'''$.timeId''',
                      ),
                      ParamType.int,
                    ),
                    'year': serializeParam(
                      widget.year,
                      ParamType.String,
                    ),
                  }.withoutNulls,
                );
              },
              text: 'Alle tijden',
              icon: const FaIcon(
                FontAwesomeIcons.clock,
              ),
              options: FFButtonOptions(
                width: double.infinity,
                height: 50.0,
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).text,
                textStyle: FlutterFlowTheme.of(context).bodyLarge,
                elevation: 2.0,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('PERSONAL_RECORD_LINE_BOTTOM_SHEET_SPLIT_');
                  logFirebaseEvent('Button_navigate_to');

                  context.pushNamed(
                    'raceDetails',
                    queryParameters: {
                      'raceDetails': serializeParam(
                        widget.stroke,
                        ParamType.JSON,
                      ),
                      'event': serializeParam(
                        getJsonField(
                          widget.stroke,
                          r'''$.event''',
                        ).toString(),
                        ParamType.String,
                      ),
                      'course': serializeParam(
                        getJsonField(
                          widget.stroke,
                          r'''$.courseType''',
                        ).toString(),
                        ParamType.String,
                      ),
                      'style': serializeParam(
                        getJsonField(
                          widget.stroke,
                          r'''$.styleId''',
                        ).toString(),
                        ParamType.String,
                      ),
                    }.withoutNulls,
                  );
                },
                text: 'Split informatie',
                icon: const Icon(
                  Icons.call_split_rounded,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 50.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).text,
                  textStyle: FlutterFlowTheme.of(context).bodyLarge,
                  elevation: 2.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('PERSONAL_RECORD_LINE_BOTTOM_SHEET_CANCEL');
                  logFirebaseEvent('Button_close_dialog,_drawer,_etc');
                  Navigator.pop(context);
                },
                text: 'Cancel',
                icon: const Icon(
                  Icons.close_sharp,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 50.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).buttonCancel,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                  elevation: 0.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 0.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
