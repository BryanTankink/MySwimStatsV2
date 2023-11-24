import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/generic/operation_button/operation_button_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'link_swimrankings_model.dart';
export 'link_swimrankings_model.dart';

class LinkSwimrankingsWidget extends StatefulWidget {
  const LinkSwimrankingsWidget({
    Key? key,
    bool? showHeader,
    bool? isFavorite,
  })  : this.showHeader = showHeader ?? false,
        this.isFavorite = isFavorite ?? false,
        super(key: key);

  final bool showHeader;
  final bool isFavorite;

  @override
  _LinkSwimrankingsWidgetState createState() => _LinkSwimrankingsWidgetState();
}

class _LinkSwimrankingsWidgetState extends State<LinkSwimrankingsWidget>
    with TickerProviderStateMixin {
  late LinkSwimrankingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 300.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 300.ms,
          duration: 600.ms,
          begin: Offset(0.6, 0.6),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LinkSwimrankingsModel());

    _model.nameFieldController ??= TextEditingController();
    _model.nameFieldFocusNode ??= FocusNode();
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
        appBar: widget.showHeader
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                ),
                title: Text(
                  'Account',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 2.0,
              )
            : null,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/Topical_Micellair_Water_2.jpg',
              ).image,
            ),
          ),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  FlutterFlowTheme.of(context).primary,
                  Color(0xD8000000),
                  Color(0xE7000000)
                ],
                stops: [0.0, 0.25, 1.0],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/logo_square_600x600.png',
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.00, -1.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'Naam',
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: TextFormField(
                                  key: ValueKey('NameField_6sov'),
                                  controller: _model.nameFieldController,
                                  focusNode: _model.nameFieldFocusNode,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Vul je volledige naam in',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .text2,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color:
                                            FlutterFlowTheme.of(context).text,
                                      ),
                                  validator: _model.nameFieldControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.00, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 32.0, 10.0, 0.0),
                                  child: Text(
                                    'Let op:\nDe naam die jij in voert moet bekend zijn bij SwimRankings. Als jij niet vindbaar bent met deze naam op SwimRankings zullen wij helaas geen mooie overzichten voor jou kunnen maken!',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .text2,
                                          fontSize: 12.0,
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
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 44.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      wrapWithModel(
                        model: _model.operationButtonModel,
                        updateCallback: () => setState(() {}),
                        child: OperationButtonWidget(
                          key: ValueKey('OperationButton_ku9o'),
                          text: 'Controleren',
                          onClick: () async {
                            var _shouldSetState = false;
                            if (!(_model.nameFieldController.text != null &&
                                _model.nameFieldController.text != '')) {
                              HapticFeedback.mediumImpact();
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Error'),
                                    content: Text('Vul een naam in!'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              if (_shouldSetState) setState(() {});
                              return;
                            }
                            _model.nameVerifyResultCopy =
                                await VerifyFullNameCall.call(
                              fullName: _model.nameFieldController.text,
                            );
                            _shouldSetState = true;
                            if ((_model.nameVerifyResultCopy?.succeeded ??
                                true)) {
                              if (VerifyFullNameCall.userCount(
                                    (_model.nameVerifyResultCopy?.jsonBody ??
                                        ''),
                                  ) >
                                  0) {
                                if (VerifyFullNameCall.userCount(
                                      (_model.nameVerifyResultCopy?.jsonBody ??
                                          ''),
                                    ) >
                                    1) {
                                  if (VerifyFullNameCall.userCount(
                                        (_model.nameVerifyResultCopy
                                                ?.jsonBody ??
                                            ''),
                                      ) <
                                      25) {
                                    HapticFeedback.lightImpact();

                                    context.pushNamed(
                                      'ListSwimrankingsAccounts',
                                      queryParameters: {
                                        'accounts': serializeParam(
                                          VerifyFullNameCall.users(
                                            (_model.nameVerifyResultCopy
                                                    ?.jsonBody ??
                                                ''),
                                          ),
                                          ParamType.JSON,
                                          true,
                                        ),
                                        'isFavorite': serializeParam(
                                          widget.isFavorite,
                                          ParamType.bool,
                                        ),
                                        'enteredName': serializeParam(
                                          _model.nameFieldController.text,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );

                                    if (_shouldSetState) setState(() {});
                                    return;
                                  } else {
                                    HapticFeedback.heavyImpact();
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Verfijn naam'),
                                          content: Text(
                                              'We krijgen te veel resultaten terug! Vul je volledige naam in om je zoekresultaat te verfijnen!'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                } else {
                                  HapticFeedback.lightImpact();
                                  if (widget.isFavorite) {
                                    _model.apiResultbp8 = await ApiGroup
                                        .addFavoritedUserCall
                                        .call(
                                      deviceIdentifier:
                                          FFAppState().deviceIdentifier,
                                      swimrankingsIdentifier:
                                          VerifyFullNameCall.userId(
                                        (_model.nameVerifyResultCopy
                                                ?.jsonBody ??
                                            ''),
                                      ).toString(),
                                      fullName: VerifyFullNameCall.userFullname(
                                        (_model.nameVerifyResultCopy
                                                ?.jsonBody ??
                                            ''),
                                      ).toString(),
                                    );
                                    _shouldSetState = true;
                                  } else {
                                    await ApiGroup
                                        .createUserByDeviceIdentifierCall
                                        .call(
                                      deviceIdentifier:
                                          FFAppState().deviceIdentifier,
                                      swimrankingsIdentifier:
                                          VerifyFullNameCall.userId(
                                        (_model.nameVerifyResultCopy
                                                ?.jsonBody ??
                                            ''),
                                      ).toString(),
                                      fullName: VerifyFullNameCall.userFullname(
                                        (_model.nameVerifyResultCopy
                                                ?.jsonBody ??
                                            ''),
                                      ).toString(),
                                    );
                                  }

                                  _model.hasValidUserAuthCopy =
                                      await action_blocks.getUserAuth(context);
                                  _shouldSetState = true;
                                  if (_model.hasValidUserAuthCopy!) {
                                    context.goNamed('Dashboard');

                                    if (_shouldSetState) setState(() {});
                                    return;
                                  } else {
                                    HapticFeedback.heavyImpact();
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Onbekende fout'),
                                          content: Text(
                                              'Ons systeem lijkt momenteel niet goed te werken, probeer het later opnieuw!'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                }
                              } else {
                                HapticFeedback.heavyImpact();
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Niet gevonden'),
                                      content: Text(
                                          'De ingevoerde naam is niet gevonden bij SwimRankings, Probeer het opnieuw!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                if (_shouldSetState) setState(() {});
                                return;
                              }
                            } else {
                              HapticFeedback.heavyImpact();
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Error'),
                                    content: Text(
                                        'Het lijkt erop alsof de app even niet gebruikt kan worden! Probeer het later opnieuw!'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              if (_shouldSetState) setState(() {});
                              return;
                            }

                            if (_shouldSetState) setState(() {});
                          },
                        ),
                      ),
                    ],
                  ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation']!),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}