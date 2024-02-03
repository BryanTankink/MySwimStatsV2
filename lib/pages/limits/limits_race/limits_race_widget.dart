import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/no_content/no_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'limits_race_model.dart';
export 'limits_race_model.dart';

class LimitsRaceWidget extends StatefulWidget {
  const LimitsRaceWidget({
    super.key,
    required this.raceName,
    required this.raceId,
  });

  final String? raceName;
  final String? raceId;

  @override
  State<LimitsRaceWidget> createState() => _LimitsRaceWidgetState();
}

class _LimitsRaceWidgetState extends State<LimitsRaceWidget> {
  late LimitsRaceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LimitsRaceModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'LimitsRace'});
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
              logFirebaseEvent('LIMITS_RACE_PAGE_arrow_left_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'Limieten',
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
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primary,
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
                    const Color(0xF2000000)
                  ],
                  stops: const [0.0, 0.25, 1.0],
                  begin: const AlignmentDirectional(0.0, -1.0),
                  end: const AlignmentDirectional(0, 1.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.raceName,
                          'Nederlandse Kampioenschappen 2024',
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).text3,
                              fontSize: 14.0,
                            ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                      child: FutureBuilder<ApiCallResponse>(
                        future: ApiGroup.limitsRaceCall.call(
                          deviceIdentifier: FFAppState().deviceIdentifier,
                          athleteIdentifier: FFAppState().activeUserId,
                          eventId: widget.raceId,
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
                          final listViewLimitsRaceResponse = snapshot.data!;
                          return Builder(
                            builder: (context) {
                              final limit = ApiGroup.limitsRaceCall
                                      .limits(
                                        listViewLimitsRaceResponse.jsonBody,
                                      )
                                      ?.toList() ??
                                  [];
                              if (limit.isEmpty) {
                                return const Center(
                                  child: SizedBox(
                                    height: 400.0,
                                    child: NoContentWidget(
                                      title: 'Geen limieten',
                                      description:
                                          'Ah nee! Er zijn helaas geen limieten gevonden :(',
                                    ),
                                  ),
                                );
                              }
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: limit.length,
                                itemBuilder: (context, limitIndex) {
                                  final limitItem = limit[limitIndex];
                                  return Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: const BoxDecoration(),
                                  );
                                },
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
          ),
        ),
      ),
    );
  }
}
