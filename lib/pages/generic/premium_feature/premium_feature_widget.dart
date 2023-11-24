import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/operation_button/operation_button_widget.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'premium_feature_model.dart';
export 'premium_feature_model.dart';

class PremiumFeatureWidget extends StatefulWidget {
  const PremiumFeatureWidget({
    Key? key,
    required this.featureDescription,
  }) : super(key: key);

  final String? featureDescription;

  @override
  _PremiumFeatureWidgetState createState() => _PremiumFeatureWidgetState();
}

class _PremiumFeatureWidgetState extends State<PremiumFeatureWidget> {
  late PremiumFeatureModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PremiumFeatureModel());
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
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Premium feature',
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).text3,
                  ),
            ),
            Align(
              alignment: AlignmentDirectional(0.00, 0.00),
              child: Text(
                widget.featureDescription!,
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).text3,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
              child: wrapWithModel(
                model: _model.operationButtonModel,
                updateCallback: () => setState(() {}),
                child: OperationButtonWidget(
                  text: 'Neem nu!',
                  onClick: () async {
                    if (revenue_cat.activeEntitlementIds
                        .contains(FFAppConstants.premiumEntitelment)) {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Al premium!'),
                            content: Text(
                                'Ah, het lijkt erop dat jij al premium bent!'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      _model.purchaseSuccess =
                          await revenue_cat.purchasePackage(revenue_cat
                              .offerings!.current!.monthly!.identifier);
                      if (_model.purchaseSuccess!) {
                        FFAppState().update(() {});

                        context.goNamed('Dashboard');
                      }
                    }

                    setState(() {});
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
