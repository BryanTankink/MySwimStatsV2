// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:switcher_button/switcher_button.dart';

class SatisfyingSwitch extends StatefulWidget {
  const SatisfyingSwitch({
    Key? key,
    this.width,
    this.height,
    this.size,
    this.onColor,
    this.offColor,
    required this.onChange,
    this.value,
    this.borderColor,
    this.borderWidth,
  }) : super(key: key);

  final double width;
  final double height;
  final double size;
  final Color onColor;
  final Color offColor;
  final Future<dynamic> Function() onChange;
  final bool value;
  final Color borderColor;
  final double borderWidth;

  @override
  _SatisfyingSwitchState createState() => _SatisfyingSwitchState();
}

class _SatisfyingSwitchState extends State<SatisfyingSwitch> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.size! / 2),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.size! / 2),
          border: Border.all(
            color: widget.borderColor ?? Colors.transparent,
            width: widget.borderWidth ?? 0,
          ),
        ),
        child: SwitcherButton(
          size: widget.size!,
          value: widget.value!,
          onColor: widget.onColor!,
          offColor: widget.offColor!,
          onChange: (value) async {
            await widget.onChange?.call();
          },
        ),
      ),
    );
  }
}
