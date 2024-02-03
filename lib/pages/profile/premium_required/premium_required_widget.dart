import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/premium_feature/premium_feature_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'premium_required_model.dart';
export 'premium_required_model.dart';

class PremiumRequiredWidget extends StatefulWidget {
  const PremiumRequiredWidget({
    super.key,
    required this.description,
  });

  final String? description;

  @override
  State<PremiumRequiredWidget> createState() => _PremiumRequiredWidgetState();
}

class _PremiumRequiredWidgetState extends State<PremiumRequiredWidget> {
  late PremiumRequiredModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PremiumRequiredModel());
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
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      child: Container(
        width: double.infinity,
        height: 300.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).cards,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: wrapWithModel(
          model: _model.premiumFeatureModel,
          updateCallback: () => setState(() {}),
          child: PremiumFeatureWidget(
            featureDescription: widget.description!,
          ),
        ),
      ),
    );
  }
}
