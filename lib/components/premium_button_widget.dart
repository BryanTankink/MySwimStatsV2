import '/components/revenue_cat_subsription_paywall_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/operation_button/operation_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'premium_button_model.dart';
export 'premium_button_model.dart';

class PremiumButtonWidget extends StatefulWidget {
  const PremiumButtonWidget({super.key});

  @override
  State<PremiumButtonWidget> createState() => _PremiumButtonWidgetState();
}

class _PremiumButtonWidgetState extends State<PremiumButtonWidget> {
  late PremiumButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PremiumButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: const BoxDecoration(),
      child: Builder(
        builder: (context) {
          if (!FFAppState().premium) {
            return Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: wrapWithModel(
                model: _model.operationButtonModel1,
                updateCallback: () => setState(() {}),
                child: OperationButtonWidget(
                  text: 'Unlock premium',
                  onClick: () async {
                    logFirebaseEvent(
                        'PREMIUM_BUTTON_Container_q8nxvtrx_CALLBA');
                    logFirebaseEvent('OperationButton_bottom_sheet');
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      useSafeArea: true,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: const RevenueCatSubsriptionPaywallWidget(),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                ),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: wrapWithModel(
                model: _model.operationButtonModel2,
                updateCallback: () => setState(() {}),
                child: OperationButtonWidget(
                  text: 'Premium beheren',
                  onClick: () async {
                    logFirebaseEvent(
                        'PREMIUM_BUTTON_Container_prnqsgx7_CALLBA');
                    logFirebaseEvent('OperationButton_bottom_sheet');
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      useSafeArea: true,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: const RevenueCatSubsriptionPaywallWidget(),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
