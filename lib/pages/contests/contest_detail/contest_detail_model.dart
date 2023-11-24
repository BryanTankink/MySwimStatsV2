import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/swimrankings_list_item/swimrankings_list_item_widget.dart';
import 'contest_detail_widget.dart' show ContestDetailWidget;
import 'package:flutter/material.dart';

class ContestDetailModel extends FlutterFlowModel<ContestDetailWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SwimrankingsListItem component.
  late SwimrankingsListItemModel swimrankingsListItemModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    swimrankingsListItemModel =
        createModel(context, () => SwimrankingsListItemModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    swimrankingsListItemModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
