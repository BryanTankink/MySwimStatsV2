import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'base_header_model.dart';
export 'base_header_model.dart';

class BaseHeaderWidget extends StatefulWidget {
  const BaseHeaderWidget({
    Key? key,
    required this.drawerClick,
  }) : super(key: key);

  final Future<dynamic> Function()? drawerClick;

  @override
  _BaseHeaderWidgetState createState() => _BaseHeaderWidgetState();
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
              alignment: AlignmentDirectional(0.00, 0.00),
              child: Container(
                width: 200.0,
                height: 50.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: Image.asset(
                      'assets/images/Color_logo_-_no_background.png',
                    ).image,
                  ),
                ),
              ),
            ),
          ],
        ),
        if (FFAppState().premium)
          Align(
            alignment: AlignmentDirectional(1.00, 0.00),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('advice');
              },
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Icon(
                        Icons.circle_notifications,
                        color: FlutterFlowTheme.of(context).text3,
                        size: 32.0,
                      ),
                    ),
                    if (FFAppState().recommendationsCount > 0)
                      Align(
                        alignment: AlignmentDirectional(1.00, -1.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 2.0, 2.0, 0.0),
                          child: Container(
                            width: 20.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).text,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x33000000),
                                  offset: Offset(0.0, 2.0),
                                )
                              ],
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
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
            await widget.drawerClick?.call();
          },
          child: Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(),
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
