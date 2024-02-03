import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/profile/profile_default_component/profile_default_component_widget.dart';
import '/pages/profile/profile_premium_component/profile_premium_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'profile_quick_edit_model.dart';
export 'profile_quick_edit_model.dart';

class ProfileQuickEditWidget extends StatefulWidget {
  const ProfileQuickEditWidget({
    super.key,
    int? page,
  }) : page = page ?? 0;

  final int page;

  @override
  State<ProfileQuickEditWidget> createState() => _ProfileQuickEditWidgetState();
}

class _ProfileQuickEditWidgetState extends State<ProfileQuickEditWidget> {
  late ProfileQuickEditModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileQuickEditModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ProfileQuickEdit'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_left,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('PROFILE_QUICK_EDIT_arrow_left_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'profiel',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Builder(
            builder: (context) {
              if (FFAppState().premium) {
                return wrapWithModel(
                  model: _model.profilePremiumComponentModel,
                  updateCallback: () => setState(() {}),
                  child: ProfilePremiumComponentWidget(
                    pageNumber: widget.page,
                  ),
                );
              } else {
                return wrapWithModel(
                  model: _model.profileDefaultComponentModel,
                  updateCallback: () => setState(() {}),
                  child: const ProfileDefaultComponentWidget(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
