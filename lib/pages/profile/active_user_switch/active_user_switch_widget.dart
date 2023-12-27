import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'active_user_switch_model.dart';
export 'active_user_switch_model.dart';

class ActiveUserSwitchWidget extends StatefulWidget {
  const ActiveUserSwitchWidget({super.key});

  @override
  _ActiveUserSwitchWidgetState createState() => _ActiveUserSwitchWidgetState();
}

class _ActiveUserSwitchWidgetState extends State<ActiveUserSwitchWidget> {
  late ActiveUserSwitchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActiveUserSwitchModel());
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
            if (valueOrDefault<bool>(
              getJsonField(
                    FFAppState().user,
                    r'''$.active.athleteId''',
                  ) !=
                  getJsonField(
                    FFAppState().user,
                    r'''$.me.athleteId''',
                  ),
              false,
            ))
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    HapticFeedback.selectionClick();
                    _model.apiResult0z8 = await ApiGroup.setActiveUserCall.call(
                      deviceIdentifier: FFAppState().deviceIdentifier,
                      swimrankingsIdentifier: getJsonField(
                        FFAppState().user,
                        r'''$.me.athleteId''',
                      ).toString(),
                    );
                    if ((_model.apiResult0z8?.succeeded ?? true)) {
                      await action_blocks.getUserAuth(context);

                      context.pushNamed('personalRecords');
                    }

                    setState(() {});
                  },
                  text: 'Als Actief instellen',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 45.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).text,
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

                  context.pushNamed(
                    'LinkSwimrankings',
                    queryParameters: {
                      'showHeader': serializeParam(
                        true,
                        ParamType.bool,
                      ),
                      'isFavorite': serializeParam(
                        false,
                        ParamType.bool,
                      ),
                      'addState': serializeParam(
                        UserAddState.SetActive,
                        ParamType.Enum,
                      ),
                    }.withoutNulls,
                  );

                  Navigator.pop(context);
                },
                text: 'Nieuwe gebruiker koppelen',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 45.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).buttonsnew,
                  textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).text3,
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
