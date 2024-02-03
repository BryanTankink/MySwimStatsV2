import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/app_drawer/app_drawer_widget.dart';
import '/pages/generic/base_header/base_header_widget.dart';
import '/pages/generic/bottom_navigator/bottom_navigator_widget.dart';
import '/pages/profile/profile_default_component/profile_default_component_widget.dart';
import '/pages/profile/profile_premium_component/profile_premium_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({
    super.key,
    this.distanceValueChanged,
    int? page,
  }) : page = page ?? 0;

  final bool? distanceValueChanged;
  final int page;

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'profile'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PROFILE_PAGE_profile_ON_INIT_STATE');
      logFirebaseEvent('profile_update_app_state');
      setState(() {
        FFAppState().updateActivePageInfoStruct(
          (e) => e..activePage = PageId.Profile,
        );
      });
    });
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
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.appDrawerModel,
            updateCallback: () => setState(() {}),
            child: const AppDrawerWidget(),
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: wrapWithModel(
            model: _model.baseHeaderModel,
            updateCallback: () => setState(() {}),
            child: BaseHeaderWidget(
              drawerClick: () async {
                logFirebaseEvent('PROFILE_PAGE_Container_rp4b8evh_CALLBACK');
                logFirebaseEvent('baseHeader_drawer');
                scaffoldKey.currentState!.openDrawer();
              },
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
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
              wrapWithModel(
                model: _model.bottomNavigatorModel,
                updateCallback: () => setState(() {}),
                child: const BottomNavigatorWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
