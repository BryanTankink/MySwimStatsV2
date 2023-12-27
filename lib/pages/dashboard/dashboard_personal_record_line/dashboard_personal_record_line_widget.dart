import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/split_times_display/split_times_display_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
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
  _DashboardPersonalRecordLineWidgetState createState() =>
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
          HapticFeedback.selectionClick();

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
        onLongPress: () async {
          if (getJsonField(
                widget.stroke,
                r'''$.splits''',
              ) !=
              null) {
            await showAlignedDialog(
              context: context,
              isGlobal: true,
              avoidOverflow: false,
              targetAnchor: const AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              followerAnchor: const AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              builder: (dialogContext) {
                return Material(
                  color: Colors.transparent,
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
            HapticFeedback.mediumImpact();
          }
        },
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 50.0,
          decoration: const BoxDecoration(),
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
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).text2,
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
                        r'''$.course''',
                      ).toString(),
                      '25m',
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).text2,
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
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).text2,
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
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).text2,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                child: Icon(
                  Icons.play_arrow,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
