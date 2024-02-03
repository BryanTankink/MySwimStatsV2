import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'carousel_item_model.dart';
export 'carousel_item_model.dart';

class CarouselItemWidget extends StatefulWidget {
  const CarouselItemWidget({
    super.key,
    required this.pageIndex,
    required this.currentIndex,
    this.onClick,
  });

  final int? pageIndex;
  final int? currentIndex;
  final Future Function()? onClick;

  @override
  State<CarouselItemWidget> createState() => _CarouselItemWidgetState();
}

class _CarouselItemWidgetState extends State<CarouselItemWidget> {
  late CarouselItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarouselItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('CAROUSEL_ITEM_Container_mwobacd9_ON_TAP');
        logFirebaseEvent('Container_haptic_feedback');
        HapticFeedback.selectionClick();
        logFirebaseEvent('Container_execute_callback');
        await widget.onClick?.call();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).buttonsnew,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: widget.currentIndex == widget.pageIndex
                  ? FlutterFlowTheme.of(context).alternate
                  : const Color(0x00000000),
              offset: const Offset(0.0, 2.0),
            )
          ],
          shape: BoxShape.circle,
        ),
        child: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Text(
            valueOrDefault<String>(
              widget.pageIndex?.toString(),
              '0',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Poppins',
                  fontSize: 22.0,
                ),
          ),
        ),
      ),
    );
  }
}
