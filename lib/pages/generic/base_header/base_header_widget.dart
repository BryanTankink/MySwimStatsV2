import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'base_header_model.dart';
export 'base_header_model.dart';

class BaseHeaderWidget extends StatefulWidget {
  const BaseHeaderWidget({
    super.key,
    required this.drawerClick,
  });

  final Future Function()? drawerClick;

  @override
  State<BaseHeaderWidget> createState() => _BaseHeaderWidgetState();
}

class _BaseHeaderWidgetState extends State<BaseHeaderWidget> {
  late BaseHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BaseHeaderModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: 200.0,
                height: 50.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: Image.asset(
                      'assets/images/logo_wide.webp',
                    ).image,
                  ),
                ),
              ),
            ),
          ],
        ),
        if (FFAppState().premium)
          Align(
            alignment: const AlignmentDirectional(1.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('BASE_HEADER_Container_w0wx0u1b_ON_TAP');
                logFirebaseEvent('Container_haptic_feedback');
                HapticFeedback.selectionClick();
                logFirebaseEvent('Container_navigate_to');

                context.pushNamed('advice');
              },
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: const BoxDecoration(),
                child: Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.circle_notifications,
                        color: FlutterFlowTheme.of(context).text3,
                        size: 32.0,
                      ),
                    ),
                    if (FFAppState().recommendationsCount > 0)
                      Align(
                        alignment: const AlignmentDirectional(1.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 2.0, 2.0, 0.0),
                          child: Container(
                            width: 20.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).text,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x33000000),
                                  offset: Offset(0.0, 2.0),
                                )
                              ],
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                FFAppState().recommendationsCount.toString(),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context).text3,
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('BASE_HEADER_Container_gpshr38v_ON_TAP');
            logFirebaseEvent('Container_haptic_feedback');
            HapticFeedback.selectionClick();
            logFirebaseEvent('Container_execute_callback');
            await widget.drawerClick?.call();
          },
          child: Container(
            width: 50.0,
            height: 50.0,
            decoration: const BoxDecoration(),
            child: Icon(
              Icons.menu_open,
              color: FlutterFlowTheme.of(context).text3,
              size: 32.0,
            ),
          ),
        ),
      ],
    );
  }
}
