import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'dashboard_feature_model.dart';
export 'dashboard_feature_model.dart';

class DashboardFeatureWidget extends StatefulWidget {
  const DashboardFeatureWidget({
    super.key,
    required this.titel,
    required this.beschrijving,
    bool? requiresPremium,
  }) : requiresPremium = requiresPremium ?? false;

  final String? titel;
  final String? beschrijving;
  final bool requiresPremium;

  @override
  State<DashboardFeatureWidget> createState() => _DashboardFeatureWidgetState();
}

class _DashboardFeatureWidgetState extends State<DashboardFeatureWidget> {
  late DashboardFeatureModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardFeatureModel());
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
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
      child: Container(
        width: 200.0,
        height: 85.0,
        decoration: const BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                Container(
                  width: 65.0,
                  height: 65.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                if (widget.requiresPremium && !FFAppState().premium)
                  Container(
                    width: 65.0,
                    height: 65.0,
                    decoration: BoxDecoration(
                      color: const Color(0x67000000),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.crown,
                        color: FlutterFlowTheme.of(context).text,
                        size: 32.0,
                      ),
                    ),
                  ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget.titel,
                        'Titel',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget.beschrijving,
                        'Beschrijving',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            fontSize: 12.0,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
