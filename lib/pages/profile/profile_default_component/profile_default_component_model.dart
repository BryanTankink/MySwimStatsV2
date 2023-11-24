import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/profile/profile_users_page/profile_users_page_widget.dart';
import 'profile_default_component_widget.dart'
    show ProfileDefaultComponentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileDefaultComponentModel
    extends FlutterFlowModel<ProfileDefaultComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for profileUsersPage component.
  late ProfileUsersPageModel profileUsersPageModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    profileUsersPageModel = createModel(context, () => ProfileUsersPageModel());
  }

  void dispose() {
    profileUsersPageModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
