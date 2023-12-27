import '/components/dashboard_performance_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'growth_year_details_model.dart';
export 'growth_year_details_model.dart';

class GrowthYearDetailsWidget extends StatefulWidget {
  const GrowthYearDetailsWidget({
    super.key,
    required this.yearInfo,
  });

  final dynamic yearInfo;

  @override
  _GrowthYearDetailsWidgetState createState() =>
      _GrowthYearDetailsWidgetState();
}

class _GrowthYearDetailsWidgetState extends State<GrowthYearDetailsWidget> {
  late GrowthYearDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GrowthYearDetailsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_left,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              HapticFeedback.selectionClick();
              context.pop();
            },
          ),
          title: Text(
            'Groei in ${getJsonField(
              widget.yearInfo,
              r'''$.year''',
            ).toString()}',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/Topical_Micellair_Water_2.jpg',
                ).image,
              ),
            ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).primary,
                    const Color(0xD9000000),
                    const Color(0xF2000000)
                  ],
                  stops: const [0.0, 0.25, 1.0],
                  begin: const AlignmentDirectional(0.0, -1.0),
                  end: const AlignmentDirectional(0, 1.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Gemiddelde aantal fina punten',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).text3,
                          ),
                    ),
                    Text(
                      getJsonField(
                        widget.yearInfo,
                        r'''$.points''',
                      ).toString(),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).text,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Text(
                        'Onderstaand zijn de door jou gezwommen persoonlijke records in dit jaar.',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).text3,
                              fontSize: 14.0,
                            ),
                      ),
                    ),
                    Expanded(
                      child: wrapWithModel(
                        model: _model.dashboardPerformanceComponentModel,
                        updateCallback: () => setState(() {}),
                        child: DashboardPerformanceComponentWidget(
                          dashboardperformances: getJsonField(
                            widget.yearInfo,
                            r'''$.performances''',
                          ),
                          titleAddon: ' (in ${getJsonField(
                            widget.yearInfo,
                            r'''$.year''',
                          ).toString()})',
                          year: getJsonField(
                            widget.yearInfo,
                            r'''$.year''',
                          ).toString(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
