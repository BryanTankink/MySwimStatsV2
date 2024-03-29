import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/dashboard/dashboard_personal_record_line/dashboard_personal_record_line_widget.dart';
import '/pages/no_content/no_content_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dashboard_tab_page_model.dart';
export 'dashboard_tab_page_model.dart';

class DashboardTabPageWidget extends StatefulWidget {
  const DashboardTabPageWidget({
    super.key,
    required this.strokes,
    this.titleAddon,
    this.year,
    bool? longCourse,
  }) : longCourse = longCourse ?? false;

  final List<dynamic>? strokes;
  final String? titleAddon;
  final String? year;
  final bool longCourse;

  @override
  State<DashboardTabPageWidget> createState() => _DashboardTabPageWidgetState();
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
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 25.0,
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
              if (false)
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
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
                  alignment: const AlignmentDirectional(0.0, 0.0),
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
                  alignment: const AlignmentDirectional(1.0, 0.0),
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
              const Opacity(
                opacity: 0.0,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                  child: Icon(
                    Icons.settings_outlined,
                    size: 24.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Builder(
            builder: (context) {
              final stroke = widget.strokes!
                  .map((e) => e)
                  .toList()
                  .where((e) => () {
                        if (widget.longCourse &&
                            functions.isLongCourseType(getJsonField(
                              e,
                              r'''$.courseType''',
                            ))) {
                          return true;
                        } else if (!widget.longCourse &&
                            !functions.isLongCourseType(getJsonField(
                              e,
                              r'''$.courseType''',
                            ))) {
                          return true;
                        } else {
                          return false;
                        }
                      }())
                  .toList();
              if (stroke.isEmpty) {
                return const NoContentWidget(
                  title: 'Geen data',
                  description: 'Er is helaas geen informatie beschikbaar!',
                );
              }
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: stroke.length,
                itemBuilder: (context, strokeIndex) {
                  final strokeItem = stroke[strokeIndex];
                  return DashboardPersonalRecordLineWidget(
                    key: Key('Keydpx_${strokeIndex}_of_${stroke.length}'),
                    stroke: strokeItem,
                    titleAddon: widget.titleAddon,
                    year: widget.year,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
