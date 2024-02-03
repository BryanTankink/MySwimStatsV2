import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/dashboard/personal_record_line_bottom_sheet/personal_record_line_bottom_sheet_widget.dart';
import '/pages/generic/split_times_display/split_times_display_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'dashboard_personal_record_line_model.dart';
export 'dashboard_personal_record_line_model.dart';

class DashboardPersonalRecordLineWidget extends StatefulWidget {
  const DashboardPersonalRecordLineWidget({
    super.key,
    required this.stroke,
    this.titleAddon,
    this.year,
  });

  final dynamic stroke;
  final String? titleAddon;
  final String? year;

  @override
  State<DashboardPersonalRecordLineWidget> createState() =>
      _DashboardPersonalRecordLineWidgetState();
}

class _DashboardPersonalRecordLineWidgetState
    extends State<DashboardPersonalRecordLineWidget> {
  late DashboardPersonalRecordLineModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardPersonalRecordLineModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          logFirebaseEvent('DASHBOARD_PERSONAL_RECORD_LINE_Container');
          if (FFAppState().premium) {
            logFirebaseEvent('Container_bottom_sheet');
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              enableDrag: false,
              context: context,
              builder: (context) {
                return Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: PersonalRecordLineBottomSheetWidget(
                    stroke: widget.stroke!,
                    titleAddon:
                        widget.titleAddon != null && widget.titleAddon != ''
                            ? widget.titleAddon!
                            : '',
                    year: widget.year != null && widget.year != ''
                        ? widget.year!
                        : '-1',
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          } else {
            logFirebaseEvent('Container_haptic_feedback');
            HapticFeedback.selectionClick();
            logFirebaseEvent('Container_navigate_to');

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
          }
        },
        onLongPress: () async {
          logFirebaseEvent('DASHBOARD_PERSONAL_RECORD_LINE_Container');
          if (getJsonField(
                widget.stroke,
                r'''$.splits''',
              ) !=
              null) {
            logFirebaseEvent('Container_alert_dialog');
            await showDialog(
              context: context,
              builder: (dialogContext) {
                return Dialog(
                  elevation: 0,
                  insetPadding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  alignment: const AlignmentDirectional(0.0, 0.0)
                      .resolve(Directionality.of(context)),
                  child: SplitTimesDisplayWidget(
                    splits: getJsonField(
                      widget.stroke,
                      r'''$.splits''',
                      true,
                    )!,
                    title: '${getJsonField(
                      widget.stroke,
                      r'''$.event''',
                    ).toString()} ${functions.convertCourseTypeToString(getJsonField(
                      widget.stroke,
                      r'''$.courseType''',
                    ))}${widget.titleAddon != null && widget.titleAddon != '' ? widget.titleAddon : ' '}',
                  ),
                );
              },
            ).then((value) => setState(() {}));
          } else {
            logFirebaseEvent('Container_haptic_feedback');
            HapticFeedback.mediumImpact();
          }
        },
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 65.0,
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            getJsonField(
                              widget.stroke,
                              r'''$.event''',
                            ).toString(),
                            '50m Vlinderslag',
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                        ),
                      ),
                    ),
                    if (false)
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              getJsonField(
                                widget.stroke,
                                r'''$.course''',
                              ).toString(),
                              '25m',
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                          ),
                        ),
                      ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            getJsonField(
                              widget.stroke,
                              r'''$.time''',
                            ).toString(),
                            '25.64',
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: const AlignmentDirectional(1.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            getJsonField(
                              widget.stroke,
                              r'''$.points''',
                            ).toString(),
                            '645',
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: FlutterFlowTheme.of(context).text,
                        size: 24.0,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 10.0,
                thickness: 1.0,
                color: Color(0x80BE9E44),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
