import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dashboard_personal_record_line_model.dart';
export 'dashboard_personal_record_line_model.dart';

class DashboardPersonalRecordLineWidget extends StatefulWidget {
  const DashboardPersonalRecordLineWidget({
    Key? key,
    required this.stroke,
  }) : super(key: key);

  final dynamic stroke;

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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
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
              ))}',
              ParamType.String,
            ),
          }.withoutNulls,
        );
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 50.0,
        decoration: BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Text(
                  valueOrDefault<String>(
                    getJsonField(
                      widget.stroke,
                      r'''$.event''',
                    ).toString(),
                    'Onbekend',
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
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Text(
                  valueOrDefault<String>(
                    getJsonField(
                      widget.stroke,
                      r'''$.course''',
                    ).toString(),
                    '--m',
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
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Text(
                  valueOrDefault<String>(
                    getJsonField(
                      widget.stroke,
                      r'''$.time''',
                    ).toString(),
                    'XX.XX',
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
                alignment: AlignmentDirectional(1.00, 0.00),
                child: Text(
                  valueOrDefault<String>(
                    getJsonField(
                      widget.stroke,
                      r'''$.points''',
                    ).toString(),
                    'XXX',
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
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
              child: Icon(
                Icons.play_arrow,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
