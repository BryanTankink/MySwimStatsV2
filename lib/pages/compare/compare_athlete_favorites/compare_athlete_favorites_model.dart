import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'compare_athlete_favorites_widget.dart'
    show CompareAthleteFavoritesWidget;
import 'package:flutter/material.dart';

class CompareAthleteFavoritesModel
    extends FlutterFlowModel<CompareAthleteFavoritesWidget> {
  ///  Local state fields for this page.

  UserStruct? selectedAthlete;
  void updateSelectedAthleteStruct(Function(UserStruct) updateFn) =>
      updateFn(selectedAthlete ??= UserStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
