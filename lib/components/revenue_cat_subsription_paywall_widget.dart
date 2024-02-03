import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/premium_feature_page/premium_feature_page_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'revenue_cat_subsription_paywall_model.dart';
export 'revenue_cat_subsription_paywall_model.dart';

class RevenueCatSubsriptionPaywallWidget extends StatefulWidget {
  const RevenueCatSubsriptionPaywallWidget({super.key});

  @override
  State<RevenueCatSubsriptionPaywallWidget> createState() =>
      _RevenueCatSubsriptionPaywallWidgetState();
}

class _RevenueCatSubsriptionPaywallWidgetState
    extends State<RevenueCatSubsriptionPaywallWidget> {
  late RevenueCatSubsriptionPaywallModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RevenueCatSubsriptionPaywallModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: Container(
        width: double.infinity,
        height: 655.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primary,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: Image.asset(
              'assets/images/background.webp',
            ).image,
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: BorderRadius.circular(0.0),
          shape: BoxShape.rectangle,
        ),
        child: Container(
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
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 400.0,
                  child: CarouselSlider(
                    items: [
                      wrapWithModel(
                        model: _model.premiumFeaturePageModel1,
                        updateCallback: () => setState(() {}),
                        child: const PremiumFeaturePageWidget(
                          imagePath:
                              'https://myswimstats.nl/Content/Images/Features/feature_yearly.webp',
                          title: 'Jaarlijkse progressie',
                          description:
                              'Ontvang snel en eenvoudig een overzicht van je verbeteringen door de jaren heen!',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.premiumFeaturePageModel2,
                        updateCallback: () => setState(() {}),
                        child: const PremiumFeaturePageWidget(
                          imagePath:
                              'https://myswimstats.nl/Content/Images/Features/feature_advice.webp',
                          title: 'Adviezen',
                          description:
                              'Ontvang advies over de meest geschikte afstanden om te zwemmen, inclusief de redenen waarom!',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.premiumFeaturePageModel3,
                        updateCallback: () => setState(() {}),
                        child: const PremiumFeaturePageWidget(
                          imagePath:
                              'https://myswimstats.nl/Content/Images/Features/feature_favorites.webp',
                          title: 'Favorieten',
                          description:
                              'Voeg eindeloos veel favorieten toe om gemakkelijker vergelijkingen te kunnen maken!',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.premiumFeaturePageModel4,
                        updateCallback: () => setState(() {}),
                        child: const PremiumFeaturePageWidget(
                          imagePath:
                              'https://myswimstats.nl/Content/Images/Features/feature_recommendedSplits.webp',
                          title: 'Splittijden adviezen',
                          description:
                              'Ontvang advies op basis van jouw tussentijden, gebaseerd op de prestaties van de topzwemmers van Nederland!',
                        ),
                      ),
                    ],
                    carouselController: _model.carouselController ??=
                        CarouselController(),
                    options: CarouselOptions(
                      initialPage: 1,
                      viewportFraction: 0.5,
                      disableCenter: true,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.25,
                      enableInfiniteScroll: true,
                      scrollDirection: Axis.horizontal,
                      autoPlay: true,
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      autoPlayInterval: const Duration(milliseconds: (800 + 4000)),
                      autoPlayCurve: Curves.linear,
                      pauseAutoPlayInFiniteScroll: true,
                      onPageChanged: (index, _) =>
                          _model.carouselCurrentIndex = index,
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                    child: SelectionArea(
                        child: Text(
                      '✨ MySwimStats Premium',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).text,
                          ),
                    )),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 10.0, 10.0),
                    child: SelectionArea(
                        child: Text(
                      'Met het premium abonnement krijg je toegang tot de hierboven genoemde functies en draag je bij aan de doorontwikkeling van de app!',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).text2,
                          ),
                    )),
                  ),
                ),
                Builder(
                  builder: (context) {
                    if (!isWeb) {
                      return Visibility(
                        visible: revenue_cat
                            .offerings!.current!.availablePackages.isNotEmpty,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: Container(
                            width: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).text,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x33000000),
                                  offset: Offset(0.0, 2.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                          revenue_cat
                                                          .offerings!
                                                          .current!
                                                          .monthly!
                                                          .storeProduct
                                                          .title !=
                                                      ''
                                              ? revenue_cat.offerings!.current!
                                                  .monthly!.storeProduct.title
                                              : 'MySwimStats Premium',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .text3,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        if (revenue_cat
                                                        .offerings!
                                                        .current!
                                                        .monthly!
                                                        .storeProduct
                                                        .description !=
                                                    ''
                                            ? true
                                            : false)
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: SelectionArea(
                                                child: Text(
                                              revenue_cat
                                                  .offerings!
                                                  .current!
                                                  .monthly!
                                                  .storeProduct
                                                  .description,
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .text3,
                                                      ),
                                            )),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SelectionArea(
                                          child: Text(
                                        '${revenue_cat.offerings!.current!.monthly!.storeProduct.priceString} / maand',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .text3,
                                            ),
                                      )),
                                      Builder(
                                        builder: (context) {
                                          if (!FFAppState().premium) {
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'REVENUE_CAT_SUBSRIPTION_PAYWALL_BUY_BTN_');
                                                  logFirebaseEvent(
                                                      'Button_revenue_cat');
                                                  _model.didPurchaseMonth =
                                                      await revenue_cat
                                                          .purchasePackage(
                                                              revenue_cat
                                                                  .offerings!
                                                                  .current!
                                                                  .monthly!
                                                                  .identifier);
                                                  if (_model
                                                      .didPurchaseMonth!) {
                                                    logFirebaseEvent(
                                                        'Button_bottom_sheet');
                                                    Navigator.pop(context);
                                                    logFirebaseEvent(
                                                        'Button_action_block');
                                                    await action_blocks
                                                        .isPremium(context);
                                                    setState(() {});
                                                  } else {
                                                    logFirebaseEvent(
                                                        'Button_show_snack_bar');
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      const SnackBar(
                                                        content: Text(
                                                          'Aankoop niet gelukt!',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFFF8FAFF),
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            Color(0xFF0B0D17),
                                                      ),
                                                    );
                                                  }

                                                  setState(() {});
                                                },
                                                text: 'Buy',
                                                options: FFButtonOptions(
                                                  width: 80.0,
                                                  height: 32.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .buttonYes,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                                  elevation: 2.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            );
                                          } else {
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'REVENUE_CAT_SUBSRIPTION_PAYWALL_BEHEER_B');
                                                  logFirebaseEvent(
                                                      'Button_launch_u_r_l');
                                                  await launchURL(functions
                                                      .getSubscriptionManagePage(
                                                          isAndroid, isiOS));
                                                  logFirebaseEvent(
                                                      'Button_close_dialog,_drawer,_etc');
                                                  Navigator.pop(context);
                                                },
                                                text: 'Beheer',
                                                options: FFButtonOptions(
                                                  width: 80.0,
                                                  height: 32.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                  elevation: 2.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).text,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        'Premium',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .text3,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SelectionArea(
                                        child: Text(
                                      '€1.99 / Maand',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .text3,
                                          ),
                                    )),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'REVENUE_CAT_SUBSRIPTION_PAYWALL_NIET_BES');
                                          logFirebaseEvent(
                                              'Button_alert_dialog');
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: const Text('Niet bechikbaar'),
                                                content: const Text(
                                                    'Premium kan op dit moment alleen worden aangeschaft op Android of IOS devices!'),
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
                                        },
                                        text: 'Niet beschikbaar',
                                        options: FFButtonOptions(
                                          width: 120.0,
                                          height: 32.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .buttonCancel,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                    fontSize: 12.0,
                                                  ),
                                          elevation: 2.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
