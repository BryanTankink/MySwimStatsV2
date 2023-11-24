import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'contest_swim_line_model.dart';
export 'contest_swim_line_model.dart';

class ContestSwimLineWidget extends StatefulWidget {
  const ContestSwimLineWidget({
    super.key,
    required this.stroke,
  });

  final dynamic stroke;

  @override
  _ContestSwimLineWidgetState createState() => _ContestSwimLineWidgetState();
}

class _ContestSwimLineWidgetState extends State<ContestSwimLineWidget> {
  late ContestSwimLineModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContestSwimLineModel());
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
              alignment: const AlignmentDirectional(-1.00, 0.00),
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
              alignment: const AlignmentDirectional(0.00, 0.00),
              child: Text(
                valueOrDefault<String>(
                  getJsonField(
                    widget.stroke,
                    r'''$.percentage''',
                  ).toString(),
                  '--m',
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Poppins',
                      color: functions.isGoodPercentage(getJsonField(
                        widget.stroke,
                        r'''$.percentage''',
                      ).toString())!
                          ? FlutterFlowTheme.of(context).performanceGood
                          : FlutterFlowTheme.of(context).performanceBad,
                    ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: const AlignmentDirectional(0.00, 0.00),
              child: Text(
                valueOrDefault<String>(
                  getJsonField(
                    widget.stroke,
                    r'''$.newSwimTime''',
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
              alignment: const AlignmentDirectional(1.00, 0.00),
              child: Text(
                valueOrDefault<String>(
                  getJsonField(
                    widget.stroke,
                    r'''$.newPoints''',
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
        ],
      ),
    );
  }
}
