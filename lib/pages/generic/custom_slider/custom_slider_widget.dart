import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'custom_slider_model.dart';
export 'custom_slider_model.dart';

class CustomSliderWidget extends StatefulWidget {
  const CustomSliderWidget({
    Key? key,
    required this.title,
    int? value,
    int? stepSize,
    required this.onValueChanged,
  })  : this.value = value ?? 5,
        this.stepSize = stepSize ?? 1,
        super(key: key);

  final String? title;
  final int value;
  final int stepSize;
  final Future<dynamic> Function()? onValueChanged;

  @override
  _CustomSliderWidgetState createState() => _CustomSliderWidgetState();
}

class _CustomSliderWidgetState extends State<CustomSliderWidget> {
  late CustomSliderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomSliderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      height: 45.0,
      decoration: BoxDecoration(),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(-1.00, -1.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 2.0, 0.0, 0.0),
                child: Text(
                  widget.title!,
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).text3,
                      ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.00, 1.00),
              child: Container(
                height: 25.0,
                decoration: BoxDecoration(),
                child: Container(
                  width: double.infinity,
                  child: Slider(
                    activeColor: FlutterFlowTheme.of(context).text,
                    inactiveColor: FlutterFlowTheme.of(context).alternate,
                    min: 0.0,
                    max: 10.0,
                    value: _model.sliderValue ??= widget.value.toDouble(),
                    divisions: 10,
                    onChanged: (newValue) async {
                      setState(() => _model.sliderValue = newValue);
                      await widget.onValueChanged?.call();
                    },
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
