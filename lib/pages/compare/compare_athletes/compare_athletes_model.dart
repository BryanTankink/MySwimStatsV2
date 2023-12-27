import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/swimrankings_list_item/swimrankings_list_item_widget.dart';
import 'compare_athletes_widget.dart' show CompareAthletesWidget;
import 'package:flutter/material.dart';

class CompareAthletesModel extends FlutterFlowModel<CompareAthletesWidget> {
  ///  Local state fields for this page.

  dynamic personB;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SwimrankingsListItem component.
  late SwimrankingsListItemModel swimrankingsListItemModel1;
  // Model for SwimrankingsListItem component.
  late SwimrankingsListItemModel swimrankingsListItemModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    swimrankingsListItemModel1 =
        createModel(context, () => SwimrankingsListItemModel());
    swimrankingsListItemModel2 =
        createModel(context, () => SwimrankingsListItemModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    swimrankingsListItemModel1.dispose();
    swimrankingsListItemModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
