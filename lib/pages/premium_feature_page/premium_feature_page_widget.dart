import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'premium_feature_page_model.dart';
export 'premium_feature_page_model.dart';

class PremiumFeaturePageWidget extends StatefulWidget {
  const PremiumFeaturePageWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  final String? imagePath;
  final String? title;
  final String? description;

  @override
  _PremiumFeaturePageWidgetState createState() =>
      _PremiumFeaturePageWidgetState();
}

class _PremiumFeaturePageWidgetState extends State<PremiumFeaturePageWidget> {
  late PremiumFeaturePageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PremiumFeaturePageModel());
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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            widget.imagePath!,
            height: 200.0,
            fit: BoxFit.fitHeight,
            errorBuilder: (context, error, stackTrace) => Image.asset(
              'assets/images/error_image.png',
              height: 200.0,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Divider(
          height: 32.0,
          thickness: 1.0,
          color: FlutterFlowTheme.of(context).text,
        ),
        Align(
          alignment: const AlignmentDirectional(0.0, -1.0),
          child: Text(
            valueOrDefault<String>(
              widget.title,
              'Premium Feature',
            ),
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).text,
                ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0.0, -1.0),
          child: Text(
            valueOrDefault<String>(
              widget.description,
              'Premium Description',
            ),
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).text3,
                ),
          ),
        ),
      ],
    );
  }
}
