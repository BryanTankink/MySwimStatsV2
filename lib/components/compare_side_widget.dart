import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'compare_side_model.dart';
export 'compare_side_model.dart';

class CompareSideWidget extends StatefulWidget {
  const CompareSideWidget({
    super.key,
    required this.baseData,
    required this.isBest,
  });

  final dynamic baseData;
  final bool? isBest;

  @override
  State<CompareSideWidget> createState() => _CompareSideWidgetState();
}

class _CompareSideWidgetState extends State<CompareSideWidget> {
  late CompareSideModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompareSideModel());
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
      decoration: const BoxDecoration(),
      child: Builder(
        builder: (context) {
          if (widget.baseData != null) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  getJsonField(
                    widget.baseData,
                    r'''$.time''',
                  ).toString(),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).text3,
                      ),
                ),
                Text(
                  '${getJsonField(
                    widget.baseData,
                    r'''$.points''',
                  ).toString()} fina punten',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).text2,
                      ),
                ),
                Divider(
                  thickness: 3.0,
                  indent: 10.0,
                  endIndent: 10.0,
                  color: widget.isBest!
                      ? FlutterFlowTheme.of(context).performanceGood
                      : FlutterFlowTheme.of(context).performanceBad,
                ),
              ],
            );
          } else {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  '',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).text2,
                      ),
                ),
                Text(
                  'Nooit gewommen',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).text2,
                      ),
                ),
                Divider(
                  thickness: 3.0,
                  indent: 10.0,
                  endIndent: 10.0,
                  color: widget.isBest!
                      ? FlutterFlowTheme.of(context).performanceGood
                      : FlutterFlowTheme.of(context).performanceBad,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
