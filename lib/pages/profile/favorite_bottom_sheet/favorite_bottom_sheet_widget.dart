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
  _FavoriteBottomSheetWidgetState createState() =>
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
                  var shouldSetState = false;
                  HapticFeedback.selectionClick();
                  _model.apiResultoov = await ApiGroup.setActiveUserCall.call(
                    deviceIdentifier: FFAppState().deviceIdentifier,
                    swimrankingsIdentifier:
                        widget.favoriteAthleteId?.toString(),
                  );
                  shouldSetState = true;
                  if ((_model.apiResultoov?.succeeded ?? true)) {
                    _model.userAuthOk =
                        await action_blocks.getUserAuth(context);
                    shouldSetState = true;
                    if (_model.userAuthOk!) {
                      Navigator.pop(context);

                      context.pushNamed('personalRecords');

                      if (shouldSetState) setState(() {});
                      return;
                    } else {
                      Navigator.pop(context);
                    }
                  } else {
                    HapticFeedback.heavyImpact();
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
                  HapticFeedback.selectionClick();
                  _model.apiResulthws =
                      await ApiGroup.deleteFavoritedUserCall.call(
                    deviceIdentifier: FFAppState().deviceIdentifier,
                    swimrankingsIdentifier:
                        widget.favoriteAthleteId?.toString(),
                  );
                  if ((_model.apiResulthws?.succeeded ?? true)) {
                    await action_blocks.getUserAuth(context);
                    setState(() {});
                  }
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
                  HapticFeedback.selectionClick();
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
