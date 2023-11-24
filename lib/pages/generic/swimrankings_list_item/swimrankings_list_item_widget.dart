import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'swimrankings_list_item_model.dart';
export 'swimrankings_list_item_model.dart';

class SwimrankingsListItemWidget extends StatefulWidget {
  const SwimrankingsListItemWidget({
    super.key,
    String? name,
    String? date,
  })  : name = name ?? 'Onbekend',
        date = date ?? 'Onbekend';

  final String name;
  final String date;

  @override
  _SwimrankingsListItemWidgetState createState() =>
      _SwimrankingsListItemWidgetState();
}

class _SwimrankingsListItemWidgetState
    extends State<SwimrankingsListItemWidget> {
  late SwimrankingsListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwimrankingsListItemModel());
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
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 75.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondary,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33FFFFFF),
              offset: Offset(0.0, 2.0),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.name,
                            'Onbekend',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).text,
                                  ),
                        ),
                      ),
                      if (widget.date != 'null')
                        Text(
                          widget.date,
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).text2,
                                  ),
                        ),
                    ],
                  ),
                ),
              ),
              Icon(
                Icons.play_arrow,
                color: FlutterFlowTheme.of(context).text3,
                size: 18.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
