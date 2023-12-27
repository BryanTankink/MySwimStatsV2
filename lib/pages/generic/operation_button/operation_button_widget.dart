import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'operation_button_model.dart';
export 'operation_button_model.dart';

class OperationButtonWidget extends StatefulWidget {
  const OperationButtonWidget({
    super.key,
    required this.text,
    required this.onClick,
  });

  final String? text;
  final Future<dynamic> Function()? onClick;

  @override
  _OperationButtonWidgetState createState() => _OperationButtonWidgetState();
}

class _OperationButtonWidgetState extends State<OperationButtonWidget> {
  late OperationButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OperationButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          if (_model.isLoading) {
            HapticFeedback.lightImpact();
          } else {
            setState(() {
              _model.isLoading = true;
            });
            HapticFeedback.selectionClick();
            await widget.onClick?.call();
            setState(() {
              _model.isLoading = false;
            });
          }
        },
        child: Container(
          width: 230.0,
          height: 52.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).buttonsnew,
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).text3,
                  width: 0.25,
                ),
              ),
              child: Stack(
                children: [
                  if (!_model.isLoading)
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        widget.text!,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).text3,
                              fontSize: 16.0,
                            ),
                      ),
                    ),
                  if (_model.isLoading)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.asset(
                        'assets/images/Ripple-1s-200px_(2).gif',
                        width: 300.0,
                        height: 200.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
