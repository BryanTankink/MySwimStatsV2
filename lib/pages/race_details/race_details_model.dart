import '/flutter_flow/flutter_flow_util.dart';
import '/pages/contests/swim_detail_object/swim_detail_object_widget.dart';
import 'race_details_widget.dart' show RaceDetailsWidget;
import 'package:flutter/material.dart';

class RaceDetailsModel extends FlutterFlowModel<RaceDetailsWidget> {
  ///  Local state fields for this page.

  List<dynamic> splits = [];
  void addToSplits(dynamic item) => splits.add(item);
  void removeFromSplits(dynamic item) => splits.remove(item);
  void removeAtIndexFromSplits(int index) => splits.removeAt(index);
  void insertAtIndexInSplits(int index, dynamic item) =>
      splits.insert(index, item);
  void updateSplitsAtIndex(int index, Function(dynamic) updateFn) =>
      splits[index] = updateFn(splits[index]);

  bool hasSplits = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for swimDetailObject component.
  late SwimDetailObjectModel swimDetailObjectModel;
  // State field(s) for minutes widget.
  FocusNode? minutesFocusNode;
  TextEditingController? minutesController;
  String? Function(BuildContext, String?)? minutesControllerValidator;
  // State field(s) for seconds widget.
  FocusNode? secondsFocusNode;
  TextEditingController? secondsController;
  String? Function(BuildContext, String?)? secondsControllerValidator;
  // State field(s) for milliseconds widget.
  FocusNode? millisecondsFocusNode;
  TextEditingController? millisecondsController;
  String? Function(BuildContext, String?)? millisecondsControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    swimDetailObjectModel = createModel(context, () => SwimDetailObjectModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    swimDetailObjectModel.dispose();
    minutesFocusNode?.dispose();
    minutesController?.dispose();

    secondsFocusNode?.dispose();
    secondsController?.dispose();

    millisecondsFocusNode?.dispose();
    millisecondsController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
