import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/profile/profile_distance_settings/profile_distance_settings_widget.dart';
import '/pages/profile/profile_stroke_settings/profile_stroke_settings_widget.dart';
import '/pages/profile/profile_users_page/profile_users_page_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_premium_component_model.dart';
export 'profile_premium_component_model.dart';

class ProfilePremiumComponentWidget extends StatefulWidget {
  const ProfilePremiumComponentWidget({Key? key}) : super(key: key);

  @override
  _ProfilePremiumComponentWidgetState createState() =>
      _ProfilePremiumComponentWidgetState();
}

class _ProfilePremiumComponentWidgetState
    extends State<ProfilePremiumComponentWidget> {
  late ProfilePremiumComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilePremiumComponentModel());
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
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.asset(
            'assets/images/Topical_Micellair_Water_2.jpg',
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
              Color(0xD9000000),
              Color(0xF3000000)
            ],
            stops: [0.0, 0.25, 1.0],
            begin: AlignmentDirectional(0.0, -1.0),
            end: AlignmentDirectional(0, 1.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: 500.0,
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                      child: PageView(
                        controller: _model.pageViewController ??=
                            PageController(initialPage: 0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          wrapWithModel(
                            model: _model.profileUsersPageModel,
                            updateCallback: () => setState(() {}),
                            child: ProfileUsersPageWidget(),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: wrapWithModel(
                              model: _model.profileDistanceSettingsModel,
                              updateCallback: () => setState(() {}),
                              child: ProfileDistanceSettingsWidget(),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: wrapWithModel(
                              model: _model.profileStrokeSettingsModel,
                              updateCallback: () => setState(() {}),
                              child: ProfileStrokeSettingsWidget(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.00, 1.00),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: smooth_page_indicator.SmoothPageIndicator(
                          controller: _model.pageViewController ??=
                              PageController(initialPage: 0),
                          count: 3,
                          axisDirection: Axis.horizontal,
                          onDotClicked: (i) async {
                            await _model.pageViewController!.animateToPage(
                              i,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          effect: smooth_page_indicator.ExpandingDotsEffect(
                            expansionFactor: 3.0,
                            spacing: 8.0,
                            radius: 16.0,
                            dotWidth: 16.0,
                            dotHeight: 8.0,
                            dotColor: FlutterFlowTheme.of(context).text3,
                            activeDotColor: FlutterFlowTheme.of(context).text,
                            paintStyle: PaintingStyle.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
