import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/dashboard/dashboard_tab_page/dashboard_tab_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dashboard_performance_component_model.dart';
export 'dashboard_performance_component_model.dart';

class DashboardPerformanceComponentWidget extends StatefulWidget {
  const DashboardPerformanceComponentWidget({
    super.key,
    required this.dashboardperformances,
    this.titleAddon,
    this.year,
  });

  final dynamic dashboardperformances;
  final String? titleAddon;
  final String? year;

  @override
  _DashboardPerformanceComponentWidgetState createState() =>
      _DashboardPerformanceComponentWidgetState();
}

class _DashboardPerformanceComponentWidgetState
    extends State<DashboardPerformanceComponentWidget>
    with TickerProviderStateMixin {
  late DashboardPerformanceComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardPerformanceComponentModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
      children: [
        Align(
          alignment: const Alignment(0.0, 0),
          child: TabBar(
            isScrollable: true,
            labelColor: FlutterFlowTheme.of(context).text,
            unselectedLabelColor: FlutterFlowTheme.of(context).secondaryText,
            labelStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Poppins',
                  fontSize: 14.0,
                ),
            unselectedLabelStyle: const TextStyle(),
            indicatorColor: FlutterFlowTheme.of(context).text3,
            padding: const EdgeInsets.all(4.0),
            tabs: const [
              Tab(
                text: 'Vlinderslag',
              ),
              Tab(
                text: 'Rugcrawl',
              ),
              Tab(
                text: 'Schoolslag',
              ),
              Tab(
                text: 'Vrije slag',
              ),
              Tab(
                text: 'Wisselslag',
              ),
            ],
            controller: _model.tabBarController,
            onTap: (i) async {
              [
                () async {},
                () async {},
                () async {},
                () async {},
                () async {}
              ][i]();
            },
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _model.tabBarController,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: wrapWithModel(
                  model: _model.dashboardTabPageModel1,
                  updateCallback: () => setState(() {}),
                  child: DashboardTabPageWidget(
                    strokes: getJsonField(
                      widget.dashboardperformances,
                      r'''$.butterfly''',
                      true,
                    )!,
                    titleAddon: widget.titleAddon,
                    year: widget.year,
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.dashboardTabPageModel2,
                updateCallback: () => setState(() {}),
                child: DashboardTabPageWidget(
                  strokes: getJsonField(
                    widget.dashboardperformances,
                    r'''$.backstroke''',
                    true,
                  )!,
                  titleAddon: widget.titleAddon,
                  year: widget.year,
                ),
              ),
              wrapWithModel(
                model: _model.dashboardTabPageModel3,
                updateCallback: () => setState(() {}),
                child: DashboardTabPageWidget(
                  strokes: getJsonField(
                    widget.dashboardperformances,
                    r'''$.breaststroke''',
                    true,
                  )!,
                  titleAddon: widget.titleAddon,
                  year: widget.year,
                ),
              ),
              wrapWithModel(
                model: _model.dashboardTabPageModel4,
                updateCallback: () => setState(() {}),
                child: DashboardTabPageWidget(
                  strokes: getJsonField(
                    widget.dashboardperformances,
                    r'''$.freeStyle''',
                    true,
                  )!,
                  titleAddon: widget.titleAddon,
                  year: widget.year,
                ),
              ),
              wrapWithModel(
                model: _model.dashboardTabPageModel5,
                updateCallback: () => setState(() {}),
                child: DashboardTabPageWidget(
                  strokes: getJsonField(
                    widget.dashboardperformances,
                    r'''$.medley''',
                    true,
                  )!,
                  titleAddon: widget.titleAddon,
                  year: widget.year,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
