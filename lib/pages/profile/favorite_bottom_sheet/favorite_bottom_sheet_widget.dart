import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'favorite_bottom_sheet_model.dart';
export 'favorite_bottom_sheet_model.dart';

class FavoriteBottomSheetWidget extends StatefulWidget {
  const FavoriteBottomSheetWidget({
    super.key,
    required this.favoriteAthleteId,
  });

  final int? favoriteAthleteId;

  @override
  State<FavoriteBottomSheetWidget> createState() =>
      _FavoriteBottomSheetWidgetState();
}

class _FavoriteBottomSheetWidgetState extends State<FavoriteBottomSheetWidget> {
  late FavoriteBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoriteBottomSheetModel());
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
      height: 230.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
        boxShadow: const [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(0.0, -3.0),
          )
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('FAVORITE_BOTTOM_SHEET_GEBRUIKEN_BTN_ON_T');
                  var shouldSetState = false;
                  logFirebaseEvent('Button_haptic_feedback');
                  HapticFeedback.selectionClick();
                  logFirebaseEvent('Button_backend_call');
                  _model.apiResultoov = await ApiGroup.setActiveUserCall.call(
                    deviceIdentifier: FFAppState().deviceIdentifier,
                    swimrankingsIdentifier:
                        widget.favoriteAthleteId?.toString(),
                  );
                  shouldSetState = true;
                  if ((_model.apiResultoov?.succeeded ?? true)) {
                    logFirebaseEvent('Button_action_block');
                    _model.userAuthOk =
                        await action_blocks.getUserAuth(context);
                    shouldSetState = true;
                    if (_model.userAuthOk!) {
                      logFirebaseEvent('Button_close_dialog,_drawer,_etc');
                      Navigator.pop(context);
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed('personalRecords');

                      if (shouldSetState) setState(() {});
                      return;
                    } else {
                      logFirebaseEvent('Button_close_dialog,_drawer,_etc');
                      Navigator.pop(context);
                    }
                  } else {
                    logFirebaseEvent('Button_haptic_feedback');
                    HapticFeedback.heavyImpact();
                    logFirebaseEvent('Button_alert_dialog');
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: const Text('ERROR'),
                          content: const Text(
                              'Er is iets fout gegaan aan de kant van de server! Probeer het later opnieuw!'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: const Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                    logFirebaseEvent('Button_close_dialog,_drawer,_etc');
                    Navigator.pop(context);
                  }

                  if (shouldSetState) setState(() {});
                },
                text: 'Gebruiken',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 45.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).text,
                  textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                  elevation: 2.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('FAVORITE_BOTTOM_SHEET_VERWIJDEREN_BTN_ON');
                  logFirebaseEvent('Button_haptic_feedback');
                  HapticFeedback.selectionClick();
                  logFirebaseEvent('Button_backend_call');
                  _model.apiResulthws =
                      await ApiGroup.deleteFavoritedUserCall.call(
                    deviceIdentifier: FFAppState().deviceIdentifier,
                    swimrankingsIdentifier:
                        widget.favoriteAthleteId?.toString(),
                  );
                  if ((_model.apiResulthws?.succeeded ?? true)) {
                    logFirebaseEvent('Button_action_block');
                    await action_blocks.getUserAuth(context);
                    setState(() {});
                  }
                  logFirebaseEvent('Button_close_dialog,_drawer,_etc');
                  Navigator.pop(context);

                  setState(() {});
                },
                text: 'Verwijderen',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 45.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).buttonCancel,
                  textStyle: FlutterFlowTheme.of(context).bodyLarge,
                  elevation: 2.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('FAVORITE_BOTTOM_SHEET_ANNULEREN_BTN_ON_T');
                  logFirebaseEvent('Button_haptic_feedback');
                  HapticFeedback.selectionClick();
                  logFirebaseEvent('Button_close_dialog,_drawer,_etc');
                  Navigator.pop(context);
                },
                text: 'Annuleren',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 45.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                  elevation: 0.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 0.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
