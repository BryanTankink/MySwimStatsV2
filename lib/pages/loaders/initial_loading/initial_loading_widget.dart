import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/loaders/loader_component/loader_component_widget.dart';
import 'dart:async';
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
  State<InitialLoadingWidget> createState() => _InitialLoadingWidgetState();
}

class _InitialLoadingWidgetState extends State<InitialLoadingWidget> {
  late InitialLoadingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InitialLoadingModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'InitialLoading'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('INITIAL_LOADING_InitialLoading_ON_INIT_S');
      if (FFAppState().idGenerated) {
        logFirebaseEvent('InitialLoading_action_block');
        unawaited(
          () async {
            await action_blocks.checkNetworkConnectivity(context);
          }(),
        );
      } else {
        logFirebaseEvent('InitialLoading_action_block');
        unawaited(
          () async {
            await action_blocks.checkNetworkConnectivity(context);
          }(),
        );
        logFirebaseEvent('InitialLoading_custom_action');
        _model.deviceIdentifier = await actions.getDeviceIdentifier();
        if (_model.deviceIdentifier != null && _model.deviceIdentifier != '') {
          logFirebaseEvent('InitialLoading_update_app_state');
          FFAppState().deviceIdentifier = _model.deviceIdentifier!;
        } else {
          logFirebaseEvent('InitialLoading_update_app_state');
          FFAppState().deviceIdentifier = random_data.randomString(
            16,
            32,
            true,
            true,
            true,
          );
        }

        logFirebaseEvent('InitialLoading_update_app_state');
        setState(() {
          FFAppState().idGenerated = true;
        });
      }

      if (FFAppState().user != null) {
        logFirebaseEvent('InitialLoading_action_block');
        unawaited(
          () async {
            _model.hasValidUserAsync = await action_blocks.getUserAuth(
              context,
              resetActiveToMe: true,
            );
          }(),
        );
      } else {
        logFirebaseEvent('InitialLoading_action_block');
        _model.hasValidUser = await action_blocks.getUserAuth(
          context,
          resetActiveToMe: true,
        );
      }

      logFirebaseEvent('InitialLoading_action_block');
      unawaited(
        () async {
          await action_blocks.isPremium(context);
        }(),
      );
      if ((FFAppState().user != null) || _model.hasValidUser!) {
        logFirebaseEvent('InitialLoading_navigate_to');

        context.goNamed(
          'DashboardV2',
          extra: <String, dynamic>{
            kTransitionInfoKey: const TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
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
