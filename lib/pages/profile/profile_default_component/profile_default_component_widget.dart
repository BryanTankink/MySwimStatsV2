import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/profile/profile_users_page/profile_users_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'profile_default_component_model.dart';
export 'profile_default_component_model.dart';

class ProfileDefaultComponentWidget extends StatefulWidget {
  const ProfileDefaultComponentWidget({super.key});

  @override
  State<ProfileDefaultComponentWidget> createState() =>
      _ProfileDefaultComponentWidgetState();
}

class _ProfileDefaultComponentWidgetState
    extends State<ProfileDefaultComponentWidget> {
  late ProfileDefaultComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileDefaultComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.asset(
            'assets/images/background.webp',
          ).image,
        ),
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              FlutterFlowTheme.of(context).primary,
              const Color(0xD9000000),
              const Color(0xF3000000)
            ],
            stops: const [0.0, 0.25, 1.0],
            begin: const AlignmentDirectional(0.0, -1.0),
            end: const AlignmentDirectional(0, 1.0),
          ),
        ),
        child: wrapWithModel(
          model: _model.profileUsersPageModel,
          updateCallback: () => setState(() {}),
          child: const ProfileUsersPageWidget(),
        ),
      ),
    );
  }
}
