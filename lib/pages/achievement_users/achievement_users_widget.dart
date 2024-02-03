import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/loaders/loader_component/loader_component_widget.dart';
import '/pages/no_content/no_content_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'achievement_users_model.dart';
export 'achievement_users_model.dart';

class AchievementUsersWidget extends StatefulWidget {
  const AchievementUsersWidget({super.key});

  @override
  State<AchievementUsersWidget> createState() => _AchievementUsersWidgetState();
}

class _AchievementUsersWidgetState extends State<AchievementUsersWidget> {
  late AchievementUsersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AchievementUsersModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'achievementUsers'});
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
        backgroundColor: FlutterFlowTheme.of(context).weatherCloudy,
        appBar: !_model.isLoading
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
                    logFirebaseEvent('ACHIEVEMENT_USERS_arrow_left_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_navigate_back');
                    context.safePop();
                  },
                ),
                title: Text(
                  'Top gebruikers',
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
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
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
                    const Color(0xDA000000),
                    const Color(0xF2000000)
                  ],
                  stops: const [0.0, 0.25, 1.0],
                  begin: const AlignmentDirectional(0.0, -1.0),
                  end: const AlignmentDirectional(0, 1.0),
                ),
              ),
              child: FutureBuilder<ApiCallResponse>(
                future: _model.rankingCache(
                  requestFn: () => ApiGroup.getTopAthletesCall.call(
                    deviceIdentifier: FFAppState().deviceIdentifier,
                    queryType: '5',
                  ),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 32.0,
                        height: 32.0,
                        child: SpinKitWave(
                          color: FlutterFlowTheme.of(context).text,
                          size: 32.0,
                        ),
                      ),
                    );
                  }
                  final containerGetTopAthletesResponse = snapshot.data!;
                  return Container(
                    decoration: const BoxDecoration(),
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Text(
                                  'Jij staat op positie',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Poppins',
                                        color:
                                            FlutterFlowTheme.of(context).text3,
                                      ),
                                ),
                              ),
                              Text(
                                '${ApiGroup.getTopAthletesCall.myPlace(
                                      containerGetTopAthletesResponse.jsonBody,
                                    )?.toString()} / ${ApiGroup.getTopAthletesCall.totalUsers(
                                      containerGetTopAthletesResponse.jsonBody,
                                    )?.toString()}',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context).text,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Text(
                                  'Beste zwemmers die bekend zijn in de app',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Poppins',
                                        color:
                                            FlutterFlowTheme.of(context).text3,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 8.0),
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textController',
                                    const Duration(milliseconds: 250),
                                    () => setState(() {}),
                                  ),
                                  textInputAction: TextInputAction.done,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintText: 'Zwemmer zoeken...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
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
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final topAthletes = ApiGroup
                                              .getTopAthletesCall
                                              .topUsers(
                                                containerGetTopAthletesResponse
                                                    .jsonBody,
                                              )
                                              ?.where((e) =>
                                                  functions.stringContains(
                                                      getJsonField(
                                                        e,
                                                        r'''$.srUser.fullName''',
                                                      ).toString(),
                                                      _model
                                                          .textController.text))
                                              .toList()
                                              .toList() ??
                                          [];
                                      if (topAthletes.isEmpty) {
                                        return const Center(
                                          child: NoContentWidget(
                                            title: 'Geen resultaten',
                                            description:
                                                'Er zijn geen zwemmers met de bovenstaande criteria gevonden!',
                                          ),
                                        );
                                      }
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: topAthletes.length,
                                        itemBuilder:
                                            (context, topAthletesIndex) {
                                          final topAthletesItem =
                                              topAthletes[topAthletesIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'ACHIEVEMENT_USERS_Container_mnp4ih8a_ON_');
                                              logFirebaseEvent(
                                                  'Container_haptic_feedback');
                                              HapticFeedback.selectionClick();
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              setState(() {
                                                _model.isLoading = true;
                                              });
                                              logFirebaseEvent(
                                                  'Container_backend_call');
                                              _model.apiResult5z2Copy =
                                                  await ApiGroup
                                                      .setActiveUserCall
                                                      .call(
                                                deviceIdentifier: FFAppState()
                                                    .deviceIdentifier,
                                                swimrankingsIdentifier:
                                                    getJsonField(
                                                  topAthletesItem,
                                                  r'''$.srUser.athleteId''',
                                                ).toString(),
                                              );
                                              if ((_model.apiResult5z2Copy
                                                      ?.succeeded ??
                                                  true)) {
                                                logFirebaseEvent(
                                                    'Container_action_block');
                                                await action_blocks
                                                    .getUserAuth(context);
                                                logFirebaseEvent(
                                                    'Container_navigate_to');

                                                context.pushNamed(
                                                    'personalRecords');
                                              } else {
                                                logFirebaseEvent(
                                                    'Container_haptic_feedback');
                                                HapticFeedback.heavyImpact();
                                                logFirebaseEvent(
                                                    'Container_alert_dialog');
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: const Text('Error'),
                                                      content: const Text(
                                                          'Kon momenteel de gekozen zwemmer niet inzien! probeer het later opnieuw!'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: const Text('Ok'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              }

                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              setState(() {
                                                _model.isLoading = false;
                                              });

                                              setState(() {});
                                            },
                                            child: Container(
                                              width: 100.0,
                                              height: 65.0,
                                              decoration: const BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          '${getJsonField(
                                                            topAthletesItem,
                                                            r'''$.place''',
                                                          ).toString()}. ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .text,
                                                              ),
                                                        ),
                                                        Text(
                                                          '${getJsonField(
                                                            topAthletesItem,
                                                            r'''$.srUser.fullName''',
                                                          ).toString()} - ${getJsonField(
                                                            topAthletesItem,
                                                            r'''$.srUser.birthYear''',
                                                          ).toString()}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .text3,
                                                              ),
                                                        ),
                                                        Expanded(
                                                          child: Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    1.0, 0.0),
                                                            child: Text(
                                                              '(${getJsonField(
                                                                topAthletesItem,
                                                                r'''$.score''',
                                                              ).toString()})',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .text3,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: Icon(
                                                            Icons.chevron_right,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(
                                                    thickness: 1.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .cards,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (_model.isLoading)
                          wrapWithModel(
                            model: _model.loaderComponentModel,
                            updateCallback: () => setState(() {}),
                            child: const LoaderComponentWidget(
                              message: 'Informatie ophalen...',
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
