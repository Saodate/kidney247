import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'set_target_page_model.dart';
export 'set_target_page_model.dart';

class SetTargetPageWidget extends StatefulWidget {
  const SetTargetPageWidget({
    Key? key,
    bool? isEdited,
  })  : this.isEdited = isEdited ?? true,
        super(key: key);

  final bool isEdited;

  @override
  _SetTargetPageWidgetState createState() => _SetTargetPageWidgetState();
}

class _SetTargetPageWidgetState extends State<SetTargetPageWidget> {
  late SetTargetPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetTargetPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'setTargetPage'});
    _model.phosphorusRecomController ??= TextEditingController();
    _model.proteinRecomController ??= TextEditingController(
        text: (double.parse(
                (1.4 * valueOrDefault(currentUserDocument?.weight, 0.0))
                    .toStringAsFixed(2)))
            .toString());
    _model.caloriesRecomController ??= TextEditingController(
        text: (double.parse(
                (35 * valueOrDefault(currentUserDocument?.weight, 0.0))
                    .toStringAsFixed(2)))
            .toString());
    _model.potassiumRecomController ??= TextEditingController();
    _model.sodiumRecomController ??= TextEditingController();
    _model.fluidIntakeRecomController ??= TextEditingController(
        text: (FFLocalizations.of(context).languageCode == 'en'
                ? ((String var1, double var2) {
                    return var1 == 'No kidney disease'
                        ? 2.0
                        : var1 == 'Stage 1'
                            ? 2.0
                            : var1 == 'Stage 2'
                                ? 2.0
                                : var2 + 0.5;
                  }(valueOrDefault(currentUserDocument?.stage, ''),
                    valueOrDefault(currentUserDocument?.todayfluidOutput, 0.0)))
                : ((String var1, double var2) {
                    return var1 == 'Chưa bị bệnh thận'
                        ? 2.0
                        : var1 == 'Giai đoạn 1'
                            ? 2.0
                            : var1 == 'Giai đoạn 2'
                                ? 2.0
                                : var2 + 0.5;
                  }(
                    valueOrDefault(currentUserDocument?.stage, ''),
                    valueOrDefault(
                        currentUserDocument?.todayfluidOutput, 0.0))))
            .toString());
    _model.bloodPressureFromRecomController ??= TextEditingController();
    _model.bloodPressureToRecomController ??= TextEditingController();
    _model.bloodGlucoseRecomController ??= TextEditingController();
    _model.fluidOutputRecomController ??= TextEditingController(
        text: (valueOrDefault(currentUserDocument?.ageUnit, '') == 'Năm'
                ? (valueOrDefault(currentUserDocument?.age, 0.0) <= 18.0
                    ? (double.parse((36 *
                            valueOrDefault(currentUserDocument?.weight, 0.0) /
                            1000)
                        .toStringAsFixed(2)))
                    : (double.parse((24 *
                            valueOrDefault(currentUserDocument?.weight, 0.0) /
                            1000)
                        .toStringAsFixed(2))))
                : (double.parse((36 *
                        valueOrDefault(currentUserDocument?.weight, 0.0) /
                        1000)
                    .toStringAsFixed(2))))
            .toString());
    _model.bloodGlucoseA1CRecomController ??= TextEditingController(
        text: (valueOrDefault(currentUserDocument?.ageUnit, '') == 'Năm'
                ? () {
                    if (valueOrDefault(currentUserDocument?.age, 0.0) <= 5.0) {
                      return 8.5;
                    } else if (valueOrDefault(currentUserDocument?.age, 0.0) <=
                        12.0) {
                      return 8.0;
                    } else if (valueOrDefault(currentUserDocument?.age, 0.0) <=
                        19.0) {
                      return 7.5;
                    } else if (valueOrDefault(currentUserDocument?.age, 0.0) <=
                        39.0) {
                      return 6.0;
                    } else if (valueOrDefault(currentUserDocument?.age, 0.0) <=
                        59.0) {
                      return 6.1;
                    } else {
                      return 6.5;
                    }
                  }()
                : 8.5)
            .toString());
    _model.eGFRTextRecomController ??= TextEditingController(
        text: (valueOrDefault(currentUserDocument?.ageUnit, '') == 'Năm'
                ? (valueOrDefault(currentUserDocument?.age, 0.0) >= 19.0
                    ? (FFLocalizations.of(context).languageCode == 'en'
                        ? (valueOrDefault(currentUserDocument?.userSex, '') == 'Male'
                            ? (double.parse(
                                (0.0205 * 1 * (140 - valueOrDefault(currentUserDocument?.age, 0.0)) * valueOrDefault(currentUserDocument?.weight, 0.0) / valueOrDefault(currentUserDocument?.creatinine, 0.0))
                                    .toStringAsFixed(2)))
                            : (double.parse(
                                (0.0205 * 0.85 * (140 - valueOrDefault(currentUserDocument?.age, 0.0)) * valueOrDefault(currentUserDocument?.weight, 0.0) / valueOrDefault(currentUserDocument?.creatinine, 0.0))
                                    .toStringAsFixed(2))))
                        : (valueOrDefault(currentUserDocument?.userSex, '') == 'Nam giới'
                            ? (double.parse(
                                (0.0205 * 1 * (140 - valueOrDefault(currentUserDocument?.age, 0.0)) * valueOrDefault(currentUserDocument?.weight, 0.0) / valueOrDefault(currentUserDocument?.creatinine, 0.0))
                                    .toStringAsFixed(2)))
                            : (double.parse((0.0205 *
                                    0.85 *
                                    (140 - valueOrDefault(currentUserDocument?.age, 0.0)) *
                                    valueOrDefault(currentUserDocument?.weight, 0.0) /
                                    valueOrDefault(currentUserDocument?.creatinine, 0.0))
                                .toStringAsFixed(2)))))
                    : () {
                        if (valueOrDefault(currentUserDocument?.age, 0.0) >
                            13.0) {
                          return (FFLocalizations.of(context).languageCode == 'en'
                              ? (valueOrDefault(currentUserDocument?.userSex, '') ==
                                      'Male'
                                  ? (double.parse(
                                      (0.70 * valueOrDefault(currentUserDocument?.height, 0) / valueOrDefault(currentUserDocument?.creatinine, 0.0))
                                          .toStringAsFixed(2)))
                                  : (double.parse(
                                      (0.55 * valueOrDefault(currentUserDocument?.height, 0) / valueOrDefault(currentUserDocument?.creatinine, 0.0))
                                          .toStringAsFixed(2))))
                              : (valueOrDefault(currentUserDocument?.userSex, '') ==
                                      'Nam giới'
                                  ? (double.parse((0.70 *
                                          valueOrDefault(
                                              currentUserDocument?.height, 0) /
                                          valueOrDefault(currentUserDocument?.creatinine, 0.0))
                                      .toStringAsFixed(2)))
                                  : (double.parse((0.55 * valueOrDefault(currentUserDocument?.height, 0) / valueOrDefault(currentUserDocument?.creatinine, 0.0)).toStringAsFixed(2)))));
                        } else if (valueOrDefault(
                                currentUserDocument?.age, 0.0) >=
                            2.0) {
                          return (double.parse((0.55 *
                                  valueOrDefault(
                                      currentUserDocument?.height, 0) /
                                  valueOrDefault(
                                      currentUserDocument?.creatinine, 0.0))
                              .toStringAsFixed(2)));
                        } else {
                          return (double.parse((0.45 *
                                  valueOrDefault(
                                      currentUserDocument?.height, 0) /
                                  valueOrDefault(
                                      currentUserDocument?.creatinine, 0.0))
                              .toStringAsFixed(2)));
                        }
                      }())
                : (valueOrDefault(currentUserDocument?.age, 0.0) >= 1.0 ? (double.parse((0.45 * valueOrDefault(currentUserDocument?.height, 0) / valueOrDefault(currentUserDocument?.creatinine, 0.0)).toStringAsFixed(2))) : (double.parse((0.33 * valueOrDefault(currentUserDocument?.height, 0) / valueOrDefault(currentUserDocument?.creatinine, 0.0)).toStringAsFixed(2)))))
            .toString());
    _model.albuminRecomController ??= TextEditingController(
        text: (valueOrDefault(currentUserDocument?.ageUnit, '') == 'Năm'
                ? () {
                    if (valueOrDefault(currentUserDocument?.age, 0.0) < 16.0) {
                      return functions.pieceValueCalculation(3.0, 5.0, 14, 2,
                          15, valueOrDefault(currentUserDocument?.age, 0.0));
                    } else if (valueOrDefault(currentUserDocument?.age, 0.0) ==
                        16.0) {
                      return 3.5;
                    } else {
                      return 4.8;
                    }
                  }()
                : () {
                    if (valueOrDefault(currentUserDocument?.age, 0.0) <= 4.0) {
                      return functions.pieceValueCalculation(2.0, 4.5, 4, 1, 4,
                          valueOrDefault(currentUserDocument?.age, 0.0));
                    } else if (valueOrDefault(currentUserDocument?.age, 0.0) <
                        16.0) {
                      return functions.pieceValueCalculation(3.2, 5.2, 11, 5,
                          15, valueOrDefault(currentUserDocument?.age, 0.0));
                    } else {
                      return functions.pieceValueCalculation(3.0, 5.0, 11, 16,
                          24, valueOrDefault(currentUserDocument?.age, 0.0));
                    }
                  }())
            ?.toString());
    _model.bloodUNRecomController ??= TextEditingController(
        text: (valueOrDefault(currentUserDocument?.ageUnit, '') == 'Năm'
                ? () {
                    if (valueOrDefault(currentUserDocument?.age, 0.0) < 18.0) {
                      return 6.0;
                    } else if (valueOrDefault(currentUserDocument?.age, 0.0) <=
                        29.0) {
                      return functions.pieceValueCalculation(6.0, 20.0, 12, 18,
                          29, valueOrDefault(currentUserDocument?.age, 0.0));
                    } else if (valueOrDefault(currentUserDocument?.age, 0.0) <=
                        39.0) {
                      return functions.pieceValueCalculation(7.0, 21.0, 10, 30,
                          39, valueOrDefault(currentUserDocument?.age, 0.0));
                    } else if (valueOrDefault(currentUserDocument?.age, 0.0) <=
                        49.0) {
                      return functions.pieceValueCalculation(8.0, 23.0, 10, 40,
                          49, valueOrDefault(currentUserDocument?.age, 0.0));
                    } else if (valueOrDefault(currentUserDocument?.age, 0.0) <=
                        59.0) {
                      return functions.pieceValueCalculation(9.0, 25.0, 10, 50,
                          59, valueOrDefault(currentUserDocument?.age, 0.0));
                    } else if (valueOrDefault(currentUserDocument?.age, 0.0) <=
                        69.0) {
                      return functions.pieceValueCalculation(10.0, 28.0, 10, 60,
                          69, valueOrDefault(currentUserDocument?.age, 0.0));
                    } else {
                      return functions.pieceValueCalculation(11.0, 30.0, 11, 70,
                          80, valueOrDefault(currentUserDocument?.age, 0.0));
                    }
                  }()
                : 6.0)
            ?.toString());
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.phosphorusRecomController?.text =
              FFLocalizations.of(context).getText(
            'wxg98q25' /* 700 */,
          );
          _model.potassiumRecomController?.text =
              FFLocalizations.of(context).getText(
            'yjblcvio' /* 2000 */,
          );
          _model.sodiumRecomController?.text =
              FFLocalizations.of(context).getText(
            'z2zemime' /* 2000 */,
          );
          _model.bloodPressureFromRecomController?.text =
              FFLocalizations.of(context).getText(
            'g4p4i7nk' /* 120 */,
          );
          _model.bloodPressureToRecomController?.text =
              FFLocalizations.of(context).getText(
            'h1dzv5qk' /* 80 */,
          );
          _model.bloodGlucoseRecomController?.text =
              FFLocalizations.of(context).getText(
            'uenbjkdt' /* 80 */,
          );
        }));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'Kidney247',
        color: FlutterFlowTheme.of(context).primary,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('SET_TARGET_arrow_back_rounded_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_update_app_state');
                  setState(() {
                    FFAppState().isBack = true;
                  });
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                },
              ),
              actions: [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: StreamBuilder<List<TargetsRecord>>(
                  stream: queryTargetsRecord(
                    queryBuilder: (targetsRecord) => targetsRecord
                        .where('user_ref', isEqualTo: currentUserReference),
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
                            color: FlutterFlowTheme.of(context).teal,
                            size: 40.0,
                          ),
                        ),
                      );
                    }
                    List<TargetsRecord> containerTargetsRecordList =
                        snapshot.data!;
                    final containerTargetsRecord =
                        containerTargetsRecordList.isNotEmpty
                            ? containerTargetsRecordList.first
                            : null;
                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      constraints: BoxConstraints(
                        maxWidth: 770.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'xlz2nya8' /* Targets 🎯 */,
                                          ),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily: 'Be Vietnam Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(FlutterFlowTheme
                                                            .of(context)
                                                        .headlineMediumFamily),
                                              ),
                                        ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '5uffj3ge' /* Set personalized targets with ... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Be Vietnam Pro',
                                              fontSize: 16.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).lineColor,
                              ),
                              StreamBuilder<List<NutrientRecord>>(
                                stream: queryNutrientRecord(
                                  parent: containerTargetsRecord!.reference,
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: LinearProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    );
                                  }
                                  List<NutrientRecord>
                                      queryNutrientNutrientRecordList =
                                      snapshot.data!;
                                  final queryNutrientNutrientRecord =
                                      queryNutrientNutrientRecordList.isNotEmpty
                                          ? queryNutrientNutrientRecordList
                                              .first
                                          : null;
                                  return Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    child: StreamBuilder<List<VitalRecord>>(
                                      stream: queryVitalRecord(
                                        parent:
                                            containerTargetsRecord!.reference,
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: LinearProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          );
                                        }
                                        List<VitalRecord>
                                            queryVitalVitalRecordList =
                                            snapshot.data!;
                                        final queryVitalVitalRecord =
                                            queryVitalVitalRecordList.isNotEmpty
                                                ? queryVitalVitalRecordList
                                                    .first
                                                : null;
                                        return Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: StreamBuilder<
                                              List<LabtestRecord>>(
                                            stream: queryLabtestRecord(
                                              parent: containerTargetsRecord!
                                                  .reference,
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child:
                                                      LinearProgressIndicator(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                );
                                              }
                                              List<LabtestRecord>
                                                  queryLabtestLabtestRecordList =
                                                  snapshot.data!;
                                              final queryLabtestLabtestRecord =
                                                  queryLabtestLabtestRecordList
                                                          .isNotEmpty
                                                      ? queryLabtestLabtestRecordList
                                                          .first
                                                      : null;
                                              return Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  20.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .carrot,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 30.0,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'pbqzpyjb' /* Nutrient Targets (Daily Totals... */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Be Vietnam Pro',
                                                                        fontSize:
                                                                            20.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '8hq9syn7' /* Phosphorus (mg) */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Be Vietnam Pro',
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              2.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                150.0,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.phosphorusRecomController,
                                                                              readOnly: true,
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                  'u3r115wv' /* Recommended */,
                                                                                ),
                                                                                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  'qsti0aew' /* ... */,
                                                                                ),
                                                                                hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                filled: true,
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                              textAlign: TextAlign.center,
                                                                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                              validator: _model.phosphorusRecomControllerValidator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                150.0,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.phosphorusTextController ??= TextEditingController(
                                                                                text: formatNumber(
                                                                                  queryNutrientNutrientRecord!.phosphorus,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.periodDecimal,
                                                                                ),
                                                                              ),
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                  '4q59179e' /* Target */,
                                                                                ),
                                                                                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  'wrtb9hib' /*  */,
                                                                                ),
                                                                                hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                filled: true,
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                              textAlign: TextAlign.center,
                                                                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                              validator: _model.phosphorusTextControllerValidator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            thickness: 1.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .lineColor,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'c36wj8cr' /* Protein (g) */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Be Vietnam Pro',
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              2.0,
                                                                              0.0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                Container(
                                                                              width: 150.0,
                                                                              child: TextFormField(
                                                                                controller: _model.proteinRecomController,
                                                                                readOnly: true,
                                                                                obscureText: false,
                                                                                decoration: InputDecoration(
                                                                                  labelText: FFLocalizations.of(context).getText(
                                                                                    '46y408om' /* Recommended */,
                                                                                  ),
                                                                                  labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Be Vietnam Pro',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 14.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                    'x27a8ox4' /* ... */,
                                                                                  ),
                                                                                  hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                  enabledBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  focusedBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  errorBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  filled: true,
                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      fontSize: 16.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                textAlign: TextAlign.center,
                                                                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                                validator: _model.proteinRecomControllerValidator.asValidator(context),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                150.0,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.proteinTextController ??= TextEditingController(
                                                                                text: formatNumber(
                                                                                  queryNutrientNutrientRecord!.protein,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.periodDecimal,
                                                                                ),
                                                                              ),
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                  'gf2fm22z' /* Target */,
                                                                                ),
                                                                                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  'c4cir9fh' /*  */,
                                                                                ),
                                                                                hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                filled: true,
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                              textAlign: TextAlign.center,
                                                                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                              validator: _model.proteinTextControllerValidator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            thickness: 1.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .lineColor,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'iwveij70' /* Calories (kcal) */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Be Vietnam Pro',
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              2.0,
                                                                              0.0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                Container(
                                                                              width: 150.0,
                                                                              child: TextFormField(
                                                                                controller: _model.caloriesRecomController,
                                                                                readOnly: true,
                                                                                obscureText: false,
                                                                                decoration: InputDecoration(
                                                                                  labelText: FFLocalizations.of(context).getText(
                                                                                    '4e6cewu4' /* Recommended */,
                                                                                  ),
                                                                                  labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Be Vietnam Pro',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 14.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                    'o63wti1k' /* ... */,
                                                                                  ),
                                                                                  hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                  enabledBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  focusedBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  errorBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  filled: true,
                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      fontSize: 16.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                textAlign: TextAlign.center,
                                                                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                                validator: _model.caloriesRecomControllerValidator.asValidator(context),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                150.0,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.caloriesTextController ??= TextEditingController(
                                                                                text: formatNumber(
                                                                                  queryNutrientNutrientRecord!.calories,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.periodDecimal,
                                                                                ),
                                                                              ),
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                  'gve2w4hz' /* Target */,
                                                                                ),
                                                                                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  '3fbzfamx' /*  */,
                                                                                ),
                                                                                hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                filled: true,
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                              textAlign: TextAlign.center,
                                                                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                              validator: _model.caloriesTextControllerValidator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            thickness: 1.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .lineColor,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'kfozy7qa' /* Potassium (mg) */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Be Vietnam Pro',
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              2.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                150.0,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.potassiumRecomController,
                                                                              readOnly: true,
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                  'zhixo8pt' /* Recommended */,
                                                                                ),
                                                                                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  'cua4o0bf' /* ... */,
                                                                                ),
                                                                                hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                filled: true,
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                              textAlign: TextAlign.center,
                                                                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                              validator: _model.potassiumRecomControllerValidator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                150.0,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.potassiumTextController ??= TextEditingController(
                                                                                text: formatNumber(
                                                                                  queryNutrientNutrientRecord!.potassium,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.periodDecimal,
                                                                                ),
                                                                              ),
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                  'iyhjsuza' /* Target */,
                                                                                ),
                                                                                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  '5dng4x4h' /*  */,
                                                                                ),
                                                                                hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                filled: true,
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                              textAlign: TextAlign.center,
                                                                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                              validator: _model.potassiumTextControllerValidator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            thickness: 1.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .lineColor,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'bzcuhc3u' /* Sodium (mg) */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Be Vietnam Pro',
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              2.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                150.0,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.sodiumRecomController,
                                                                              readOnly: true,
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                  'lx0nfeqe' /* Recommended */,
                                                                                ),
                                                                                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  'jisuntx6' /* ... */,
                                                                                ),
                                                                                hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                filled: true,
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                              textAlign: TextAlign.center,
                                                                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                              validator: _model.sodiumRecomControllerValidator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                150.0,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.sodiumTextController ??= TextEditingController(
                                                                                text: formatNumber(
                                                                                  queryNutrientNutrientRecord!.sodium,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.periodDecimal,
                                                                                ),
                                                                              ),
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                  'vpmdksov' /* Target */,
                                                                                ),
                                                                                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  '1ols1bcw' /*  */,
                                                                                ),
                                                                                hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                filled: true,
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                              textAlign: TextAlign.center,
                                                                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                              validator: _model.sodiumTextControllerValidator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            thickness: 1.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .lineColor,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'vr0a5ph8' /* Fluid Intake (l) */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Be Vietnam Pro',
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              2.0,
                                                                              0.0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                Container(
                                                                              width: 150.0,
                                                                              child: TextFormField(
                                                                                controller: _model.fluidIntakeRecomController,
                                                                                readOnly: true,
                                                                                obscureText: false,
                                                                                decoration: InputDecoration(
                                                                                  labelText: FFLocalizations.of(context).getText(
                                                                                    'yf1ojiqm' /* Recommended */,
                                                                                  ),
                                                                                  labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Be Vietnam Pro',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 14.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                    'e8im326b' /* ... */,
                                                                                  ),
                                                                                  hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                  enabledBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  focusedBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  errorBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  filled: true,
                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      fontSize: 16.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                textAlign: TextAlign.center,
                                                                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                                validator: _model.fluidIntakeRecomControllerValidator.asValidator(context),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                150.0,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.fluidIntakeTextController ??= TextEditingController(
                                                                                text: formatNumber(
                                                                                  queryNutrientNutrientRecord!.fluidIntake,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.periodDecimal,
                                                                                ),
                                                                              ),
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                  '9xuqx090' /* Target */,
                                                                                ),
                                                                                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  'wexiybi5' /*  */,
                                                                                ),
                                                                                hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                filled: true,
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                              textAlign: TextAlign.center,
                                                                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                              validator: _model.fluidIntakeTextControllerValidator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  20.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .laptopMedical,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 30.0,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '64gk82sm' /* Vital Targets */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Be Vietnam Pro',
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'jj02io2w' /* Blood Pressure (mmHg) */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Be Vietnam Pro',
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              flex: 1,
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                                child: Container(
                                                                                  width: 150.0,
                                                                                  child: TextFormField(
                                                                                    controller: _model.bloodPressureFromRecomController,
                                                                                    readOnly: true,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      labelText: FFLocalizations.of(context).getText(
                                                                                        'abljitx2' /* Recommended */,
                                                                                      ),
                                                                                      labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Be Vietnam Pro',
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            fontSize: 14.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                        '18tdua4d' /* ... */,
                                                                                      ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0x00000000),
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: const BorderRadius.only(
                                                                                          topLeft: Radius.circular(4.0),
                                                                                          topRight: Radius.circular(4.0),
                                                                                        ),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0x00000000),
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: const BorderRadius.only(
                                                                                          topLeft: Radius.circular(4.0),
                                                                                          topRight: Radius.circular(4.0),
                                                                                        ),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0x00000000),
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: const BorderRadius.only(
                                                                                          topLeft: Radius.circular(4.0),
                                                                                          topRight: Radius.circular(4.0),
                                                                                        ),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0x00000000),
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: const BorderRadius.only(
                                                                                          topLeft: Radius.circular(4.0),
                                                                                          topRight: Radius.circular(4.0),
                                                                                        ),
                                                                                      ),
                                                                                      filled: true,
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Be Vietnam Pro',
                                                                                          fontSize: 16.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                    textAlign: TextAlign.center,
                                                                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                                    validator: _model.bloodPressureFromRecomControllerValidator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              flex: 1,
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                child: Container(
                                                                                  width: 150.0,
                                                                                  child: TextFormField(
                                                                                    controller: _model.bloodPressureFromTextController ??= TextEditingController(
                                                                                      text: formatNumber(
                                                                                        queryVitalVitalRecord!.bloodPressureFrom,
                                                                                        formatType: FormatType.decimal,
                                                                                        decimalType: DecimalType.periodDecimal,
                                                                                      ),
                                                                                    ),
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      labelText: FFLocalizations.of(context).getText(
                                                                                        'uh8bdxwj' /* Target */,
                                                                                      ),
                                                                                      labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Be Vietnam Pro',
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            fontSize: 14.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                        'sz9jrdzk' /*  */,
                                                                                      ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0x00000000),
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: const BorderRadius.only(
                                                                                          topLeft: Radius.circular(4.0),
                                                                                          topRight: Radius.circular(4.0),
                                                                                        ),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0x00000000),
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: const BorderRadius.only(
                                                                                          topLeft: Radius.circular(4.0),
                                                                                          topRight: Radius.circular(4.0),
                                                                                        ),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0x00000000),
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: const BorderRadius.only(
                                                                                          topLeft: Radius.circular(4.0),
                                                                                          topRight: Radius.circular(4.0),
                                                                                        ),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0x00000000),
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: const BorderRadius.only(
                                                                                          topLeft: Radius.circular(4.0),
                                                                                          topRight: Radius.circular(4.0),
                                                                                        ),
                                                                                      ),
                                                                                      filled: true,
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Be Vietnam Pro',
                                                                                          fontSize: 16.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                    textAlign: TextAlign.center,
                                                                                    keyboardType: TextInputType.number,
                                                                                    validator: _model.bloodPressureFromTextControllerValidator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              flex: 1,
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                                child: Container(
                                                                                  width: 150.0,
                                                                                  child: TextFormField(
                                                                                    controller: _model.bloodPressureToRecomController,
                                                                                    readOnly: true,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      labelText: FFLocalizations.of(context).getText(
                                                                                        'qx8fgj6j' /* Recommended */,
                                                                                      ),
                                                                                      labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Be Vietnam Pro',
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            fontSize: 14.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                        'miywlur5' /* ... */,
                                                                                      ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0x00000000),
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: const BorderRadius.only(
                                                                                          topLeft: Radius.circular(4.0),
                                                                                          topRight: Radius.circular(4.0),
                                                                                        ),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0x00000000),
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: const BorderRadius.only(
                                                                                          topLeft: Radius.circular(4.0),
                                                                                          topRight: Radius.circular(4.0),
                                                                                        ),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0x00000000),
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: const BorderRadius.only(
                                                                                          topLeft: Radius.circular(4.0),
                                                                                          topRight: Radius.circular(4.0),
                                                                                        ),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0x00000000),
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: const BorderRadius.only(
                                                                                          topLeft: Radius.circular(4.0),
                                                                                          topRight: Radius.circular(4.0),
                                                                                        ),
                                                                                      ),
                                                                                      filled: true,
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Be Vietnam Pro',
                                                                                          fontSize: 16.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                    textAlign: TextAlign.center,
                                                                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                                    validator: _model.bloodPressureToRecomControllerValidator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              flex: 1,
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                child: Container(
                                                                                  width: 150.0,
                                                                                  child: TextFormField(
                                                                                    controller: _model.bloodPressureToTextController ??= TextEditingController(
                                                                                      text: formatNumber(
                                                                                        queryVitalVitalRecord!.bloodPressureTo,
                                                                                        formatType: FormatType.decimal,
                                                                                        decimalType: DecimalType.periodDecimal,
                                                                                      ),
                                                                                    ),
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      labelText: FFLocalizations.of(context).getText(
                                                                                        'jqo5djlw' /* Target */,
                                                                                      ),
                                                                                      labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Be Vietnam Pro',
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            fontSize: 14.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                        'z675ezyx' /*  */,
                                                                                      ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0x00000000),
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: const BorderRadius.only(
                                                                                          topLeft: Radius.circular(4.0),
                                                                                          topRight: Radius.circular(4.0),
                                                                                        ),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0x00000000),
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: const BorderRadius.only(
                                                                                          topLeft: Radius.circular(4.0),
                                                                                          topRight: Radius.circular(4.0),
                                                                                        ),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0x00000000),
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: const BorderRadius.only(
                                                                                          topLeft: Radius.circular(4.0),
                                                                                          topRight: Radius.circular(4.0),
                                                                                        ),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0x00000000),
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: const BorderRadius.only(
                                                                                          topLeft: Radius.circular(4.0),
                                                                                          topRight: Radius.circular(4.0),
                                                                                        ),
                                                                                      ),
                                                                                      filled: true,
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Be Vietnam Pro',
                                                                                          fontSize: 16.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                    textAlign: TextAlign.center,
                                                                                    keyboardType: TextInputType.number,
                                                                                    validator: _model.bloodPressureToTextControllerValidator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            thickness: 1.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .lineColor,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'flf13i0h' /* Blood Glucose (mg/dL) */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Be Vietnam Pro',
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
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
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              2.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                150.0,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.bloodGlucoseRecomController,
                                                                              readOnly: true,
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                  '7raz2vnl' /* Recommended */,
                                                                                ),
                                                                                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  'z2onwto5' /* ... */,
                                                                                ),
                                                                                hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                filled: true,
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                              textAlign: TextAlign.center,
                                                                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                              validator: _model.bloodGlucoseRecomControllerValidator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                150.0,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.bloodGlucoseTextController ??= TextEditingController(
                                                                                text: formatNumber(
                                                                                  queryVitalVitalRecord!.bloodGlucose,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.periodDecimal,
                                                                                ),
                                                                              ),
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                  '9ngeg3te' /* Target */,
                                                                                ),
                                                                                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  'cfck5me9' /*  */,
                                                                                ),
                                                                                hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                filled: true,
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                              textAlign: TextAlign.center,
                                                                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                              validator: _model.bloodGlucoseTextControllerValidator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            thickness: 1.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .lineColor,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'az7bu7oq' /* Fluid Output (l) */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Be Vietnam Pro',
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
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
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              2.0,
                                                                              0.0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                Container(
                                                                              width: 150.0,
                                                                              child: TextFormField(
                                                                                controller: _model.fluidOutputRecomController,
                                                                                readOnly: true,
                                                                                obscureText: false,
                                                                                decoration: InputDecoration(
                                                                                  labelText: FFLocalizations.of(context).getText(
                                                                                    'ialop041' /* Recommended */,
                                                                                  ),
                                                                                  labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Be Vietnam Pro',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 14.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                    'j45nagiw' /* ... */,
                                                                                  ),
                                                                                  hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                  enabledBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  focusedBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  errorBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  filled: true,
                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      fontSize: 16.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                textAlign: TextAlign.center,
                                                                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                                validator: _model.fluidOutputRecomControllerValidator.asValidator(context),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                150.0,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.fluidOutputTextController ??= TextEditingController(
                                                                                text: formatNumber(
                                                                                  queryVitalVitalRecord!.fluidOutput,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.periodDecimal,
                                                                                ),
                                                                              ),
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                  '0amn9tcg' /* Target */,
                                                                                ),
                                                                                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  'fvdnp8il' /*  */,
                                                                                ),
                                                                                hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                filled: true,
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                              textAlign: TextAlign.center,
                                                                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                              validator: _model.fluidOutputTextControllerValidator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  20.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                child: Icon(
                                                                  Icons.ballot,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 30.0,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'fwkcodf2' /* Lab Test Targets */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Be Vietnam Pro',
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'ljqwmq2z' /* Blood Glucose A1C (%) */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Be Vietnam Pro',
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
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
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              2.0,
                                                                              0.0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                Container(
                                                                              width: 150.0,
                                                                              child: TextFormField(
                                                                                controller: _model.bloodGlucoseA1CRecomController,
                                                                                readOnly: true,
                                                                                obscureText: false,
                                                                                decoration: InputDecoration(
                                                                                  labelText: FFLocalizations.of(context).getText(
                                                                                    '7x7fmgnp' /* Recommended */,
                                                                                  ),
                                                                                  labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Be Vietnam Pro',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 14.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                    'seiiy7yj' /* ... */,
                                                                                  ),
                                                                                  hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                  enabledBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  focusedBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  errorBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  filled: true,
                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      fontSize: 16.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                textAlign: TextAlign.center,
                                                                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                                validator: _model.bloodGlucoseA1CRecomControllerValidator.asValidator(context),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                150.0,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.bloodGlucoseA1CTextController ??= TextEditingController(
                                                                                text: valueOrDefault<String>(
                                                                                  formatNumber(
                                                                                    queryLabtestLabtestRecord!.bloodGlucose,
                                                                                    formatType: FormatType.decimal,
                                                                                    decimalType: DecimalType.periodDecimal,
                                                                                  ),
                                                                                  '0',
                                                                                ),
                                                                              ),
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                  '024vpw2i' /* Target */,
                                                                                ),
                                                                                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  'idxjirnm' /*  */,
                                                                                ),
                                                                                hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                filled: true,
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                              textAlign: TextAlign.center,
                                                                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                              validator: _model.bloodGlucoseA1CTextControllerValidator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            thickness: 1.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .lineColor,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'm6ptix4j' /* eGFR (mL/minute) */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Be Vietnam Pro',
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
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
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              2.0,
                                                                              0.0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                Container(
                                                                              width: 150.0,
                                                                              child: TextFormField(
                                                                                controller: _model.eGFRTextRecomController,
                                                                                readOnly: true,
                                                                                obscureText: false,
                                                                                decoration: InputDecoration(
                                                                                  labelText: FFLocalizations.of(context).getText(
                                                                                    'nj6b00ml' /* Recommended */,
                                                                                  ),
                                                                                  labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Be Vietnam Pro',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 14.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                    '4lf938d5' /* ... */,
                                                                                  ),
                                                                                  hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                  enabledBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  focusedBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  errorBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  filled: true,
                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      fontSize: 16.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                textAlign: TextAlign.center,
                                                                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                                validator: _model.eGFRTextRecomControllerValidator.asValidator(context),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                150.0,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.eGFRTextController ??= TextEditingController(
                                                                                text: valueOrDefault<String>(
                                                                                  formatNumber(
                                                                                    queryLabtestLabtestRecord!.eGFR,
                                                                                    formatType: FormatType.decimal,
                                                                                    decimalType: DecimalType.periodDecimal,
                                                                                  ),
                                                                                  '0',
                                                                                ),
                                                                              ),
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                  'y4yqz2i0' /* Target */,
                                                                                ),
                                                                                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  'dyse3mvn' /*  */,
                                                                                ),
                                                                                hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                    ),
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                filled: true,
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                              textAlign: TextAlign.center,
                                                                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                              validator: _model.eGFRTextControllerValidator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            thickness: 1.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .lineColor,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'f2xoqhsp' /* Albumin (g/dL) */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Be Vietnam Pro',
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
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
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              2.0,
                                                                              0.0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                Container(
                                                                              width: 150.0,
                                                                              child: TextFormField(
                                                                                controller: _model.albuminRecomController,
                                                                                readOnly: true,
                                                                                obscureText: false,
                                                                                decoration: InputDecoration(
                                                                                  labelText: FFLocalizations.of(context).getText(
                                                                                    '8oltse75' /* Recommended */,
                                                                                  ),
                                                                                  labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Be Vietnam Pro',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 14.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                    'nmtyg5ss' /* ... */,
                                                                                  ),
                                                                                  hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                  enabledBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  focusedBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  errorBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  filled: true,
                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      fontSize: 16.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                textAlign: TextAlign.center,
                                                                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                                validator: _model.albuminRecomControllerValidator.asValidator(context),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                150.0,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.albuminTextController ??= TextEditingController(
                                                                                text: valueOrDefault<String>(
                                                                                  formatNumber(
                                                                                    queryLabtestLabtestRecord!.albumin,
                                                                                    formatType: FormatType.decimal,
                                                                                    decimalType: DecimalType.periodDecimal,
                                                                                  ),
                                                                                  '0',
                                                                                ),
                                                                              ),
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                  'jh2n1z9l' /* Target */,
                                                                                ),
                                                                                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  'js197kpi' /*  */,
                                                                                ),
                                                                                hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                    ),
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                filled: true,
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                              textAlign: TextAlign.center,
                                                                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                              validator: _model.albuminTextControllerValidator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            thickness: 1.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .lineColor,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '69wekrs7' /* Blood Urea Nitrogen (mg/dL) */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Be Vietnam Pro',
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
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
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              2.0,
                                                                              0.0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                Container(
                                                                              width: 150.0,
                                                                              child: TextFormField(
                                                                                controller: _model.bloodUNRecomController,
                                                                                readOnly: true,
                                                                                obscureText: false,
                                                                                decoration: InputDecoration(
                                                                                  labelText: FFLocalizations.of(context).getText(
                                                                                    'cqje5kbk' /* Recommended */,
                                                                                  ),
                                                                                  labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Be Vietnam Pro',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 14.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                    '6o73ajh5' /* ... */,
                                                                                  ),
                                                                                  hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                  enabledBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  focusedBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  errorBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  filled: true,
                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      fontSize: 16.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                textAlign: TextAlign.center,
                                                                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                                validator: _model.bloodUNRecomControllerValidator.asValidator(context),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                150.0,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.bloodUNTextController ??= TextEditingController(
                                                                                text: valueOrDefault<String>(
                                                                                  formatNumber(
                                                                                    queryLabtestLabtestRecord!.bloodUN,
                                                                                    formatType: FormatType.decimal,
                                                                                    decimalType: DecimalType.periodDecimal,
                                                                                  ),
                                                                                  '0',
                                                                                ),
                                                                              ),
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                  '1adxn9aj' /* Target */,
                                                                                ),
                                                                                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  'wdgnimv1' /*  */,
                                                                                ),
                                                                                hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                    ),
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                filled: true,
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                              textAlign: TextAlign.center,
                                                                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                              validator: _model.bloodUNTextControllerValidator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  24.0,
                                                                  0.0,
                                                                  50.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'SET_TARGET_PAGE_PAGE_Button-Save_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Button-Save_backend_call');

                                                          final targetsUpdateData =
                                                              createTargetsRecordData(
                                                            createdAt:
                                                                getCurrentTimestamp,
                                                            userRef:
                                                                currentUserReference,
                                                          );
                                                          await containerTargetsRecord!
                                                              .reference
                                                              .update(
                                                                  targetsUpdateData);
                                                          logFirebaseEvent(
                                                              'Button-Save_backend_call');

                                                          final nutrientUpdateData =
                                                              createNutrientRecordData(
                                                            phosphorus: _model
                                                                            .phosphorusTextController
                                                                            .text !=
                                                                        null &&
                                                                    _model.phosphorusTextController
                                                                            .text !=
                                                                        ''
                                                                ? double.tryParse(
                                                                    _model
                                                                        .phosphorusTextController
                                                                        .text)
                                                                : double.tryParse(
                                                                    _model
                                                                        .phosphorusRecomController
                                                                        .text),
                                                            protein: _model.proteinTextController
                                                                            .text !=
                                                                        null &&
                                                                    _model.proteinTextController
                                                                            .text !=
                                                                        ''
                                                                ? double.tryParse(
                                                                    _model
                                                                        .proteinTextController
                                                                        .text)
                                                                : double.tryParse(
                                                                    _model
                                                                        .proteinRecomController
                                                                        .text),
                                                            sodium: _model.sodiumTextController
                                                                            .text !=
                                                                        null &&
                                                                    _model.sodiumTextController
                                                                            .text !=
                                                                        ''
                                                                ? double.tryParse(
                                                                    _model
                                                                        .sodiumTextController
                                                                        .text)
                                                                : double.tryParse(
                                                                    _model
                                                                        .sodiumRecomController
                                                                        .text),
                                                            fluidIntake: _model
                                                                            .fluidIntakeTextController
                                                                            .text !=
                                                                        null &&
                                                                    _model.fluidIntakeTextController
                                                                            .text !=
                                                                        ''
                                                                ? double.tryParse(
                                                                    _model
                                                                        .fluidIntakeTextController
                                                                        .text)
                                                                : double.tryParse(
                                                                    _model
                                                                        .fluidIntakeRecomController
                                                                        .text),
                                                            potassium: _model
                                                                            .potassiumTextController
                                                                            .text !=
                                                                        null &&
                                                                    _model.potassiumTextController
                                                                            .text !=
                                                                        ''
                                                                ? double.tryParse(
                                                                    _model
                                                                        .potassiumTextController
                                                                        .text)
                                                                : double.tryParse(
                                                                    _model
                                                                        .potassiumRecomController
                                                                        .text),
                                                            calories: _model.caloriesTextController
                                                                            .text !=
                                                                        null &&
                                                                    _model.caloriesTextController
                                                                            .text !=
                                                                        ''
                                                                ? double.tryParse(
                                                                    _model
                                                                        .caloriesTextController
                                                                        .text)
                                                                : double.tryParse(
                                                                    _model
                                                                        .caloriesRecomController
                                                                        .text),
                                                          );
                                                          await queryNutrientNutrientRecord!
                                                              .reference
                                                              .update(
                                                                  nutrientUpdateData);
                                                          logFirebaseEvent(
                                                              'Button-Save_backend_call');

                                                          final vitalUpdateData =
                                                              createVitalRecordData(
                                                            bloodPressureFrom: _model
                                                                            .bloodPressureFromTextController
                                                                            .text !=
                                                                        null &&
                                                                    _model.bloodPressureFromTextController
                                                                            .text !=
                                                                        ''
                                                                ? int.tryParse(
                                                                    _model
                                                                        .bloodPressureFromTextController
                                                                        .text)
                                                                : int.tryParse(
                                                                    _model
                                                                        .bloodPressureFromRecomController
                                                                        .text),
                                                            bloodPressureTo: int
                                                                .tryParse(_model
                                                                    .bloodPressureToTextController
                                                                    .text),
                                                            bloodGlucose: (_model.bloodPressureToTextController.text !=
                                                                            null &&
                                                                        _model.bloodPressureToTextController.text !=
                                                                            ''
                                                                    ? int.tryParse(_model
                                                                        .bloodPressureFromTextController
                                                                        .text)
                                                                    : int.tryParse(_model
                                                                        .bloodPressureToRecomController
                                                                        .text))
                                                                ?.toDouble(),
                                                            fluidOutput: _model
                                                                            .fluidOutputTextController
                                                                            .text !=
                                                                        null &&
                                                                    _model.fluidOutputTextController
                                                                            .text !=
                                                                        ''
                                                                ? double.tryParse(
                                                                    _model
                                                                        .fluidOutputTextController
                                                                        .text)
                                                                : double.tryParse(
                                                                    _model
                                                                        .fluidOutputRecomController
                                                                        .text),
                                                          );
                                                          await queryVitalVitalRecord!
                                                              .reference
                                                              .update(
                                                                  vitalUpdateData);
                                                          logFirebaseEvent(
                                                              'Button-Save_backend_call');

                                                          final labtestUpdateData =
                                                              createLabtestRecordData(
                                                            eGFR: _model.eGFRTextController
                                                                            .text !=
                                                                        null &&
                                                                    _model.eGFRTextController
                                                                            .text !=
                                                                        ''
                                                                ? double.tryParse(
                                                                    _model
                                                                        .eGFRTextController
                                                                        .text)
                                                                : double.tryParse(
                                                                    _model
                                                                        .eGFRTextRecomController
                                                                        .text),
                                                            albumin: _model.albuminTextController
                                                                            .text !=
                                                                        null &&
                                                                    _model.albuminTextController
                                                                            .text !=
                                                                        ''
                                                                ? double.tryParse(
                                                                    _model
                                                                        .albuminTextController
                                                                        .text)
                                                                : double.tryParse(
                                                                    _model
                                                                        .albuminRecomController
                                                                        .text),
                                                            bloodUN: _model.bloodUNTextController
                                                                            .text !=
                                                                        null &&
                                                                    _model.bloodUNTextController
                                                                            .text !=
                                                                        ''
                                                                ? double.tryParse(
                                                                    _model
                                                                        .bloodUNTextController
                                                                        .text)
                                                                : double.tryParse(
                                                                    _model
                                                                        .bloodUNRecomController
                                                                        .text),
                                                            bloodGlucose: _model
                                                                            .bloodGlucoseA1CTextController
                                                                            .text !=
                                                                        null &&
                                                                    _model.bloodGlucoseA1CTextController
                                                                            .text !=
                                                                        ''
                                                                ? double.tryParse(
                                                                    _model
                                                                        .bloodGlucoseA1CTextController
                                                                        .text)
                                                                : double.tryParse(
                                                                    _model
                                                                        .bloodGlucoseA1CRecomController
                                                                        .text),
                                                          );
                                                          await queryLabtestLabtestRecord!
                                                              .reference
                                                              .update(
                                                                  labtestUpdateData);
                                                          if (widget.isEdited) {
                                                            logFirebaseEvent(
                                                                'Button-Save_navigate_back');
                                                            context.safePop();
                                                            logFirebaseEvent(
                                                                'Button-Save_show_snack_bar');
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  FFLocalizations.of(context)
                                                                              .languageCode ==
                                                                          'en'
                                                                      ? 'Update successfully!'
                                                                      : 'Cập nhật thành công',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else {
                                                            logFirebaseEvent(
                                                                'Button-Save_navigate_to');

                                                            context.goNamed(
                                                              'addCareTeam',
                                                              queryParameters: {
                                                                'isCompleteProfile':
                                                                    serializeParam(
                                                                  true,
                                                                  ParamType
                                                                      .bool,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          }
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'o52rqqa9' /* Save */,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width:
                                                              double.infinity,
                                                          height: 50.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Be Vietnam Pro',
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleSmallFamily),
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      40.0),
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
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ));
  }
}
