import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/loaders/loader_component/loader_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'generic_loader_model.dart';
export 'generic_loader_model.dart';

class GenericLoaderWidget extends StatefulWidget {
  const GenericLoaderWidget({
    super.key,
    String? loadingMessage,
  }) : loadingMessage = loadingMessage ?? 'Bezig met laden...';

  final String loadingMessage;

  @override
  State<GenericLoaderWidget> createState() => _GenericLoaderWidgetState();
}

class _GenericLoaderWidgetState extends State<GenericLoaderWidget> {
  late GenericLoaderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GenericLoaderModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'genericLoader'});
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
        body: wrapWithModel(
          model: _model.loaderComponentModel,
          updateCallback: () => setState(() {}),
          child: LoaderComponentWidget(
            message: widget.loadingMessage,
          ),
        ),
      ),
    );
  }
}
