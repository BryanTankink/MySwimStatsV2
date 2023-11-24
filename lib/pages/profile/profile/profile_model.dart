import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/generic/app_drawer/app_drawer_widget.dart';
import '/pages/generic/base_header/base_header_widget.dart';
import '/pages/profile/profile_default_component/profile_default_component_widget.dart';
import '/pages/profile/profile_premium_component/profile_premium_component_widget.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  Local state fields for this page.

  bool isPremium = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for profilePremiumComponent component.
  late ProfilePremiumComponentModel profilePremiumComponentModel;
  // Model for profileDefaultComponent component.
  late ProfileDefaultComponentModel profileDefaultComponentModel;
  // Model for baseHeader component.
  late BaseHeaderModel baseHeaderModel;
  // Model for appDrawer component.
  late AppDrawerModel appDrawerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    profilePremiumComponentModel =
        createModel(context, () => ProfilePremiumComponentModel());
    profileDefaultComponentModel =
        createModel(context, () => ProfileDefaultComponentModel());
    baseHeaderModel = createModel(context, () => BaseHeaderModel());
    appDrawerModel = createModel(context, () => AppDrawerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    profilePremiumComponentModel.dispose();
    profileDefaultComponentModel.dispose();
    baseHeaderModel.dispose();
    appDrawerModel.dispose();
  }

  /// Action blocks are added here.

  Future distancePropertyChanged(BuildContext context) async {
    if (widget.distanceValueChanged!) {
      return;
    }

    return;
  }

  /// Additional helper methods are added here.
}
