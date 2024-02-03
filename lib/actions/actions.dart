import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:flutter/material.dart';

Future<bool> getUserAuth(
  BuildContext context, {
  bool? resetActiveToMe,
  bool? withoutRebuild,
}) async {
  ApiCallResponse? getUser;
  bool? isPremiumOtp;

  logFirebaseEvent('GetUserAuth_backend_call');
  getUser = await GetUserByDeviceIdentifierCall.call(
    deviceidentifier: FFAppState().deviceIdentifier,
    resetActiveToMe: resetActiveToMe ?? false,
  );
  if ((getUser.succeeded ?? true)) {
    if (getJsonField(
      (getUser.jsonBody ?? ''),
      r'''$.data.exists''',
    )) {
      logFirebaseEvent('GetUserAuth_update_app_state');
      FFAppState().update(() {
        FFAppState().user = getJsonField(
          (getUser?.jsonBody ?? ''),
          r'''$.data''',
        );
      });
      logFirebaseEvent('GetUserAuth_action_block');
      unawaited(
        () async {
          isPremiumOtp = await action_blocks.isPremium(context);
        }(),
      );
      logFirebaseEvent('GetUserAuth_update_app_state');
      FFAppState().update(() {
        FFAppState().activeUserId = getJsonField(
          (getUser?.jsonBody ?? ''),
          r'''$.data.active.athleteId''',
        ).toString().toString();
      });
      return true;
    } else {
      logFirebaseEvent('GetUserAuth_navigate_to');

      context.goNamed(
        'Onboarding',
        extra: <String, dynamic>{
          kTransitionInfoKey: const TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
          ),
        },
      );

      return false;
    }
  } else {
    logFirebaseEvent('GetUserAuth_navigate_to');

    context.pushNamed(
      'ErrorPage',
      queryParameters: {
        'message': serializeParam(
          'De server is momenteel niet bereikbaar, probeer het over een aantal minuten nogmaals!',
          ParamType.String,
        ),
      }.withoutNulls,
      extra: <String, dynamic>{
        kTransitionInfoKey: const TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.fade,
          duration: Duration(milliseconds: 0),
        ),
      },
    );

    return false;
  }
}

Future<bool> isPremium(BuildContext context) async {
  if (isWeb) {
    logFirebaseEvent('isPremium_update_app_state');
    FFAppState().update(() {
      FFAppState().premium = true;
    });
  } else {
    if (getJsonField(
      FFAppState().user,
      r'''$.specialPremium''',
    )) {
      logFirebaseEvent('isPremium_update_app_state');
      FFAppState().update(() {
        FFAppState().premium = true;
      });
    } else {
      logFirebaseEvent('isPremium_revenue_cat');
      final isEntitled =
          await revenue_cat.isEntitled(FFAppConstants.premiumEntitelment) ??
              false;
      if (!isEntitled) {
        await revenue_cat.loadOfferings();
      }

      if (isEntitled) {
        logFirebaseEvent('isPremium_update_app_state');
        FFAppState().update(() {
          FFAppState().premium = true;
        });
      } else {
        logFirebaseEvent('isPremium_update_app_state');
        FFAppState().update(() {
          FFAppState().premium = false;
        });
      }
    }
  }

  logFirebaseEvent('isPremium_action_block');
  unawaited(
    () async {
      await action_blocks.obtainRecommendations(context);
    }(),
  );
  return FFAppState().premium;
}

Future obtainRecommendations(BuildContext context) async {
  ApiCallResponse? apiResult6ha;

  logFirebaseEvent('ObtainRecommendations_backend_call');
  apiResult6ha = await ApiGroup.getRecomendationsCountCall.call(
    deviceIdentifier: FFAppState().deviceIdentifier,
  );
  if ((apiResult6ha.succeeded ?? true)) {
    logFirebaseEvent('ObtainRecommendations_update_app_state');
    FFAppState().update(() {
      FFAppState().recommendationsCount =
          ApiGroup.getRecomendationsCountCall.unreadAmount(
        (apiResult6ha?.jsonBody ?? ''),
      );
    });
  }
}

Future checkNetworkConnectivity(BuildContext context) async {
  bool? networkTrue;

  logFirebaseEvent('CheckNetworkConnectivity_custom_action');
  networkTrue = await actions.checkInternetConnection();
  if (!networkTrue) {
    logFirebaseEvent('CheckNetworkConnectivity_navigate_to');

    context.goNamed(
      'ErrorPage',
      queryParameters: {
        'message': serializeParam(
          'Geen internetverbinding',
          ParamType.String,
        ),
      }.withoutNulls,
      extra: <String, dynamic>{
        kTransitionInfoKey: const TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.fade,
          duration: Duration(milliseconds: 250),
        ),
      },
    );

    return;
  }
}
