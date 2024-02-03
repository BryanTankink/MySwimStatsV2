import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'short_long_course_switcher_model.dart';
export 'short_long_course_switcher_model.dart';

class ShortLongCourseSwitcherWidget extends StatefulWidget {
  const ShortLongCourseSwitcherWidget({super.key});

  @override
  State<ShortLongCourseSwitcherWidget> createState() =>
      _ShortLongCourseSwitcherWidgetState();
}

class _ShortLongCourseSwitcherWidgetState
    extends State<ShortLongCourseSwitcherWidget> {
  late ShortLongCourseSwitcherModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShortLongCourseSwitcherModel());
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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).cards,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SwitchListTile.adaptive(
        value: _model.switchListTileValue ??= FFAppState().displayLongCourse,
        onChanged: (newValue) async {
          setState(() => _model.switchListTileValue = newValue);
          if (newValue) {
            logFirebaseEvent('SHORT_LONG_COURSE_SWITCHER_SwitchListTil');
            logFirebaseEvent('SwitchListTile_update_app_state');
            FFAppState().update(() {
              FFAppState().displayLongCourse = true;
            });
          } else {
            logFirebaseEvent('SHORT_LONG_COURSE_SWITCHER_SwitchListTil');
            logFirebaseEvent('SwitchListTile_update_app_state');
            FFAppState().update(() {
              FFAppState().displayLongCourse = false;
            });
          }
        },
        title: Text(
          'Korte / Lange baan',
          style: FlutterFlowTheme.of(context).titleLarge.override(
                fontFamily: 'Poppins',
                fontSize: 16.0,
              ),
        ),
        subtitle: Text(
          'Schakel tussen korte en lange baan',
          style: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Poppins',
                fontSize: 12.0,
              ),
        ),
        activeColor: FlutterFlowTheme.of(context).primaryText,
        activeTrackColor: FlutterFlowTheme.of(context).accent2,
        dense: false,
        controlAffinity: ListTileControlAffinity.trailing,
      ),
    );
  }
}
