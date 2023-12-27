import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/swimrankings_list_item/swimrankings_list_item_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'list_swimrankings_accounts_model.dart';
export 'list_swimrankings_accounts_model.dart';

class ListSwimrankingsAccountsWidget extends StatefulWidget {
  const ListSwimrankingsAccountsWidget({
    super.key,
    required this.accounts,
    bool? isFavorite,
    required this.enteredName,
    required this.addState,
  })  : isFavorite = isFavorite ?? false;

  final List<dynamic>? accounts;
  final bool isFavorite;
  final String? enteredName;
  final UserAddState? addState;

  @override
  _ListSwimrankingsAccountsWidgetState createState() =>
      _ListSwimrankingsAccountsWidgetState();
}

class _ListSwimrankingsAccountsWidgetState
    extends State<ListSwimrankingsAccountsWidget> {
  late ListSwimrankingsAccountsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListSwimrankingsAccountsModel());
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
              HapticFeedback.selectionClick();
              context.pop();
            },
          ),
          title: Text(
            'Resultaten',
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
                  const Color(0xDA000000),
                  const Color(0xF1000000)
                ],
                stops: const [0.0, 0.25, 1.0],
                begin: const AlignmentDirectional(0.0, -1.0),
                end: const AlignmentDirectional(0, 1.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 32.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3.0,
                          color: Color(0x33000000),
                          offset: Offset(0.0, 1.0),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 12.0),
                            child: Text(
                              'Meerdere personen gevonden, kies de juiste persoon om door te gaan',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).titleMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final account =
                              widget.accounts!.map((e) => e).toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: account.length,
                            itemBuilder: (context, accountIndex) {
                              final accountItem = account[accountIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  var shouldSetState = false;
                                  HapticFeedback.selectionClick();

                                  context.pushNamed('SwimRankingsLoading');

                                  if (widget.addState ==
                                      UserAddState.SetActive) {
                                    _model.userCreated = await ApiGroup
                                        .createUserByDeviceIdentifierCall
                                        .call(
                                      deviceIdentifier:
                                          FFAppState().deviceIdentifier,
                                      swimrankingsIdentifier: getJsonField(
                                        accountItem,
                                        r'''$.identifier''',
                                      ).toString(),
                                      fullName: getJsonField(
                                        accountItem,
                                        r'''$.fullname''',
                                      ).toString(),
                                    );
                                    shouldSetState = true;
                                    if (!(_model.userCreated?.succeeded ??
                                        true)) {
                                      HapticFeedback.heavyImpact();
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text('Niet gelukt'),
                                            content: const Text(
                                                'Het lijkt erop alsof ons systeem momenteel iets niet goed doet, probeer het later opnieuw!'),
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
                                      context.safePop();
                                      if (shouldSetState) setState(() {});
                                      return;
                                    }
                                  } else if (widget.addState ==
                                      UserAddState.AsFavorite) {
                                    _model.apiResultbp8 = await ApiGroup
                                        .addFavoritedUserCall
                                        .call(
                                      deviceIdentifier:
                                          FFAppState().deviceIdentifier,
                                      swimrankingsIdentifier: getJsonField(
                                        accountItem,
                                        r'''$.identifier''',
                                      ).toString(),
                                      fullName: getJsonField(
                                        accountItem,
                                        r'''$.fullname''',
                                      ).toString(),
                                    );
                                    shouldSetState = true;
                                    if (!(_model.apiResultbp8?.succeeded ??
                                        true)) {
                                      HapticFeedback.heavyImpact();
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text('Niet gelukt'),
                                            content: const Text(
                                                'Het lijkt erop alsof ons systeem momenteel iets niet goed doet, probeer het later opnieuw!'),
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
                                      context.safePop();
                                      if (shouldSetState) setState(() {});
                                      return;
                                    }
                                  } else {
                                    _model.apiResultard =
                                        await ApiGroup.setActiveUserCall.call(
                                      deviceIdentifier:
                                          FFAppState().deviceIdentifier,
                                      swimrankingsIdentifier: getJsonField(
                                        accountItem,
                                        r'''$.identifier''',
                                      ).toString(),
                                    );
                                    shouldSetState = true;
                                    if (!(_model.apiResultard?.succeeded ??
                                        true)) {
                                      HapticFeedback.heavyImpact();
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text('Niet gelukt'),
                                            content: const Text(
                                                'Het lijkt erop alsof ons systeem momenteel iets niet goed doet, probeer het later opnieuw!'),
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
                                      context.safePop();
                                      if (shouldSetState) setState(() {});
                                      return;
                                    }
                                  }

                                  _model.userIsAuth2 =
                                      await action_blocks.getUserAuth(context);
                                  shouldSetState = true;
                                  if (!_model.userIsAuth2!) {
                                    HapticFeedback.heavyImpact();
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: const Text('Niet gelukt'),
                                          content: const Text(
                                              'Het lijkt erop alsof ons systeem momenteel iets niet goed doet, probeer het later opnieuw!'),
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
                                    context.safePop();
                                    if (shouldSetState) setState(() {});
                                    return;
                                  }

                                  context.pushNamed('Dashboard');

                                  if (shouldSetState) setState(() {});
                                },
                                child: SwimrankingsListItemWidget(
                                  key: Key(
                                      'Keyck8_${accountIndex}_of_${account.length}'),
                                  name: getJsonField(
                                    accountItem,
                                    r'''$.fullname''',
                                  ).toString(),
                                  date: getJsonField(
                                    accountItem,
                                    r'''$.date''',
                                  ).toString(),
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
          ),
        ),
      ),
    );
  }
}
