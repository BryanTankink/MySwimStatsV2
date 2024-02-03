import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/loaders/loader_component/loader_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'swim_rankings_loading_model.dart';
export 'swim_rankings_loading_model.dart';

class SwimRankingsLoadingWidget extends StatefulWidget {
  const SwimRankingsLoadingWidget({super.key});

  @override
  State<SwimRankingsLoadingWidget> createState() =>
      _SwimRankingsLoadingWidgetState();
}

class _SwimRankingsLoadingWidgetState extends State<SwimRankingsLoadingWidget> {
  late SwimRankingsLoadingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwimRankingsLoadingModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SwimRankingsLoading'});
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
          child: const LoaderComponentWidget(
            message:
                'We zijn bezig met het valideren van je gegevens bij Swimrankings. \n\nGelieve even geduld te hebben',
          ),
        ),
      ),
    );
  }
}
