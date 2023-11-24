import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/menu_item/menu_item_widget.dart';
import '/pages/generic/operation_button/operation_button_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_drawer_model.dart';
export 'app_drawer_model.dart';

class AppDrawerWidget extends StatefulWidget {
  const AppDrawerWidget({Key? key}) : super(key: key);

  @override
  _AppDrawerWidgetState createState() => _AppDrawerWidgetState();
}

class _AppDrawerWidgetState extends State<AppDrawerWidget> {
  late AppDrawerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppDrawerModel());
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
      height: double.infinity,
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
              Color(0xF2000000)
            ],
            stops: [0.0, 0.25, 1.0],
            begin: AlignmentDirectional(0.0, -1.0),
            end: AlignmentDirectional(0, 1.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Color_logo_-_no_background.png',
                    width: 200.0,
                    height: 50.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Text(
                  'Hallo, ${getJsonField(
                    FFAppState().user,
                    r'''$.me.fullName''',
                  ).toString()}',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).text3,
                      ),
                ),
              ),
              if (!FFAppState().premium)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: wrapWithModel(
                    model: _model.operationButtonModel,
                    updateCallback: () => setState(() {}),
                    child: OperationButtonWidget(
                      text: 'Unlock premium',
                      onClick: () async {
                        _model.purchaseState =
                            await revenue_cat.purchasePackage(revenue_cat
                                .offerings!.current!.monthly!.identifier);
                        if (_model.purchaseState!) {
                          await action_blocks.getUserAuth(context);
                          setState(() {});

                          context.goNamed('Dashboard');
                        }

                        setState(() {});
                      },
                    ),
                  ),
                ),
              Divider(
                height: 32.0,
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).accent4,
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('Dashboard');
                },
                child: wrapWithModel(
                  model: _model.menuItemModel1,
                  updateCallback: () => setState(() {}),
                  child: MenuItemWidget(
                    title: 'Dashboard',
                    icon: Icon(
                      Icons.home_outlined,
                      color: FlutterFlowTheme.of(context).text,
                      size: 24.0,
                    ),
                    isOnPage: FFAppState().activePageInfo.activePage ==
                        PageId.Dashboard,
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('contests');
                },
                child: wrapWithModel(
                  model: _model.menuItemModel2,
                  updateCallback: () => setState(() {}),
                  child: MenuItemWidget(
                    title: 'Wedstrijden',
                    icon: Icon(
                      Icons.rocket_launch_outlined,
                      color: FlutterFlowTheme.of(context).text,
                      size: 24.0,
                    ),
                    isOnPage:
                        FFAppState().activePageInfo.activePage == PageId.Races,
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('profile');
                },
                child: wrapWithModel(
                  model: _model.menuItemModel3,
                  updateCallback: () => setState(() {}),
                  child: MenuItemWidget(
                    title: 'Profiel',
                    icon: Icon(
                      Icons.person_outline,
                      color: FlutterFlowTheme.of(context).text,
                      size: 24.0,
                    ),
                    isOnPage: FFAppState().activePageInfo.activePage ==
                        PageId.Profile,
                  ),
                ),
              ),
              Divider(
                height: 32.0,
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).accent4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
