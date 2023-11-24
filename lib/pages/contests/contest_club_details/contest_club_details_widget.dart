import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/contests/contest_swim_line/contest_swim_line_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'contest_club_details_model.dart';
export 'contest_club_details_model.dart';

class ContestClubDetailsWidget extends StatefulWidget {
  const ContestClubDetailsWidget({
    super.key,
    required this.contestData,
    required this.raceName,
  });

  final dynamic contestData;
  final String? raceName;

  @override
  _ContestClubDetailsWidgetState createState() =>
      _ContestClubDetailsWidgetState();
}

class _ContestClubDetailsWidgetState extends State<ContestClubDetailsWidget> {
  late ContestClubDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContestClubDetailsModel());
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
        backgroundColor: const Color(0xF1000000),
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
              context.pop();
            },
          ),
          title: Text(
            'Club resultaten',
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
                    const Color(0xD9000000),
                    const Color(0xF2000000)
                  ],
                  stops: const [0.0, 0.25, 1.0],
                  begin: const AlignmentDirectional(0.0, -1.0),
                  end: const AlignmentDirectional(0, 1.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.00, 0.00),
                        child: Text(
                          valueOrDefault<String>(
                            widget.raceName,
                            '50m vrije slag (LB)',
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).text3,
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Text(
                          'Gemiddelde performance club',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).titleMedium,
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.00, 0.00),
                        child: Text(
                          valueOrDefault<String>(
                            '${getJsonField(
                              widget.contestData,
                              r'''$.clubPerformance''',
                            ).toString()}%',
                            '100%',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelLarge
                              .override(
                                fontFamily: 'Poppins',
                                color: functions.isGoodPercentage(getJsonField(
                                  widget.contestData,
                                  r'''$.clubPerformance''',
                                ).toString())!
                                    ? FlutterFlowTheme.of(context)
                                        .performanceGood
                                    : FlutterFlowTheme.of(context)
                                        .performanceBad,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Text(
                          'beste gezwommen door',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).titleMedium,
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.00, 0.00),
                        child: Text(
                          getJsonField(
                            widget.contestData,
                            r'''$.bestPerformer.name''',
                          ).toString(),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .performanceGood,
                                    fontSize: 16.0,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.00, 0.00),
                        child: Text(
                          '${getJsonField(
                            widget.contestData,
                            r'''$.bestPerformer.averagePerformance''',
                          ).toString()}%',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .performanceGood,
                                    fontSize: 16.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Text(
                          'en het minst door',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).titleMedium,
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.00, 0.00),
                        child: Text(
                          getJsonField(
                            widget.contestData,
                            r'''$.worstPerformer.name''',
                          ).toString(),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .labelLarge
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).performanceBad,
                                fontSize: 16.0,
                              ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.00, 0.00),
                        child: Text(
                          '${getJsonField(
                            widget.contestData,
                            r'''$.worstPerformer.averagePerformance''',
                          ).toString()}%',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .labelLarge
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).performanceBad,
                                fontSize: 16.0,
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final userDetails = getJsonField(
                              widget.contestData,
                              r'''$.users''',
                            ).toList();
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(userDetails.length,
                                  (userDetailsIndex) {
                                final userDetailsItem =
                                    userDetails[userDetailsIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('genericLoader');

                                    _model.setActiveUser =
                                        await ApiGroup.setActiveUserCall.call(
                                      deviceIdentifier:
                                          FFAppState().deviceIdentifier,
                                      swimrankingsIdentifier: getJsonField(
                                        userDetailsItem,
                                        r'''$.identifier''',
                                      ).toString(),
                                    );
                                    if ((_model.setActiveUser?.succeeded ??
                                        true)) {
                                      await action_blocks.getUserAuth(context);
                                      setState(() {});
                                      if (Navigator.of(context).canPop()) {
                                        context.pop();
                                      }
                                      context.pushNamed('Dashboard');
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text('Fout'),
                                            content: const Text(
                                                'Oeps, kon de gegevens van de gekozen persoon niet inzien!'),
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
                                    }

                                    setState(() {});
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          getJsonField(
                                            userDetailsItem,
                                            r'''$.name''',
                                          ).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .text,
                                                fontSize: 16.0,
                                              ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.00, 0.00),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: Text(
                                                    'Performance:',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .text,
                                                          fontSize: 14.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  '${getJsonField(
                                                    userDetailsItem,
                                                    r'''$.averagePerformance''',
                                                  ).toString()}%',
                                                  textAlign: TextAlign.end,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: functions
                                                                    .isGoodPercentage(
                                                                        getJsonField(
                                                              userDetailsItem,
                                                              r'''$.averagePerformance''',
                                                            ).toString())!
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .performanceGood
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .performanceBad,
                                                            fontSize: 14.0,
                                                          ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.00, 0.00),
                                                child: Text(
                                                  'Afstand',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .text3,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: Text(
                                                  '%',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .text3,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: Text(
                                                  'Tijd',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .text3,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    1.00, 0.00),
                                                child: Text(
                                                  'Punten',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .text3,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Builder(
                                          builder: (context) {
                                            final swimResult = getJsonField(
                                              userDetailsItem,
                                              r'''$.swimResults''',
                                            ).toList();
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  swimResult.length,
                                                  (swimResultIndex) {
                                                final swimResultItem =
                                                    swimResult[swimResultIndex];
                                                return ContestSwimLineWidget(
                                                  key: Key(
                                                      'Key38v_${swimResultIndex}_of_${swimResult.length}'),
                                                  stroke: swimResultItem,
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                        Divider(
                                          height: 32.0,
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
