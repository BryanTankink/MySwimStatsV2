import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:flutter/material.dart';

Future<bool> getUserAuth(BuildContext context) async {
  ApiCallResponse? apiResultv4f;
  bool? isPremiumOtp;
  ApiCallResponse? apiResult6ha;

  apiResultv4f = await GetUserByDeviceIdentifierCall.call(
    deviceidentifier: FFAppState().deviceIdentifier,
  );
  if ((apiResultv4f?.succeeded ?? true)) {
    if (getJsonField(
      (apiResultv4f?.jsonBody ?? ''),
      r'''$.data.exists''',
    )) {
      isPremiumOtp = await action_blocks.isPremium(context);
      if (isPremiumOtp!) {
        apiResult6ha = await ApiGroup.getRecomendationsCountCall.call(
          deviceIdentifier: FFAppState().deviceIdentifier,
        );
        if ((apiResult6ha?.succeeded ?? true)) {
          FFAppState().recommendationsCount =
              ApiGroup.getRecomendationsCountCall.unreadAmount(
            (apiResult6ha?.jsonBody ?? ''),
          );
        }
      }
      FFAppState().activeUserId = getJsonField(
        (apiResultv4f?.jsonBody ?? ''),
        r'''$.data.active.athleteId''',
      ).toString().toString();
      FFAppState().premium = isPremiumOtp!;
      FFAppState().update(() {
        FFAppState().user = getJsonField(
          (apiResultv4f?.jsonBody ?? ''),
          r'''$.data''',
        );
      });
      return true;
    } else {
      context.goNamed(
        'Onboarding',
        extra: <String, dynamic>{
          kTransitionInfoKey: TransitionInfo(
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
        kTransitionInfoKey: TransitionInfo(
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
    return true;
  }

  final isEntitled =
      await revenue_cat.isEntitled(FFAppConstants.premiumEntitelment) ?? false;
  if (!isEntitled) {
    await revenue_cat.loadOfferings();
  }

  if (isEntitled) {
    return true;
  }

  return false;
}
