import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'no_content_model.dart';
export 'no_content_model.dart';

class NoContentWidget extends StatefulWidget {
  const NoContentWidget({
    super.key,
    required this.title,
    required this.description,
  });

  final String? title;
  final String? description;

  @override
  _NoContentWidgetState createState() => _NoContentWidgetState();
}

class _NoContentWidgetState extends State<NoContentWidget> {
  late NoContentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoContentModel());
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
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.title!,
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).titleMedium,
        ),
        Text(
          widget.description!,
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).labelMedium,
        ),
        Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/logo_square_600x600.png',
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
