import '/components/revenue_cat_subsription_paywall_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'premium_sheet_model.dart';
export 'premium_sheet_model.dart';

class PremiumSheetWidget extends StatefulWidget {
  const PremiumSheetWidget({super.key});

  @override
  State<PremiumSheetWidget> createState() => _PremiumSheetWidgetState();
}

class _PremiumSheetWidgetState extends State<PremiumSheetWidget> {
  late PremiumSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PremiumSheetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return wrapWithModel(
      model: _model.revenueCatSubsriptionPaywallModel,
      updateCallback: () => setState(() {}),
      child: const RevenueCatSubsriptionPaywallWidget(),
    );
  }
}
