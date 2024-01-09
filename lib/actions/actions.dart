import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:flutter/material.dart';

Future<bool> getUserAuth(
  BuildContext context, {
  bool? resetActiveToMe,
  bool? withoutRebuild,
}) async {
  ApiCallResponse? apiResultv4f;
  bool? isPremiumOtp;
  ApiCallResponse? apiResult6ha;

  apiResultv4f = await GetUserByDeviceIdentifierCall.call(
    deviceidentifier: FFAppState().deviceIdentifier,
    resetActiveToMe: resetActiveToMe ?? false,
  );
  if ((apiResultv4f.succeeded ?? true)) {
    if (getJsonField(
      (apiResultv4f.jsonBody ?? ''),
      r'''$.data.exists''',
    )) {
      FFAppState().user = getJsonField(
        (apiResultv4f.jsonBody ?? ''),
        r'''$.data''',
      );
      isPremiumOtp = await action_blocks.isPremium(context);
      if (isPremiumOtp) {
        apiResult6ha = await ApiGroup.getRecomendationsCountCall.call(
          deviceIdentifier: FFAppState().deviceIdentifier,
        );
        if ((apiResult6ha.succeeded ?? true)) {
          FFAppState().recommendationsCount =
              ApiGroup.getRecomendationsCountCall.unreadAmount(
            (apiResult6ha.jsonBody ?? ''),
          );
        }
      }
      FFAppState().activeUserId = getJsonField(
        (apiResultv4f.jsonBody ?? ''),
        r'''$.data.active.athleteId''',
      ).toString().toString();
      if ((withoutRebuild != null) && !withoutRebuild) {
        FFAppState().update(() {
          FFAppState().premium = isPremiumOtp!;
        });
      } else {
        FFAppState().premium = isPremiumOtp;
      }

      return true;
    } else {
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
}

Future<bool> isPremium(BuildContext context) async {
  if (isWeb) {
    FFAppState().update(() {
      FFAppState().premium = true;
    });
  } else {
    if (getJsonField(
      FFAppState().user,
      r'''$.specialPremium''',
    )) {
      FFAppState().update(() {
        FFAppState().premium = true;
      });
    } else {
      final isEntitled =
          await revenue_cat.isEntitled(FFAppConstants.premiumEntitelment) ??
              false;
      if (!isEntitled) {
        await revenue_cat.loadOfferings();
      }

      if (isEntitled) {
        FFAppState().update(() {
          FFAppState().premium = true;
        });
      } else {
        FFAppState().update(() {
          FFAppState().premium = false;
        });
      }
    }
  }

  return FFAppState().premium;
}
