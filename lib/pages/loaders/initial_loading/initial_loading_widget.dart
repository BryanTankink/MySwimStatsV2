import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/loaders/loader_component/loader_component_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'initial_loading_model.dart';
export 'initial_loading_model.dart';

class InitialLoadingWidget extends StatefulWidget {
  const InitialLoadingWidget({super.key});

  @override
  _InitialLoadingWidgetState createState() => _InitialLoadingWidgetState();
}

class _InitialLoadingWidgetState extends State<InitialLoadingWidget> {
  late InitialLoadingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InitialLoadingModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!FFAppState().idGenerated) {
        _model.deviceIdentifier = await actions.getDeviceIdentifier();
        if (_model.deviceIdentifier != null && _model.deviceIdentifier != '') {
          FFAppState().deviceIdentifier = _model.deviceIdentifier!;
        } else {
          FFAppState().deviceIdentifier = random_data.randomString(
            16,
            32,
            true,
            true,
            true,
          );
        }

        setState(() {
          FFAppState().idGenerated = true;
        });
      }
      _model.hasValidUser = await action_blocks.getUserAuth(
        context,
        resetActiveToMe: true,
      );
      _model.premiumStateResult = await ApiGroup.premiumStateCall.call();
      setState(() {
        FFAppState().isPremiumAllowed =
            ApiGroup.premiumStateCall.premiumAllowed(
          (_model.premiumStateResult?.jsonBody ?? ''),
        );
      });
      if (_model.hasValidUser!) {
        context.goNamed('Dashboard');
      }
    });
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
            message: 'Bezig met laden...',
          ),
        ),
      ),
    );
  }
}
