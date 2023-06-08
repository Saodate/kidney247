import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'meal_unit_slider_model.dart';
export 'meal_unit_slider_model.dart';

class MealUnitSliderWidget extends StatefulWidget {
  const MealUnitSliderWidget({
    Key? key,
    this.meal,
    this.customMeal,
  }) : super(key: key);

  final dynamic meal;
  final CustomMealRecord? customMeal;

  @override
  _MealUnitSliderWidgetState createState() => _MealUnitSliderWidgetState();
}

class _MealUnitSliderWidgetState extends State<MealUnitSliderWidget> {
  late MealUnitSliderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MealUnitSliderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<MealsRecord>>(
      stream: queryMealsRecord(
        queryBuilder: (mealsRecord) =>
            mealsRecord.where('user_ref', isEqualTo: currentUserReference),
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
        List<MealsRecord> containerMealsRecordList = snapshot.data!;
        return Container(
          width: MediaQuery.of(context).size.width * 1.0,
          height: MediaQuery.of(context).size.height * 1.0,
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
                          color: FlutterFlowTheme.of(context).teal,
                          size: 40.0,
                        ),
                      ),
                    );
                  }
                  List<NutrientRecord> containerNutrientRecordList =
                      snapshot.data!;
                  final containerNutrientRecord =
                      containerNutrientRecordList.isNotEmpty
                          ? containerNutrientRecordList.first
                          : null;
                  return Container(
                    width: double.infinity,
                    height: 350.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5.0,
                          color: Color(0x3B1D2429),
                          offset: Offset(0.0, -3.0),
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 20.0, 20.0, 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'v3o8hrab' /* How much did you have? */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: 'Be Vietnam Pro',
                                  fontSize: 28.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .displaySmallFamily),
                                ),
                          ),
                          if (widget.customMeal != null)
                            Text(
                              functions.toUpperCase(widget.customMeal!.name),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Be Vietnam Pro',
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleMediumFamily),
                                  ),
                            ),
                          if (widget.meal != null)
                            Text(
                              functions.toUpperCase(getJsonField(
                                widget.meal,
                                r'''$.foods[0].food_name''',
                              ).toString()),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Be Vietnam Pro',
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleMediumFamily),
                                  ),
                            ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  _model.sliderValue?.toString(),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Be Vietnam Pro',
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmallFamily),
                                    ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (widget.meal != null)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'pkyyz4u1' /* g */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Be Vietnam Pro',
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmallFamily),
                                            ),
                                      ),
                                    ),
                                  if (widget.customMeal != null)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        widget.customMeal!.unit,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Be Vietnam Pro',
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmallFamily),
                                            ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                          Slider(
                            activeColor: FlutterFlowTheme.of(context).primary,
                            inactiveColor: Color(0xFF9E9E9E),
                            min: 0.0,
                            max: valueOrDefault<double>(
                              widget.meal != null
                                  ? (double.parse(getJsonField(
                                        widget.meal,
                                        r'''$.foods[0].serving_weight_grams''',
                                      ).toStringAsFixed(2)) *
                                      2)
                                  : valueOrDefault<double>(
                                      widget.customMeal!.qty * 2,
                                      0.0,
                                    ),
                              10.0,
                            ),
                            value: _model.sliderValue ??=
                                valueOrDefault<double>(
                              widget.meal != null
                                  ? (double.parse(getJsonField(
                                      widget.meal,
                                      r'''$.foods[0].serving_weight_grams''',
                                    ).toStringAsFixed(2)))
                                  : widget.customMeal!.qty,
                              0.0,
                            ),
                            label: _model.sliderValue.toString(),
                            divisions: 10,
                            onChanged: (newValue) {
                              newValue =
                                  double.parse(newValue.toStringAsFixed(1));
                              setState(() => _model.sliderValue = newValue);
                            },
                          ),
                          if (widget.meal != null)
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'MEAL_UNIT_SLIDER_ADD_TO_LOG_BTN_ON_TAP');
                                logFirebaseEvent('Button_backend_call');

                                final mealsCreateData = createMealsRecordData(
                                  name: functions.toUpperCase(getJsonField(
                                    widget.meal,
                                    r'''$.foods[0].food_name''',
                                  ).toString()),
                                  phosphorus: functions.calculateNutrition(
                                      _model.sliderValue!,
                                      getJsonField(
                                        widget.meal,
                                        r'''$.foods[0].serving_weight_grams''',
                                      ),
                                      getJsonField(
                                        widget.meal,
                                        r'''$..full_nutrients[?(@.attr_id ==305)].value''',
                                      )),
                                  protein: functions.calculateNutrition(
                                      _model.sliderValue!,
                                      getJsonField(
                                        widget.meal,
                                        r'''$.foods[0].serving_weight_grams''',
                                      ),
                                      getJsonField(
                                        widget.meal,
                                        r'''$.foods[0].nf_protein''',
                                      )),
                                  potassium: functions.calculateNutrition(
                                      _model.sliderValue!,
                                      getJsonField(
                                        widget.meal,
                                        r'''$.foods[0].serving_weight_grams''',
                                      ),
                                      getJsonField(
                                        widget.meal,
                                        r'''$.foods[0].nf_potassium''',
                                      )),
                                  sodium: functions.calculateNutrition(
                                      _model.sliderValue!,
                                      getJsonField(
                                        widget.meal,
                                        r'''$.foods[0].serving_weight_grams''',
                                      ),
                                      getJsonField(
                                        widget.meal,
                                        r'''$.foods[0].nf_sodium''',
                                      )),
                                  qty: _model.sliderValue,
                                  unit: 'g',
                                  createdAt: getCurrentTimestamp,
                                  userRef: currentUserReference,
                                  photo: getJsonField(
                                    widget.meal,
                                    r'''$.foods[0].photo.highres''',
                                  ),
                                  fluid: functions.calculateNutrition(
                                      _model.sliderValue!,
                                      getJsonField(
                                        widget.meal,
                                        r'''$.foods[0].serving_weight_grams''',
                                      ),
                                      double.parse((getJsonField(
                                                widget.meal,
                                                r'''$..full_nutrients[?(@.attr_id ==255)].value''',
                                              ) /
                                              1000)
                                          .toStringAsFixed(2))),
                                  gram: functions.calculateNutrition(
                                      _model.sliderValue!,
                                      getJsonField(
                                        widget.meal,
                                        r'''$.foods[0].serving_weight_grams''',
                                      ),
                                      getJsonField(
                                        widget.meal,
                                        r'''$.foods[0].serving_weight_grams''',
                                      )),
                                  calories: functions.calculateNutrition(
                                      _model.sliderValue!,
                                      getJsonField(
                                        widget.meal,
                                        r'''$.foods[0].nf_calories''',
                                      ),
                                      double.parse((getJsonField(
                                                widget.meal,
                                                r'''$..full_nutrients[?(@.attr_id ==255)].value''',
                                              ) /
                                              1000)
                                          .toStringAsFixed(2))),
                                );
                                var mealsRecordReference =
                                    MealsRecord.collection.doc();
                                await mealsRecordReference.set(mealsCreateData);
                                _model.createdMeal =
                                    MealsRecord.getDocumentFromData(
                                        mealsCreateData, mealsRecordReference);
                                if ((_model.createdMeal != null) == true) {
                                  logFirebaseEvent(
                                      'Button_close_dialog,_drawer,_etc');
                                  Navigator.pop(context);
                                  logFirebaseEvent('Button_show_snack_bar');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Add to Log succesfully!',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 2000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                  if (valueOrDefault<bool>(
                                    (double totalPhosphorus, double target) {
                                      return (double.parse((totalPhosphorus *
                                                      100 /
                                                      target /
                                                      100)
                                                  .toStringAsFixed(2))) ==
                                              0.9
                                          ? true
                                          : false;
                                    }(
                                        functions.totalPhosphorus(
                                            containerMealsRecordList.toList()),
                                        containerNutrientRecord!.phosphorus),
                                    false,
                                  )) {
                                    logFirebaseEvent(
                                        'Button_trigger_push_notification');
                                    triggerPushNotification(
                                      notificationTitle:
                                          FFLocalizations.of(context)
                                                      .languageCode ==
                                                  'en'
                                              ? 'Nutrition intake reminder'
                                              : 'Ngưỡng dinh dưỡng',
                                      notificationText: FFLocalizations.of(
                                                      context)
                                                  .languageCode ==
                                              'en'
                                          ? 'You\'ve reached 90% of your daily nutrition goal for phosphorus. '
                                          : 'Bạn đã đạt 90% lượng phốt pho hàng ngày',
                                      notificationSound: 'default',
                                      userRefs: [currentUserReference!],
                                      initialPageName: 'homePage',
                                      parameterData: {},
                                    );
                                  } else {
                                    if (valueOrDefault<bool>(
                                      (double totalProtein, double target) {
                                        return (double.parse((totalProtein *
                                                        100 /
                                                        target /
                                                        100)
                                                    .toStringAsFixed(2))) ==
                                                0.9
                                            ? true
                                            : false;
                                      }(
                                          functions.totalProtein(
                                              containerMealsRecordList
                                                  .toList()),
                                          containerNutrientRecord!.protein),
                                      false,
                                    )) {
                                      logFirebaseEvent(
                                          'Button_trigger_push_notification');
                                      triggerPushNotification(
                                        notificationTitle:
                                            FFLocalizations.of(context)
                                                        .languageCode ==
                                                    'en'
                                                ? 'Nutrition intake reminder'
                                                : 'Ngưỡng dinh dưỡng',
                                        notificationText: FFLocalizations.of(
                                                        context)
                                                    .languageCode ==
                                                'en'
                                            ? 'You\'ve reached 90% of your daily nutrition goal for protein.'
                                            : 'Bạn đã đạt 90% lượng chất đạm hàng ngày',
                                        notificationSound: 'default',
                                        userRefs: [currentUserReference!],
                                        initialPageName: 'homePage',
                                        parameterData: {},
                                      );
                                    } else {
                                      if (valueOrDefault<bool>(
                                        (double totalPotassium, double target) {
                                          return (double.parse((totalPotassium *
                                                          100 /
                                                          target /
                                                          100)
                                                      .toStringAsFixed(2))) ==
                                                  0.9
                                              ? true
                                              : false;
                                        }(
                                            functions.totalPotassium(
                                                containerMealsRecordList
                                                    .toList()),
                                            containerNutrientRecord!.potassium),
                                        false,
                                      )) {
                                        logFirebaseEvent(
                                            'Button_trigger_push_notification');
                                        triggerPushNotification(
                                          notificationTitle:
                                              FFLocalizations.of(context)
                                                          .languageCode ==
                                                      'en'
                                                  ? 'Nutrition intake reminder'
                                                  : 'Ngưỡng dinh dưỡng',
                                          notificationText: FFLocalizations.of(
                                                          context)
                                                      .languageCode ==
                                                  'en'
                                              ? 'You\'ve reached 90% of your daily nutrition goal for potassium.'
                                              : 'Bạn đã đạt 90% lượng kali hàng ngày',
                                          notificationSound: 'default',
                                          userRefs: [currentUserReference!],
                                          initialPageName: 'homePage',
                                          parameterData: {},
                                        );
                                      } else {
                                        if (valueOrDefault<bool>(
                                          (double totalSodium, double target) {
                                            return (double.parse((totalSodium *
                                                            100 /
                                                            target /
                                                            100)
                                                        .toStringAsFixed(2))) ==
                                                    0.9
                                                ? true
                                                : false;
                                          }(
                                              functions.totalSodium(
                                                  containerMealsRecordList
                                                      .toList()),
                                              containerNutrientRecord!.sodium),
                                          false,
                                        )) {
                                          logFirebaseEvent(
                                              'Button_trigger_push_notification');
                                          triggerPushNotification(
                                            notificationTitle: FFLocalizations
                                                            .of(context)
                                                        .languageCode ==
                                                    'en'
                                                ? 'Nutrition intake reminder'
                                                : 'Ngưỡng dinh dưỡng',
                                            notificationText: FFLocalizations
                                                            .of(context)
                                                        .languageCode ==
                                                    'en'
                                                ? 'You\'ve reached 90% of your daily nutrition goal for sodium.'
                                                : 'Bạn đã đạt 90% lượng natri hàng ngày',
                                            notificationSound: 'default',
                                            userRefs: [currentUserReference!],
                                            initialPageName: 'homePage',
                                            parameterData: {},
                                          );
                                        } else {
                                          if (valueOrDefault<bool>(
                                            (double totalCalories,
                                                    double target) {
                                              return (double.parse(
                                                          (totalCalories *
                                                                  100 /
                                                                  target /
                                                                  100)
                                                              .toStringAsFixed(
                                                                  2))) ==
                                                      0.9
                                                  ? true
                                                  : false;
                                            }(
                                                functions.totalCalories(
                                                    containerMealsRecordList
                                                        .toList()),
                                                containerNutrientRecord!
                                                    .calories),
                                            false,
                                          )) {
                                            logFirebaseEvent(
                                                'Button_trigger_push_notification');
                                            triggerPushNotification(
                                              notificationTitle: FFLocalizations
                                                              .of(context)
                                                          .languageCode ==
                                                      'en'
                                                  ? 'Nutrition intake reminder'
                                                  : 'Ngưỡng dinh dưỡng',
                                              notificationText: FFLocalizations
                                                              .of(context)
                                                          .languageCode ==
                                                      'en'
                                                  ? 'You\'ve reached 90% of your daily nutrition goal for calories.'
                                                  : 'Bạn đã đạt 90% lượng calo hàng ngày',
                                              notificationSound: 'default',
                                              userRefs: [currentUserReference!],
                                              initialPageName: 'homePage',
                                              parameterData: {},
                                            );
                                          }
                                        }
                                      }
                                    }
                                  }
                                }

                                setState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                '6vy9sv0a' /* Add to Log */,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
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
                                      color: Colors.white,
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
                          if (widget.customMeal != null)
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'MEAL_UNIT_SLIDER_ADD_TO_LOG_BTN_ON_TAP');
                                logFirebaseEvent('Button_backend_call');

                                final mealsCreateData = createMealsRecordData(
                                  name: functions
                                      .toUpperCase(widget.customMeal!.name),
                                  phosphorus: valueOrDefault<double>(
                                    functions.calculateNutrition(
                                        _model.sliderValue!,
                                        widget.customMeal!.qty,
                                        widget.customMeal!.phosphorus),
                                    0.0,
                                  ),
                                  protein: valueOrDefault<double>(
                                    functions.calculateNutrition(
                                        _model.sliderValue!,
                                        widget.customMeal!.qty,
                                        widget.customMeal!.protein),
                                    0.0,
                                  ),
                                  potassium: valueOrDefault<double>(
                                    functions.calculateNutrition(
                                        _model.sliderValue!,
                                        widget.customMeal!.qty,
                                        widget.customMeal!.potassium),
                                    0.0,
                                  ),
                                  sodium: valueOrDefault<double>(
                                    functions.calculateNutrition(
                                        _model.sliderValue!,
                                        widget.customMeal!.qty,
                                        widget.customMeal!.sodium),
                                    0.0,
                                  ),
                                  qty: _model.sliderValue,
                                  unit: widget.customMeal!.unit,
                                  createdAt: getCurrentTimestamp,
                                  userRef: currentUserReference,
                                  photo: widget.customMeal!.photo,
                                  fluid: valueOrDefault<double>(
                                    functions.calculateNutrition(
                                        _model.sliderValue!,
                                        widget.customMeal!.qty,
                                        widget.customMeal!.fluid),
                                    0.0,
                                  ),
                                  calories: functions.calculateNutrition(
                                      _model.sliderValue!,
                                      getJsonField(
                                        widget.meal,
                                        r'''$.foods[0].nf_calories''',
                                      ),
                                      double.parse((getJsonField(
                                                widget.meal,
                                                r'''$..full_nutrients[?(@.attr_id ==255)].value''',
                                              ) /
                                              1000)
                                          .toStringAsFixed(2))),
                                );
                                var mealsRecordReference =
                                    MealsRecord.collection.doc();
                                await mealsRecordReference.set(mealsCreateData);
                                _model.createdMeal2 =
                                    MealsRecord.getDocumentFromData(
                                        mealsCreateData, mealsRecordReference);
                                if ((_model.createdMeal2 != null) == true) {
                                  logFirebaseEvent(
                                      'Button_close_dialog,_drawer,_etc');
                                  Navigator.pop(context);
                                  logFirebaseEvent('Button_show_snack_bar');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Add to Log succesfully!',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 2000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                  if (valueOrDefault<bool>(
                                    (double totalPhosphorus, double target) {
                                      return (double.parse((totalPhosphorus *
                                                      100 /
                                                      target /
                                                      100)
                                                  .toStringAsFixed(2))) ==
                                              0.9
                                          ? true
                                          : false;
                                    }(
                                        functions.totalPhosphorus(
                                            containerMealsRecordList.toList()),
                                        containerNutrientRecord!.phosphorus),
                                    false,
                                  )) {
                                    logFirebaseEvent(
                                        'Button_trigger_push_notification');
                                    triggerPushNotification(
                                      notificationTitle:
                                          FFLocalizations.of(context)
                                                      .languageCode ==
                                                  'en'
                                              ? 'Nutrition intake reminder'
                                              : 'Ngưỡng dinh dưỡng',
                                      notificationText: FFLocalizations.of(
                                                      context)
                                                  .languageCode ==
                                              'en'
                                          ? 'You\'ve reached 90% of your daily nutrition goal for phosphorus. '
                                          : 'Bạn đã đạt 90% lượng phốt pho hàng ngày',
                                      notificationSound: 'default',
                                      userRefs: [currentUserReference!],
                                      initialPageName: 'homePage',
                                      parameterData: {},
                                    );
                                  } else {
                                    if (valueOrDefault<bool>(
                                      (double totalProtein, double target) {
                                        return (double.parse((totalProtein *
                                                        100 /
                                                        target /
                                                        100)
                                                    .toStringAsFixed(2))) ==
                                                0.9
                                            ? true
                                            : false;
                                      }(
                                          functions.totalProtein(
                                              containerMealsRecordList
                                                  .toList()),
                                          containerNutrientRecord!.protein),
                                      false,
                                    )) {
                                      logFirebaseEvent(
                                          'Button_trigger_push_notification');
                                      triggerPushNotification(
                                        notificationTitle:
                                            FFLocalizations.of(context)
                                                        .languageCode ==
                                                    'en'
                                                ? 'Nutrition intake reminder'
                                                : 'Ngưỡng dinh dưỡng',
                                        notificationText: FFLocalizations.of(
                                                        context)
                                                    .languageCode ==
                                                'en'
                                            ? 'You\'ve reached 90% of your daily nutrition goal for protein.'
                                            : 'Bạn đã đạt 90% lượng chất đạm hàng ngày',
                                        notificationSound: 'default',
                                        userRefs: [currentUserReference!],
                                        initialPageName: 'homePage',
                                        parameterData: {},
                                      );
                                    } else {
                                      if (valueOrDefault<bool>(
                                        (double totalPotassium, double target) {
                                          return (double.parse((totalPotassium *
                                                          100 /
                                                          target /
                                                          100)
                                                      .toStringAsFixed(2))) ==
                                                  0.9
                                              ? true
                                              : false;
                                        }(
                                            functions.totalPotassium(
                                                containerMealsRecordList
                                                    .toList()),
                                            containerNutrientRecord!.potassium),
                                        false,
                                      )) {
                                        logFirebaseEvent(
                                            'Button_trigger_push_notification');
                                        triggerPushNotification(
                                          notificationTitle:
                                              FFLocalizations.of(context)
                                                          .languageCode ==
                                                      'en'
                                                  ? 'Nutrition intake reminder'
                                                  : 'Ngưỡng dinh dưỡng',
                                          notificationText: FFLocalizations.of(
                                                          context)
                                                      .languageCode ==
                                                  'en'
                                              ? 'You\'ve reached 90% of your daily nutrition goal for potassium.'
                                              : 'Bạn đã đạt 90% lượng kali hàng ngày',
                                          notificationSound: 'default',
                                          userRefs: [currentUserReference!],
                                          initialPageName: 'homePage',
                                          parameterData: {},
                                        );
                                      } else {
                                        if (valueOrDefault<bool>(
                                          (double totalSodium, double target) {
                                            return (double.parse((totalSodium *
                                                            100 /
                                                            target /
                                                            100)
                                                        .toStringAsFixed(2))) ==
                                                    0.9
                                                ? true
                                                : false;
                                          }(
                                              functions.totalSodium(
                                                  containerMealsRecordList
                                                      .toList()),
                                              containerNutrientRecord!.sodium),
                                          false,
                                        )) {
                                          logFirebaseEvent(
                                              'Button_trigger_push_notification');
                                          triggerPushNotification(
                                            notificationTitle: FFLocalizations
                                                            .of(context)
                                                        .languageCode ==
                                                    'en'
                                                ? 'Nutrition intake reminder'
                                                : 'Ngưỡng dinh dưỡng',
                                            notificationText: FFLocalizations
                                                            .of(context)
                                                        .languageCode ==
                                                    'en'
                                                ? 'You\'ve reached 90% of your daily nutrition goal for sodium.'
                                                : 'Bạn đã đạt 90% lượng natri hàng ngày',
                                            notificationSound: 'default',
                                            userRefs: [currentUserReference!],
                                            initialPageName: 'homePage',
                                            parameterData: {},
                                          );
                                        }
                                      }
                                    }
                                  }
                                }

                                setState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                '7l79v1qu' /* Add to Log */,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
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
                                      color: Colors.white,
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
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
