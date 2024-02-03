import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/operation_button/operation_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'no_favorites_component_model.dart';
export 'no_favorites_component_model.dart';

class NoFavoritesComponentWidget extends StatefulWidget {
  const NoFavoritesComponentWidget({super.key});

  @override
  State<NoFavoritesComponentWidget> createState() =>
      _NoFavoritesComponentWidgetState();
}

class _NoFavoritesComponentWidgetState
    extends State<NoFavoritesComponentWidget> {
  late NoFavoritesComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoFavoritesComponentModel());
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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Divider(
            height: 32.0,
            thickness: 1.0,
            color: FlutterFlowTheme.of(context).performanceBad,
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Text(
                'Geen favorieten',
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).text3,
                    ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Text(
              'Om gegevens te vergelijken, dien je eerst favorieten toe te voegen aan je account!',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).text2,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
            child: wrapWithModel(
              model: _model.operationButtonModel,
              updateCallback: () => setState(() {}),
              child: OperationButtonWidget(
                text: 'Toevoegen',
                onClick: () async {
                  logFirebaseEvent('NO_FAVORITES_COMPONENT_Container_ipogllw');
                  logFirebaseEvent('OperationButton_navigate_to');

                  context.goNamed('profile');
                },
              ),
            ),
          ),
          Divider(
            height: 32.0,
            thickness: 1.0,
            color: FlutterFlowTheme.of(context).performanceBad,
          ),
        ],
      ),
    );
  }
}
