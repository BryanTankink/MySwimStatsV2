import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/operation_button/operation_button_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'link_swimrankings_model.dart';
export 'link_swimrankings_model.dart';

class LinkSwimrankingsWidget extends StatefulWidget {
  const LinkSwimrankingsWidget({
    super.key,
    bool? showHeader,
    bool? isFavorite,
    required this.addState,
  })  : showHeader = showHeader ?? false,
        isFavorite = isFavorite ?? false;

  final bool showHeader;
  final bool isFavorite;
  final UserAddState? addState;

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
          begin: const Offset(0.6, 0.6),
          end: const Offset(1.0, 1.0),
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
                  icon: const Icon(
                    Icons.arrow_left,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    HapticFeedback.selectionClick();
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
                actions: const [],
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
                  const Color(0xD8000000),
                  const Color(0xE7000000)
                ],
                stops: const [0.0, 0.25, 1.0],
                begin: const AlignmentDirectional(0.0, -1.0),
                end: const AlignmentDirectional(0, 1.0),
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
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Hero(
                          tag: 'logo_square',
                          transitionOnUserGestures: true,
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
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'Naam',
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: TextFormField(
                                  key: const ValueKey('NameField_6sov'),
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
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                      const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 44.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      wrapWithModel(
                        model: _model.operationButtonModel,
                        updateCallback: () => setState(() {}),
                        child: OperationButtonWidget(
                          key: const ValueKey('OperationButton_ku9o'),
                          text: 'Controleren',
                          onClick: () async {
                            var shouldSetState = false;
                            if (!(_model.nameFieldController.text != '')) {
                              HapticFeedback.mediumImpact();
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: const Text('Error'),
                                    content: const Text('Vul een naam in!'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: const Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              if (shouldSetState) setState(() {});
                              return;
                            }
                            _model.nameVerifyResultCopy =
                                await VerifyFullNameCall.call(
                              fullName: _model.nameFieldController.text,
                            );
                            shouldSetState = true;
                            if ((_model.nameVerifyResultCopy?.succeeded ??
                                true)) {
                              if (VerifyFullNameCall.userCount(
                                    (_model.nameVerifyResultCopy?.jsonBody ??
                                        ''),
                                  )! >
                                  0) {
                                if (VerifyFullNameCall.userCount(
                                      (_model.nameVerifyResultCopy?.jsonBody ??
                                          ''),
                                    )! >
                                    1) {
                                  if (VerifyFullNameCall.userCount(
                                        (_model.nameVerifyResultCopy
                                                ?.jsonBody ??
                                            ''),
                                      )! <
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
                                        'addState': serializeParam(
                                          widget.addState,
                                          ParamType.Enum,
                                        ),
                                      }.withoutNulls,
                                    );

                                    if (shouldSetState) setState(() {});
                                    return;
                                  } else {
                                    HapticFeedback.heavyImpact();
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: const Text('Verfijn naam'),
                                          content: const Text(
                                              'We krijgen te veel resultaten terug! Vul je volledige naam in om je zoekresultaat te verfijnen!'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: const Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    if (shouldSetState) setState(() {});
                                    return;
                                  }
                                } else {
                                  HapticFeedback.lightImpact();
                                  if (widget.addState ==
                                      UserAddState.SetActive) {
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
                                  } else if (widget.addState ==
                                      UserAddState.AsFavorite) {
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
                                    shouldSetState = true;
                                  } else {
                                    _model.apiResultd62 =
                                        await ApiGroup.setActiveUserCall.call(
                                      deviceIdentifier:
                                          FFAppState().deviceIdentifier,
                                      swimrankingsIdentifier:
                                          VerifyFullNameCall.userId(
                                        (_model.nameVerifyResultCopy
                                                ?.jsonBody ??
                                            ''),
                                      ).toString(),
                                    );
                                    shouldSetState = true;
                                  }

                                  _model.hasValidUserAuthCopy =
                                      await action_blocks.getUserAuth(context);
                                  shouldSetState = true;
                                  if (_model.hasValidUserAuthCopy!) {
                                    context.goNamed('Dashboard');

                                    if (shouldSetState) setState(() {});
                                    return;
                                  } else {
                                    HapticFeedback.heavyImpact();
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: const Text('Onbekende fout'),
                                          content: const Text(
                                              'Ons systeem lijkt momenteel niet goed te werken, probeer het later opnieuw!'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: const Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    if (shouldSetState) setState(() {});
                                    return;
                                  }
                                }
                              } else {
                                HapticFeedback.heavyImpact();
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: const Text('Niet gevonden'),
                                      content: const Text(
                                          'De ingevoerde naam is niet gevonden bij SwimRankings, Probeer het opnieuw!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: const Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                if (shouldSetState) setState(() {});
                                return;
                              }
                            } else {
                              HapticFeedback.heavyImpact();
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: const Text('Error'),
                                    content: const Text(
                                        'Het lijkt erop alsof de app even niet gebruikt kan worden! Probeer het later opnieuw!'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: const Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              if (shouldSetState) setState(() {});
                              return;
                            }

                            if (shouldSetState) setState(() {});
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
