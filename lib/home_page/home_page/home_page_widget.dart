import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_page/components/empty_list_home_page/empty_list_home_page_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, -10.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        BlurEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(10.0, 10.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'progressBarOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(1.0, 1.0),
        ),
        BlurEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(10.0, 10.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'verticalDividerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 10.0),
          end: Offset(0.0, 0.0),
        ),
        BlurEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(10.0, 10.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, -10.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        BlurEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(10.0, 10.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 3500.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(1.3, 1.3),
        ),
        BlurEffect(
          curve: Curves.easeInOut,
          delay: 1500.ms,
          duration: 2000.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(10.0, 10.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1500.ms,
          duration: 2500.ms,
          begin: 1.0,
          end: 0.0,
        ),
      ],
    ),
    'progressBarOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(1.0, 1.0),
        ),
        BlurEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(10.0, 10.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, -10.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        BlurEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(10.0, 10.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'progressBarOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(1.0, 1.0),
        ),
        BlurEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(10.0, 10.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, -10.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        BlurEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(10.0, 10.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'progressBarOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(1.0, 1.0),
        ),
        BlurEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(10.0, 10.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, -10.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        BlurEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(10.0, 10.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'progressBarOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(1.0, 1.0),
        ),
        BlurEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(10.0, 10.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, -10.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        BlurEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(10.0, 10.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'progressBarOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(1.0, 1.0),
        ),
        BlurEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(10.0, 10.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'homePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_PAGE_homePage_ON_INIT_STATE');
      if (!loggedIn) {
        logFirebaseEvent('homePage_navigate_to');

        context.goNamed('loginPage');
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitCircle(
                  color: FlutterFlowTheme.of(context).teal,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        final homePageUsersRecord = snapshot.data!;
        return Title(
            title: 'Kidney247',
            color: FlutterFlowTheme.of(context).primary,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: SafeArea(
                top: true,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 20.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Hero(
                                tag: 'logo',
                                transitionOnUserGestures: true,
                                child: SvgPicture.asset(
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? 'assets/images/Kidney_247-dark_theme.svg'
                                      : 'assets/images/Kidney_247_SVG.svg',
                                  width: 161.9,
                                  height: 80.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: FlutterFlowTheme.of(context).primary,
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    2.0, 2.0, 2.0, 2.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'HOME_PAGE_PAGE_userAvatar_ON_TAP');
                                      logFirebaseEvent(
                                          'userAvatar_navigate_to');

                                      context.pushNamed('profilePage');
                                    },
                                    child: Container(
                                      width: 60.0,
                                      height: 60.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          currentUserPhoto,
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/kidney-s1k692/assets/kb3k8basj6js/105356-kidney-loading.gif',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Text(
                                functions.greetingString(
                                    FFLocalizations.of(context).languageCode),
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: 'Be Vietnam Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 20.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .displaySmallFamily),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  '${homePageUsersRecord.displayName}👋',
                                  '👋',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .headlineMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .headlineMediumFamily),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 20.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '9y3nkona' /* Today's Nutrients */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Be Vietnam Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmallFamily),
                                    ),
                              ),
                            ),
                            StreamBuilder<List<NutrientRecord>>(
                              stream: queryNutrientRecord(
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 40.0,
                                      height: 40.0,
                                      child: SpinKitCircle(
                                        color:
                                            FlutterFlowTheme.of(context).teal,
                                        size: 40.0,
                                      ),
                                    ),
                                  );
                                }
                                List<NutrientRecord>
                                    containerNutrientRecordList =
                                    snapshot.data!;
                                final containerNutrientRecord =
                                    containerNutrientRecordList.isNotEmpty
                                        ? containerNutrientRecordList.first
                                        : null;
                                return Container(
                                  width: double.infinity,
                                  height: 130.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        StreamBuilder<List<MealsRecord>>(
                                          stream: queryMealsRecord(
                                            queryBuilder: (mealsRecord) =>
                                                mealsRecord.where('user_ref',
                                                    isEqualTo:
                                                        currentUserReference),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  child: SpinKitCircle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .teal,
                                                    size: 40.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<MealsRecord>
                                                containerMealsRecordList =
                                                snapshot.data!;
                                            return Container(
                                              width: 100.0,
                                              height: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                              child: StreamBuilder<
                                                  List<FluidsRecord>>(
                                                stream: queryFluidsRecord(
                                                  queryBuilder: (fluidsRecord) =>
                                                      fluidsRecord.where(
                                                          'user_ref',
                                                          isEqualTo:
                                                              currentUserReference),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        child: SpinKitCircle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .teal,
                                                          size: 40.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<FluidsRecord>
                                                      containerFluidsRecordList =
                                                      snapshot.data!;
                                                  return Container(
                                                    width: 100.0,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'pdu3oa6u' /* Fluids */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Be Vietnam Pro',
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'textOnPageLoadAnimation1']!),
                                                              ),
                                                              if (valueOrDefault<
                                                                  bool>(
                                                                (double totalFluid,
                                                                        double
                                                                            target) {
                                                                  return (double.parse(
                                                                              (totalFluid * 100 / target / 100).toStringAsFixed(2))) >
                                                                          1.0
                                                                      ? true
                                                                      : false;
                                                                }(
                                                                    functions.totalFluid(
                                                                        containerFluidsRecordList
                                                                            .toList(),
                                                                        containerMealsRecordList
                                                                            .toList()),
                                                                    containerNutrientRecord!
                                                                        .fluidIntake),
                                                                false,
                                                              ))
                                                                Container(
                                                                  width: 20.0,
                                                                  height: 20.0,
                                                                  child: custom_widgets
                                                                      .TooltipWidget(
                                                                    width: 20.0,
                                                                    height:
                                                                        20.0,
                                                                    message: (double
                                                                                totalFluid,
                                                                            double
                                                                                target,
                                                                            String
                                                                                language) {
                                                                      return language ==
                                                                              'en'
                                                                          ? 'Exceed ${(double.parse((totalFluid * 100 / target - 100).toStringAsFixed(2)))}%'
                                                                          : 'Vượt quá ${(double.parse((totalFluid * 100 / target - 100).toStringAsFixed(2)))}%';
                                                                    }(
                                                                        functions.totalFluid(
                                                                            containerFluidsRecordList
                                                                                .toList(),
                                                                            containerMealsRecordList
                                                                                .toList()),
                                                                        containerNutrientRecord!
                                                                            .fluidIntake,
                                                                        FFLocalizations.of(context)
                                                                            .languageCode),
                                                                    icon: Icon(
                                                                      Icons
                                                                          .warning_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      size:
                                                                          14.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                          CircularPercentIndicator(
                                                            percent: (double
                                                                        totalFluid,
                                                                    double target) {
                                                              return (double.parse((totalFluid *
                                                                              100 /
                                                                              target /
                                                                              100)
                                                                          .toStringAsFixed(
                                                                              2))) >
                                                                      1.0
                                                                  ? 1.0
                                                                  : double.parse((totalFluid *
                                                                          100 /
                                                                          target /
                                                                          100)
                                                                      .toStringAsFixed(
                                                                          2));
                                                            }(
                                                                functions.totalFluid(
                                                                    containerFluidsRecordList
                                                                        .toList(),
                                                                    containerMealsRecordList
                                                                        .toList()),
                                                                containerNutrientRecord!
                                                                    .fluidIntake),
                                                            radius: 45.0,
                                                            lineWidth: 15.0,
                                                            animation: true,
                                                            progressColor:
                                                                valueOrDefault<
                                                                    Color>(
                                                              (double totalFluid,
                                                                      double
                                                                          target) {
                                                                return (double.parse((totalFluid *
                                                                                100 /
                                                                                target /
                                                                                100)
                                                                            .toStringAsFixed(
                                                                                2))) >
                                                                        1.0
                                                                    ? Color(
                                                                        0xFFe21c3d)
                                                                    : Color(
                                                                        0xFF4b39ef);
                                                              }(
                                                                  functions.totalFluid(
                                                                      containerFluidsRecordList
                                                                          .toList(),
                                                                      containerMealsRecordList
                                                                          .toList()),
                                                                  containerNutrientRecord!
                                                                      .fluidIntake),
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                            center: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                '${((double.parse((functions.totalFluid(containerFluidsRecordList.toList(), containerMealsRecordList.toList()) * 100 / containerNutrientRecord!.fluidIntake).toStringAsFixed(2)))).toString()}%',
                                                                '0%',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Be Vietnam Pro',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'progressBarOnPageLoadAnimation1']!),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                        VerticalDivider(
                                          thickness: 2.0,
                                          endIndent: 20.0,
                                          color: FlutterFlowTheme.of(context)
                                              .lineColor,
                                        ).animateOnPageLoad(animationsMap[
                                            'verticalDividerOnPageLoadAnimation']!),
                                        Expanded(
                                          child:
                                              StreamBuilder<List<MealsRecord>>(
                                            stream: queryMealsRecord(
                                              queryBuilder: (mealsRecord) =>
                                                  mealsRecord.where('user_ref',
                                                      isEqualTo:
                                                          currentUserReference),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    child: SpinKitCircle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .teal,
                                                      size: 40.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<MealsRecord>
                                                  containerMealsRecordList =
                                                  snapshot.data!;
                                              return Container(
                                                width: 100.0,
                                                height: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        15.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'jcdb289o' /* Phosphorus */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Be Vietnam Pro',
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ).animateOnPageLoad(
                                                                              animationsMap['textOnPageLoadAnimation2']!),
                                                                    ),
                                                                    if (valueOrDefault<
                                                                        bool>(
                                                                      (double totalPhosphorus,
                                                                              double
                                                                                  target) {
                                                                        return (double.parse((totalPhosphorus * 100 / target / 100).toStringAsFixed(2))) >
                                                                                1.0
                                                                            ? true
                                                                            : false;
                                                                      }(
                                                                          functions.totalPhosphorus(containerMealsRecordList
                                                                              .toList()),
                                                                          containerNutrientRecord!
                                                                              .phosphorus),
                                                                      false,
                                                                    ))
                                                                      Container(
                                                                        width:
                                                                            20.0,
                                                                        height:
                                                                            20.0,
                                                                        child: custom_widgets
                                                                            .TooltipWidget(
                                                                          width:
                                                                              20.0,
                                                                          height:
                                                                              20.0,
                                                                          message: (double totalPhosphorus,
                                                                              double target,
                                                                              String language) {
                                                                            return language == 'en'
                                                                                ? 'Exceed ${(double.parse((totalPhosphorus * 100 / target - 100).toStringAsFixed(2)))}%'
                                                                                : 'Vượt quá ${(double.parse((totalPhosphorus * 100 / target - 100).toStringAsFixed(2)))}%';
                                                                          }(functions.totalPhosphorus(containerMealsRecordList.toList()), containerNutrientRecord!.phosphorus, FFLocalizations.of(context).languageCode),
                                                                          icon:
                                                                              Icon(
                                                                            Icons.warning_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            size:
                                                                                14.0,
                                                                          ),
                                                                        ),
                                                                      ).animateOnPageLoad(
                                                                          animationsMap[
                                                                              'containerOnPageLoadAnimation']!),
                                                                  ],
                                                                ),
                                                                CircularPercentIndicator(
                                                                  percent: (double
                                                                              totalPhosphorus,
                                                                          double
                                                                              target) {
                                                                    return (double.parse((totalPhosphorus * 100 / target / 100).toStringAsFixed(2))) >
                                                                            1.0
                                                                        ? 1.0
                                                                        : double.parse((totalPhosphorus *
                                                                                100 /
                                                                                target /
                                                                                100)
                                                                            .toStringAsFixed(2));
                                                                  }(
                                                                      functions.totalPhosphorus(
                                                                          containerMealsRecordList
                                                                              .toList()),
                                                                      containerNutrientRecord!
                                                                          .phosphorus),
                                                                  radius: 45.0,
                                                                  lineWidth:
                                                                      15.0,
                                                                  animation:
                                                                      true,
                                                                  progressColor:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    (double totalPhosphorus,
                                                                            double
                                                                                target) {
                                                                      return (double.parse((totalPhosphorus * 100 / target / 100).toStringAsFixed(2))) >
                                                                              1.0
                                                                          ? Color(
                                                                              0xFFe21c3d)
                                                                          : Color(
                                                                              0xFF4b39ef);
                                                                    }(
                                                                        functions.totalPhosphorus(containerMealsRecordList
                                                                            .toList()),
                                                                        containerNutrientRecord!
                                                                            .phosphorus),
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  center: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      '${((double.parse((functions.totalPhosphorus(containerMealsRecordList.toList()) * 100 / containerNutrientRecord!.phosphorus).toStringAsFixed(2)))).toString()}%',
                                                                      '0%',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Be Vietnam Pro',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'progressBarOnPageLoadAnimation2']!),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        15.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '9s0ejfax' /* Protein */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Be Vietnam Pro',
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ).animateOnPageLoad(
                                                                              animationsMap['textOnPageLoadAnimation3']!),
                                                                    ),
                                                                    if ((double totalProtein,
                                                                            double
                                                                                target) {
                                                                      return (double.parse((totalProtein * 100 / target / 100).toStringAsFixed(2))) >
                                                                              1.0
                                                                          ? true
                                                                          : false;
                                                                    }(
                                                                        functions.totalProtein(containerMealsRecordList
                                                                            .toList()),
                                                                        containerNutrientRecord!
                                                                            .protein))
                                                                      Container(
                                                                        width:
                                                                            20.0,
                                                                        height:
                                                                            20.0,
                                                                        child: custom_widgets
                                                                            .TooltipWidget(
                                                                          width:
                                                                              20.0,
                                                                          height:
                                                                              20.0,
                                                                          message: (double totalProtein,
                                                                              double target,
                                                                              String language) {
                                                                            return language == 'en'
                                                                                ? 'Exceed ${(double.parse((totalProtein * 100 / target - 100).toStringAsFixed(2)))}%'
                                                                                : 'Vượt quá ${(double.parse((totalProtein * 100 / target - 100).toStringAsFixed(2)))}%';
                                                                          }(functions.totalProtein(containerMealsRecordList.toList()), containerNutrientRecord!.protein, FFLocalizations.of(context).languageCode),
                                                                          icon:
                                                                              Icon(
                                                                            Icons.warning_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            size:
                                                                                14.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                                CircularPercentIndicator(
                                                                  percent: (double
                                                                              totalProtein,
                                                                          double
                                                                              target) {
                                                                    return (double.parse((totalProtein * 100 / target / 100).toStringAsFixed(2))) >
                                                                            1.0
                                                                        ? 1.0
                                                                        : double.parse((totalProtein *
                                                                                100 /
                                                                                target /
                                                                                100)
                                                                            .toStringAsFixed(2));
                                                                  }(
                                                                      functions.totalProtein(
                                                                          containerMealsRecordList
                                                                              .toList()),
                                                                      containerNutrientRecord!
                                                                          .protein),
                                                                  radius: 45.0,
                                                                  lineWidth:
                                                                      15.0,
                                                                  animation:
                                                                      true,
                                                                  progressColor:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    (double totalProtein,
                                                                            double
                                                                                target) {
                                                                      return (double.parse((totalProtein * 100 / target / 100).toStringAsFixed(2))) >
                                                                              1.0
                                                                          ? Color(
                                                                              0xFFe21c3d)
                                                                          : Color(
                                                                              0xFF4b39ef);
                                                                    }(
                                                                        functions.totalProtein(containerMealsRecordList
                                                                            .toList()),
                                                                        containerNutrientRecord!
                                                                            .protein),
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  center: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      '${((double.parse((functions.totalProtein(containerMealsRecordList.toList()) * 100 / containerNutrientRecord!.protein).toStringAsFixed(2)))).toString()}%',
                                                                      '0%',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Be Vietnam Pro',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'progressBarOnPageLoadAnimation3']!),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        15.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'ypgv36is' /* Potassium */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Be Vietnam Pro',
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ).animateOnPageLoad(
                                                                              animationsMap['textOnPageLoadAnimation4']!),
                                                                    ),
                                                                    if ((double totalPotassium,
                                                                            double
                                                                                target) {
                                                                      return (double.parse((totalPotassium * 100 / target / 100).toStringAsFixed(2))) >
                                                                              1.0
                                                                          ? true
                                                                          : false;
                                                                    }(
                                                                        functions.totalPotassium(containerMealsRecordList
                                                                            .toList()),
                                                                        containerNutrientRecord!
                                                                            .potassium))
                                                                      Container(
                                                                        width:
                                                                            20.0,
                                                                        height:
                                                                            20.0,
                                                                        child: custom_widgets
                                                                            .TooltipWidget(
                                                                          width:
                                                                              20.0,
                                                                          height:
                                                                              20.0,
                                                                          message: (double totalPotassium,
                                                                              double target,
                                                                              String language) {
                                                                            return language == 'en'
                                                                                ? 'Exceed ${(double.parse((totalPotassium * 100 / target - 100).toStringAsFixed(2)))}%'
                                                                                : 'Vượt quá ${(double.parse((totalPotassium * 100 / target - 100).toStringAsFixed(2)))}%';
                                                                          }(functions.totalPotassium(containerMealsRecordList.toList()), containerNutrientRecord!.potassium, FFLocalizations.of(context).languageCode),
                                                                          icon:
                                                                              Icon(
                                                                            Icons.warning_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            size:
                                                                                14.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                                CircularPercentIndicator(
                                                                  percent: (double
                                                                              totalPotassium,
                                                                          double
                                                                              target) {
                                                                    return (double.parse((totalPotassium * 100 / target / 100).toStringAsFixed(2))) >
                                                                            1.0
                                                                        ? 1.0
                                                                        : double.parse((totalPotassium *
                                                                                100 /
                                                                                target /
                                                                                100)
                                                                            .toStringAsFixed(2));
                                                                  }(
                                                                      functions.totalPotassium(
                                                                          containerMealsRecordList
                                                                              .toList()),
                                                                      containerNutrientRecord!
                                                                          .potassium),
                                                                  radius: 45.0,
                                                                  lineWidth:
                                                                      15.0,
                                                                  animation:
                                                                      true,
                                                                  progressColor:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    (double totalPotassium,
                                                                            double
                                                                                target) {
                                                                      return (double.parse((totalPotassium * 100 / target / 100).toStringAsFixed(2))) >
                                                                              1.0
                                                                          ? Color(
                                                                              0xFFe21c3d)
                                                                          : Color(
                                                                              0xFF4b39ef);
                                                                    }(
                                                                        functions.totalPotassium(containerMealsRecordList
                                                                            .toList()),
                                                                        containerNutrientRecord!
                                                                            .potassium),
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  center: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      '${((double.parse((functions.totalPotassium(containerMealsRecordList.toList()) * 100 / containerNutrientRecord!.potassium).toStringAsFixed(2)))).toString()}%',
                                                                      '0%',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Be Vietnam Pro',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'progressBarOnPageLoadAnimation4']!),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        15.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'oyuve3jp' /* Sodium */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Be Vietnam Pro',
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ).animateOnPageLoad(
                                                                              animationsMap['textOnPageLoadAnimation5']!),
                                                                    ),
                                                                    if ((double totalSodium,
                                                                            double
                                                                                target) {
                                                                      return (double.parse((totalSodium * 100 / target / 100).toStringAsFixed(2))) >
                                                                              1.0
                                                                          ? true
                                                                          : false;
                                                                    }(
                                                                        functions.totalSodium(containerMealsRecordList
                                                                            .toList()),
                                                                        containerNutrientRecord!
                                                                            .sodium))
                                                                      Container(
                                                                        width:
                                                                            20.0,
                                                                        height:
                                                                            20.0,
                                                                        child: custom_widgets
                                                                            .TooltipWidget(
                                                                          width:
                                                                              20.0,
                                                                          height:
                                                                              20.0,
                                                                          message: (double totalSodium,
                                                                              double target,
                                                                              String language) {
                                                                            return language == 'en'
                                                                                ? 'Exceed ${(double.parse((totalSodium * 100 / target - 100).toStringAsFixed(2)))}%'
                                                                                : 'Vượt quá ${(double.parse((totalSodium * 100 / target - 100).toStringAsFixed(2)))}%';
                                                                          }(functions.totalSodium(containerMealsRecordList.toList()), containerNutrientRecord!.sodium, FFLocalizations.of(context).languageCode),
                                                                          icon:
                                                                              Icon(
                                                                            Icons.warning_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            size:
                                                                                14.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                                CircularPercentIndicator(
                                                                  percent: (double
                                                                              totalSodium,
                                                                          double
                                                                              target) {
                                                                    return (double.parse((totalSodium * 100 / target / 100).toStringAsFixed(2))) >
                                                                            1.0
                                                                        ? 1.0
                                                                        : double.parse((totalSodium *
                                                                                100 /
                                                                                target /
                                                                                100)
                                                                            .toStringAsFixed(2));
                                                                  }(
                                                                      functions.totalSodium(
                                                                          containerMealsRecordList
                                                                              .toList()),
                                                                      containerNutrientRecord!
                                                                          .sodium),
                                                                  radius: 45.0,
                                                                  lineWidth:
                                                                      15.0,
                                                                  animation:
                                                                      true,
                                                                  progressColor:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    (double totalSodium,
                                                                            double
                                                                                target) {
                                                                      return (double.parse((totalSodium * 100 / target / 100).toStringAsFixed(2))) >
                                                                              1.0
                                                                          ? Color(
                                                                              0xFFe21c3d)
                                                                          : Color(
                                                                              0xFF4b39ef);
                                                                    }(
                                                                        functions.totalSodium(containerMealsRecordList
                                                                            .toList()),
                                                                        containerNutrientRecord!
                                                                            .sodium),
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  center: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      '${((double.parse((functions.totalSodium(containerMealsRecordList.toList()) * 100 / containerNutrientRecord!.sodium).toStringAsFixed(2)))).toString()}%',
                                                                      '0%',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Be Vietnam Pro',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'progressBarOnPageLoadAnimation5']!),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        15.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '2db12849' /* Calories */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Be Vietnam Pro',
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ).animateOnPageLoad(
                                                                              animationsMap['textOnPageLoadAnimation6']!),
                                                                    ),
                                                                    if ((double totalSodium,
                                                                            double
                                                                                target) {
                                                                      return (double.parse((totalSodium * 100 / target / 100).toStringAsFixed(2))) >
                                                                              1.0
                                                                          ? true
                                                                          : false;
                                                                    }(
                                                                        functions.totalSodium(containerMealsRecordList
                                                                            .toList()),
                                                                        containerNutrientRecord!
                                                                            .sodium))
                                                                      Container(
                                                                        width:
                                                                            20.0,
                                                                        height:
                                                                            20.0,
                                                                        child: custom_widgets
                                                                            .TooltipWidget(
                                                                          width:
                                                                              20.0,
                                                                          height:
                                                                              20.0,
                                                                          message: (double totalSodium,
                                                                              double target,
                                                                              String language) {
                                                                            return language == 'en'
                                                                                ? 'Exceed ${(double.parse((totalSodium * 100 / target - 100).toStringAsFixed(2)))}%'
                                                                                : 'Vượt quá ${(double.parse((totalSodium * 100 / target - 100).toStringAsFixed(2)))}%';
                                                                          }(functions.totalSodium(containerMealsRecordList.toList()), containerNutrientRecord!.sodium, FFLocalizations.of(context).languageCode),
                                                                          icon:
                                                                              Icon(
                                                                            Icons.warning_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            size:
                                                                                14.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                                CircularPercentIndicator(
                                                                  percent: (double
                                                                              totalCalories,
                                                                          double
                                                                              target) {
                                                                    return (double.parse((totalCalories * 100 / target / 100).toStringAsFixed(2))) >
                                                                            1.0
                                                                        ? 1.0
                                                                        : double.parse((totalCalories *
                                                                                100 /
                                                                                target /
                                                                                100)
                                                                            .toStringAsFixed(2));
                                                                  }(
                                                                      functions.totalCalories(
                                                                          containerMealsRecordList
                                                                              .toList()),
                                                                      containerNutrientRecord!
                                                                          .calories),
                                                                  radius: 45.0,
                                                                  lineWidth:
                                                                      15.0,
                                                                  animation:
                                                                      true,
                                                                  progressColor:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    (double totalCalories,
                                                                            double
                                                                                target) {
                                                                      return (double.parse((totalCalories * 100 / target / 100).toStringAsFixed(2))) >
                                                                              1.0
                                                                          ? Color(
                                                                              0xFFe21c3d)
                                                                          : Color(
                                                                              0xFF4b39ef);
                                                                    }(
                                                                        functions.totalCalories(containerMealsRecordList
                                                                            .toList()),
                                                                        containerNutrientRecord!
                                                                            .calories),
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  center: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      '${((double.parse((functions.totalCalories(containerMealsRecordList.toList()) * 100 / containerNutrientRecord!.calories).toStringAsFixed(2)))).toString()}%',
                                                                      '0%',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Be Vietnam Pro',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'progressBarOnPageLoadAnimation6']!),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 20.0, 10.0, 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'HOME_PAGE_PAGE_LOG_A_MEAL_BTN_ON_TAP');
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed('logMealPage');
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'pwlakqmk' /* Log a Meal */,
                                  ),
                                  icon: FaIcon(
                                    FontAwesomeIcons.utensils,
                                    size: 14.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: 170.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Be Vietnam Pro',
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 2.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'HOME_PAGE_PAGE_ADD_FLUIDS_BTN_ON_TAP');
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed('addFluidsPage');
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'ors9qdaw' /* Add Fluids */,
                                  ),
                                  icon: FaIcon(
                                    FontAwesomeIcons.glassWhiskey,
                                    size: 14.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: 170.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Be Vietnam Pro',
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 2.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 20.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'o2s9si8f' /* Your Medications */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Be Vietnam Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmallFamily),
                                    ),
                              ),
                            ),
                            StreamBuilder<List<MedicationRemindRecord>>(
                              stream: queryMedicationRemindRecord(
                                queryBuilder: (medicationRemindRecord) =>
                                    medicationRemindRecord.where('userRef',
                                        isEqualTo: currentUserReference),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 40.0,
                                      height: 40.0,
                                      child: SpinKitCircle(
                                        color:
                                            FlutterFlowTheme.of(context).teal,
                                        size: 40.0,
                                      ),
                                    ),
                                  );
                                }
                                List<MedicationRemindRecord>
                                    containerMedicationRemindRecordList =
                                    snapshot.data!;
                                return Container(
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      final todayMedication = functions
                                          .todayMedication(
                                              containerMedicationRemindRecordList
                                                  .toList())
                                          .toList();
                                      if (todayMedication.isEmpty) {
                                        return EmptyListHomePageWidget(
                                          name: FFLocalizations.of(context)
                                              .getText(
                                            'ttlgm9ld' /* Seem like you don't have any m... */,
                                          ),
                                          buttonTitle:
                                              FFLocalizations.of(context)
                                                  .getText(
                                            'njx932be' /* Add medicine reminder */,
                                          ),
                                          goTo: 'medicine',
                                        );
                                      }
                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              todayMedication.length,
                                              (todayMedicationIndex) {
                                            final todayMedicationItem =
                                                todayMedication[
                                                    todayMedicationIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 2.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 10.0,
                                                          10.0, 10.0),
                                                  child: StreamBuilder<
                                                      MedicationRecord>(
                                                    stream: MedicationRecord
                                                        .getDocument(
                                                            todayMedicationItem
                                                                .medicationRef!),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 40.0,
                                                            height: 40.0,
                                                            child:
                                                                SpinKitCircle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .teal,
                                                              size: 40.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final containerMedicationRecord =
                                                          snapshot.data!;
                                                      return Container(
                                                        width: 250.0,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (todayMedicationItem
                                                                        .session
                                                                        .contains(
                                                                            'Morning') ||
                                                                    todayMedicationItem
                                                                        .session
                                                                        .contains(
                                                                            'Sáng'))
                                                                  Text(
                                                                    '⛅ ${FFLocalizations.of(context).languageCode == 'en' ? 'Morning' : 'Sáng'}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Be Vietnam Pro',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                if (todayMedicationItem
                                                                        .session
                                                                        .contains(
                                                                            'Mid-Day') ||
                                                                    todayMedicationItem
                                                                        .session
                                                                        .contains(
                                                                            'Trưa'))
                                                                  Text(
                                                                    '🌞 ${FFLocalizations.of(context).languageCode == 'en' ? 'Mid-Day' : 'Trưa'}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Be Vietnam Pro',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                if (todayMedicationItem
                                                                        .session
                                                                        .contains(
                                                                            'Evening') ||
                                                                    todayMedicationItem
                                                                        .session
                                                                        .contains(
                                                                            'Tối'))
                                                                  Text(
                                                                    '🌙 ${FFLocalizations.of(context).languageCode == 'en' ? 'Evening' : 'Tối'}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Be Vietnam Pro',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                              ],
                                                            ),
                                                            Expanded(
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              containerMedicationRecord.name,
                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                  ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                containerMedicationRecord.dosage,
                                                                                style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontStyle: FontStyle.italic,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Text(
                                                                          '${containerMedicationRecord.shape}, ${containerMedicationRecord.dissolutionRate}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Be Vietnam Pro',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  FaIcon(
                                                                    FontAwesomeIcons
                                                                        .pills,
                                                                    color: Color(
                                                                        0xFFE92A6D),
                                                                    size: 40.0,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 20.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'iulwwn9p' /* Upcoming Appointments */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Be Vietnam Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmallFamily),
                                    ),
                              ),
                            ),
                            StreamBuilder<List<AppointmentsRecord>>(
                              stream: queryAppointmentsRecord(
                                queryBuilder: (appointmentsRecord) =>
                                    appointmentsRecord
                                        .where('user_ref',
                                            isEqualTo: currentUserReference)
                                        .where('appointment_dateTime',
                                            isGreaterThanOrEqualTo:
                                                getCurrentTimestamp)
                                        .orderBy('appointment_dateTime'),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 40.0,
                                      height: 40.0,
                                      child: SpinKitCircle(
                                        color:
                                            FlutterFlowTheme.of(context).teal,
                                        size: 40.0,
                                      ),
                                    ),
                                  );
                                }
                                List<AppointmentsRecord>
                                    rowAppointmentsRecordList = snapshot.data!;
                                if (rowAppointmentsRecordList.isEmpty) {
                                  return EmptyListHomePageWidget(
                                    name: FFLocalizations.of(context).getText(
                                      '6p2qp7ie' /* Sêm like you don't have any ap... */,
                                    ),
                                    buttonTitle:
                                        FFLocalizations.of(context).getText(
                                      'cz7zbaoc' /* Add appointment */,
                                    ),
                                    goTo: 'appointment',
                                  );
                                }
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                        rowAppointmentsRecordList.length,
                                        (rowIndex) {
                                      final rowAppointmentsRecord =
                                          rowAppointmentsRecordList[rowIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          elevation: 2.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 10.0, 10.0),
                                            child: Container(
                                              width: 250.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  rowAppointmentsRecord
                                                                      .doctorName,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Be Vietnam Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  rowAppointmentsRecord
                                                                      .doctorAddress,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Be Vietnam Pro',
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    AutoSizeText(
                                                                  '${dateTimeFormat(
                                                                    'MMMMEEEEd',
                                                                    rowAppointmentsRecord
                                                                        .appointmentDateTime,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  )} ${dateTimeFormat(
                                                                    'jm',
                                                                    rowAppointmentsRecord
                                                                        .appointmentDateTime,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  )}',
                                                                  maxLines: 2,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Be Vietnam Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  FaIcon(
                                                    FontAwesomeIcons
                                                        .calendarPlus,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 40.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 20.0, 10.0, 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'g9fyjlcw' /* Latest Lab Work */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Be Vietnam Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmallFamily),
                                    ),
                              ),
                            ),
                            StreamBuilder<List<LabtestResultsRecord>>(
                              stream: queryLabtestResultsRecord(
                                queryBuilder: (labtestResultsRecord) =>
                                    labtestResultsRecord
                                        .where('user_ref',
                                            isEqualTo: currentUserReference)
                                        .where('bloodGlucose',
                                            isNotEqualTo: 0.0)
                                        .orderBy('bloodGlucose',
                                            descending: true)
                                        .orderBy('bloodGlucoseTime',
                                            descending: true),
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 40.0,
                                      height: 40.0,
                                      child: SpinKitCircle(
                                        color:
                                            FlutterFlowTheme.of(context).teal,
                                        size: 40.0,
                                      ),
                                    ),
                                  );
                                }
                                List<LabtestResultsRecord>
                                    containerLabtestResultsRecordList =
                                    snapshot.data!;
                                final containerLabtestResultsRecord =
                                    containerLabtestResultsRecordList.isNotEmpty
                                        ? containerLabtestResultsRecordList
                                            .first
                                        : null;
                                return Container(
                                  decoration: BoxDecoration(),
                                  child:
                                      StreamBuilder<List<LabtestResultsRecord>>(
                                    stream: queryLabtestResultsRecord(
                                      queryBuilder: (labtestResultsRecord) =>
                                          labtestResultsRecord
                                              .where('user_ref',
                                                  isEqualTo:
                                                      currentUserReference)
                                              .where('gfr', isNotEqualTo: 0.0)
                                              .orderBy('gfr', descending: true)
                                              .orderBy('GFRTime',
                                                  descending: true),
                                      singleRecord: true,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 40.0,
                                            height: 40.0,
                                            child: SpinKitCircle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .teal,
                                              size: 40.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<LabtestResultsRecord>
                                          containerLabtestResultsRecordList =
                                          snapshot.data!;
                                      final containerLabtestResultsRecord =
                                          containerLabtestResultsRecordList
                                                  .isNotEmpty
                                              ? containerLabtestResultsRecordList
                                                  .first
                                              : null;
                                      return Container(
                                        decoration: BoxDecoration(),
                                        child: StreamBuilder<
                                            List<LabtestResultsRecord>>(
                                          stream: queryLabtestResultsRecord(
                                            queryBuilder: (labtestResultsRecord) =>
                                                labtestResultsRecord
                                                    .where('user_ref',
                                                        isEqualTo:
                                                            currentUserReference)
                                                    .where('albumin',
                                                        isNotEqualTo: 0.0)
                                                    .orderBy('albumin',
                                                        descending: true)
                                                    .orderBy('albuminTime',
                                                        descending: true),
                                            singleRecord: true,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  child: SpinKitCircle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .teal,
                                                    size: 40.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<LabtestResultsRecord>
                                                containerLabtestResultsRecordList =
                                                snapshot.data!;
                                            final containerLabtestResultsRecord =
                                                containerLabtestResultsRecordList
                                                        .isNotEmpty
                                                    ? containerLabtestResultsRecordList
                                                        .first
                                                    : null;
                                            return Container(
                                              decoration: BoxDecoration(),
                                              child: StreamBuilder<
                                                  List<LabtestResultsRecord>>(
                                                stream:
                                                    queryLabtestResultsRecord(
                                                  queryBuilder:
                                                      (labtestResultsRecord) =>
                                                          labtestResultsRecord
                                                              .where('user_ref',
                                                                  isEqualTo:
                                                                      currentUserReference)
                                                              .where('bun',
                                                                  isNotEqualTo:
                                                                      0.0)
                                                              .orderBy('bun',
                                                                  descending:
                                                                      true)
                                                              .orderBy(
                                                                  'BUNTime',
                                                                  descending:
                                                                      true),
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        child: SpinKitCircle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .teal,
                                                          size: 40.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<LabtestResultsRecord>
                                                      containerLabtestResultsRecordList =
                                                      snapshot.data!;
                                                  final containerLabtestResultsRecord =
                                                      containerLabtestResultsRecordList
                                                              .isNotEmpty
                                                          ? containerLabtestResultsRecordList
                                                              .first
                                                          : null;
                                                  return Container(
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (containerLabtestResultsRecord !=
                                                            null)
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'HOME_PAGE_PAGE_Card_4qmts8w3_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Card_navigate_to');

                                                              context.pushNamed(
                                                                'trackBloodGlucoseA1CPage',
                                                                queryParameters:
                                                                    {
                                                                  'pageTitle':
                                                                      serializeParam(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'tsscx8ef' /* Blood Glucose A1C */,
                                                                    ),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Card(
                                                              clipBehavior: Clip
                                                                  .antiAliasWithSaveLayer,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 80.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'pya9nkjz' /* Blood Glucose */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              dateTimeFormat(
                                                                                'yMMMd',
                                                                                containerLabtestResultsRecord!.bloodGlucoseTime!,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    color: FlutterFlowTheme.of(context).grayLight,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.end,
                                                                          children: [
                                                                            Text(
                                                                              containerLabtestResultsRecord!.bloodGlucose.toString(),
                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'njnjqyrp' /* % */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        if (containerLabtestResultsRecord !=
                                                            null)
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'HOME_PAGE_PAGE_Card_ipcqxlfy_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Card_navigate_to');

                                                              context.pushNamed(
                                                                'trackGRFPage',
                                                                queryParameters:
                                                                    {
                                                                  'pageTitle':
                                                                      serializeParam(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      't35jajkf' /* GFR */,
                                                                    ),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Card(
                                                              clipBehavior: Clip
                                                                  .antiAliasWithSaveLayer,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 80.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'zdyv2k6b' /* eGFR */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              dateTimeFormat(
                                                                                'yMMMd',
                                                                                containerLabtestResultsRecord!.gFRTime!,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    color: FlutterFlowTheme.of(context).grayLight,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.end,
                                                                          children: [
                                                                            Text(
                                                                              containerLabtestResultsRecord!.gfr.toString(),
                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '2cglgp06' /* mL/min */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        if (containerLabtestResultsRecord !=
                                                            null)
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'HOME_PAGE_PAGE_Card_lbbmyg5g_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Card_navigate_to');

                                                              context.pushNamed(
                                                                'trackAlbuminLabPage',
                                                                queryParameters:
                                                                    {
                                                                  'pageTitle':
                                                                      serializeParam(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'qh6bqrxf' /* Albumin */,
                                                                    ),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Card(
                                                              clipBehavior: Clip
                                                                  .antiAliasWithSaveLayer,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 80.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '1zfb1ke4' /* Albumin */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              dateTimeFormat(
                                                                                'yMMMd',
                                                                                containerLabtestResultsRecord!.albuminTime!,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    color: FlutterFlowTheme.of(context).grayLight,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.end,
                                                                          children: [
                                                                            Text(
                                                                              containerLabtestResultsRecord!.albumin.toString(),
                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '3arub610' /* g/dL */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        if (containerLabtestResultsRecord !=
                                                            null)
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'HOME_PAGE_PAGE_Card_sk9d1ps5_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Card_navigate_to');

                                                              context.pushNamed(
                                                                'trackBUNPage',
                                                                queryParameters:
                                                                    {
                                                                  'pageTitle':
                                                                      serializeParam(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '3vc4j5kf' /* Blood Urea Nitrogen */,
                                                                    ),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Card(
                                                              clipBehavior: Clip
                                                                  .antiAliasWithSaveLayer,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                              ),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 80.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'xn2tkucy' /* Blood Urea Nitrogen */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                  fontFamily: 'Be Vietnam Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            dateTimeFormat(
                                                                              'yMMMd',
                                                                              containerLabtestResultsRecord!.bUNTime!,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Be Vietnam Pro',
                                                                                  color: FlutterFlowTheme.of(context).grayLight,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.end,
                                                                        children: [
                                                                          Text(
                                                                            containerLabtestResultsRecord!.bun.toString(),
                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                  fontFamily: 'Be Vietnam Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'e2olchym' /* mg/dL */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Be Vietnam Pro',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        if (!(containerLabtestResultsRecord != null) &&
                                                            !(containerLabtestResultsRecord !=
                                                                null) &&
                                                            !(containerLabtestResultsRecord !=
                                                                null) &&
                                                            !(containerLabtestResultsRecord !=
                                                                null))
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child:
                                                                wrapWithModel(
                                                              model: _model
                                                                  .emptyListHomePageModel,
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              child:
                                                                  EmptyListHomePageWidget(
                                                                name: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '4yoil16t' /* Seem like you don't have any l... */,
                                                                ),
                                                                buttonTitle:
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                  'hvi82ccd' /* Add lab test results */,
                                                                ),
                                                                goTo: 'labtest',
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 300.0,
                        height: 250.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF977EC6),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Image.asset(
                                'assets/images/robot.png',
                                width: 100.0,
                                height: 100.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            StreamBuilder<List<ChatGPTHistoryRecord>>(
                              stream: queryChatGPTHistoryRecord(
                                queryBuilder: (chatGPTHistoryRecord) =>
                                    chatGPTHistoryRecord.where('userRef',
                                        isEqualTo: currentUserReference),
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 40.0,
                                      height: 40.0,
                                      child: SpinKitCircle(
                                        color:
                                            FlutterFlowTheme.of(context).teal,
                                        size: 40.0,
                                      ),
                                    ),
                                  );
                                }
                                List<ChatGPTHistoryRecord>
                                    containerChatGPTHistoryRecordList =
                                    snapshot.data!;
                                final containerChatGPTHistoryRecord =
                                    containerChatGPTHistoryRecordList.isNotEmpty
                                        ? containerChatGPTHistoryRecordList
                                            .first
                                        : null;
                                return Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (!(containerChatGPTHistoryRecord !=
                                          null))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 8.0, 8.0, 8.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'HOME_PAGE_PAGE_ASK_KIDNEY_A_I_BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              final chatGPTHistoryCreateData =
                                                  createChatGPTHistoryRecordData(
                                                userRef: currentUserReference,
                                                createdAt: getCurrentTimestamp,
                                              );
                                              await ChatGPTHistoryRecord
                                                  .collection
                                                  .doc()
                                                  .set(
                                                      chatGPTHistoryCreateData);
                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              context.pushNamed('chatGPT');
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'fnnev2ts' /* Ask KidneyAI */,
                                            ),
                                            icon: Icon(
                                              Icons.auto_awesome,
                                              size: 15.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: 170.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Be Vietnam Pro',
                                                        color: Colors.white,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      if (containerChatGPTHistoryRecord != null)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 8.0, 8.0, 8.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'HOME_PAGE_PAGE_ASK_KIDNEY_A_I_BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              context.pushNamed('chatGPT');
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'oa8ozkbe' /* Ask KidneyAI */,
                                            ),
                                            icon: Icon(
                                              Icons.auto_awesome,
                                              size: 15.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: 170.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Be Vietnam Pro',
                                                        color: Colors.white,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                              borderSide: BorderSide(
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
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 30.0, 0.0, 30.0),
                        child: SvgPicture.asset(
                          Theme.of(context).brightness == Brightness.dark
                              ? 'assets/images/Kidney_247-dark_theme.svg'
                              : 'assets/images/Kidney_247_SVG.svg',
                          width: 215.3,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
