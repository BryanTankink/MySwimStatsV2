import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/dashboard/dashboard_personal_record_line/dashboard_personal_record_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dashboard_tab_page_model.dart';
export 'dashboard_tab_page_model.dart';

class DashboardTabPageWidget extends StatefulWidget {
  const DashboardTabPageWidget({
    Key? key,
    required this.strokes,
  }) : super(key: key);

  final List<dynamic>? strokes;

  @override
  _DashboardTabPageWidgetState createState() => _DashboardTabPageWidgetState();
}

class _DashboardTabPageWidgetState extends State<DashboardTabPageWidget> {
  late DashboardTabPageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardTabPageModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 25.0,
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
                      'Afstand',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).text3,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Text(
                      'Baan',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).text3,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Text(
                      'Tijd',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).text3,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: AlignmentDirectional(1.00, 0.00),
                    child: Text(
                      'Punten',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).text3,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0.0,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                    child: Icon(
                      Icons.play_arrow,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Builder(
              builder: (context) {
                final stroke = widget.strokes!.map((e) => e).toList();
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: stroke.length,
                  itemBuilder: (context, strokeIndex) {
                    final strokeItem = stroke[strokeIndex];
                    return DashboardPersonalRecordLineWidget(
                      key: Key('Keydpx_${strokeIndex}_of_${stroke.length}'),
                      stroke: strokeItem,
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
