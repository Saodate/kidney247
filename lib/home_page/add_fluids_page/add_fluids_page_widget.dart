import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_page/components/empty_list/empty_list_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'add_fluids_page_model.dart';
export 'add_fluids_page_model.dart';

class AddFluidsPageWidget extends StatefulWidget {
  const AddFluidsPageWidget({Key? key}) : super(key: key);

  @override
  _AddFluidsPageWidgetState createState() => _AddFluidsPageWidgetState();
}

class _AddFluidsPageWidgetState extends State<AddFluidsPageWidget> {
  late AddFluidsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddFluidsPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'addFluidsPage'});
    _model.textController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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

    return StreamBuilder<List<FluidsRecord>>(
      stream: queryFluidsRecord(
        queryBuilder: (fluidsRecord) =>
            fluidsRecord.where('user_ref', isEqualTo: currentUserReference),
      ),
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
        List<FluidsRecord> addFluidsPageFluidsRecordList = snapshot.data!;
        return Title(
            title: 'Kidney247',
            color: FlutterFlowTheme.of(context).primary,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                appBar: AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  automaticallyImplyLeading: false,
                  leading: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 25.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'ADD_FLUIDS_arrow_back_ios_rounded_ICN_ON');
                      logFirebaseEvent('IconButton_navigate_back');
                      context.pop();
                    },
                  ),
                  actions: [],
                  centerTitle: false,
                  elevation: 0.0,
                ),
                body: SafeArea(
                  top: true,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'zee6ep5q' /* Add Today's Fluids */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Be Vietnam Pro',
                                            fontSize: 22.0,
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
                            Container(
                              width: 30.0,
                              height: 30.0,
                              child: custom_widgets.TooltipWidget(
                                width: 30.0,
                                height: 30.0,
                                message: FFLocalizations.of(context).getText(
                                  'm2f5rto8' /* This is tooltip! */,
                                ),
                                icon: Icon(
                                  Icons.info_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 23.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Lottie.network(
                            'https://assets10.lottiefiles.com/packages/lf20_fjwc7dtd.json',
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: 130.0,
                            fit: BoxFit.contain,
                            animate: true,
                          ),
                        ),
                        Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: TextFormField(
                                controller: _model.textController,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: FFLocalizations.of(context).getText(
                                    '1ihedm3g' /* i.e. 250 ml */,
                                  ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Be Vietnam Pro',
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor:
                                      FlutterFlowTheme.of(context).accent4,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Be Vietnam Pro',
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                textAlign: TextAlign.center,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        signed: true, decimal: true),
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                        StreamBuilder<List<MealsRecord>>(
                          stream: queryMealsRecord(
                            queryBuilder: (mealsRecord) => mealsRecord.where(
                                'user_ref',
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
                                    color: FlutterFlowTheme.of(context).teal,
                                    size: 40.0,
                                  ),
                                ),
                              );
                            }
                            List<MealsRecord> containerMealsRecordList =
                                snapshot.data!;
                            return Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 20.0),
                                child: StreamBuilder<List<NutrientRecord>>(
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
                                            color: FlutterFlowTheme.of(context)
                                                .teal,
                                            size: 40.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<NutrientRecord>
                                        buttonNutrientRecordList =
                                        snapshot.data!;
                                    final buttonNutrientRecord =
                                        buttonNutrientRecordList.isNotEmpty
                                            ? buttonNutrientRecordList.first
                                            : null;
                                    return FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'ADD_FLUIDS_CLICK_TO_ADD_FLUID_BTN_ON_TAP');
                                        logFirebaseEvent(
                                            'Button_validate_form');
                                        if (_model.formKey.currentState ==
                                                null ||
                                            !_model.formKey.currentState!
                                                .validate()) {
                                          return;
                                        }
                                        logFirebaseEvent('Button_backend_call');

                                        final fluidsCreateData =
                                            createFluidsRecordData(
                                          createdAt: getCurrentTimestamp,
                                          userRef: currentUserReference,
                                          amount: double.parse((int.parse(_model
                                                      .textController.text) /
                                                  1000)
                                              .toStringAsFixed(2)),
                                        );
                                        await FluidsRecord.collection
                                            .doc()
                                            .set(fluidsCreateData);
                                        if (valueOrDefault<bool>(
                                          (double totalFluid, double target) {
                                            return (double.parse((totalFluid *
                                                            100 /
                                                            target /
                                                            100)
                                                        .toStringAsFixed(2))) ==
                                                    0.9
                                                ? true
                                                : false;
                                          }(
                                              functions.totalFluid(
                                                  addFluidsPageFluidsRecordList
                                                      .toList(),
                                                  containerMealsRecordList
                                                      .toList()),
                                              buttonNutrientRecord!
                                                  .fluidIntake),
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
                                                ? 'You\'ve reached 90% of your daily nutrition goal for fluid. '
                                                : 'Bạn đã đạt 90% lượng nước hàng ngày',
                                            notificationSound: 'default',
                                            userRefs: [currentUserReference!],
                                            initialPageName: 'homePage',
                                            parameterData: {},
                                          );
                                        }
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'rhx2fwex' /* Click to add fluid */,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Be Vietnam Pro',
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
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                        Divider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).lineColor,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'rn8uyceu' /* Today's fluid so far */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Be Vietnam Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 22.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .headlineMediumFamily),
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: StreamBuilder<List<FluidsRecord>>(
                            stream: queryFluidsRecord(
                              queryBuilder: (fluidsRecord) =>
                                  fluidsRecord.where('user_ref',
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
                                      color: FlutterFlowTheme.of(context).teal,
                                      size: 40.0,
                                    ),
                                  ),
                                );
                              }
                              List<FluidsRecord> containerFluidsRecordList =
                                  snapshot.data!;
                              return Container(
                                width: double.infinity,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                child: Builder(
                                  builder: (context) {
                                    final todayFluid = functions
                                        .filterTodayFluids(
                                            containerFluidsRecordList.toList())
                                        .toList();
                                    if (todayFluid.isEmpty) {
                                      return Center(
                                        child: EmptyListWidget(
                                          name: FFLocalizations.of(context)
                                              .getText(
                                            'l32zernm' /* Seems you don’t have any fluid */,
                                          ),
                                          isDesc: false,
                                        ),
                                      );
                                    }
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: todayFluid.length,
                                      itemBuilder: (context, todayFluidIndex) {
                                        final todayFluidItem =
                                            todayFluid[todayFluidIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                20.0, 0.0),
                                                    child: Icon(
                                                      Icons.check_circle,
                                                      color: Color(0xFF007500),
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        dateTimeFormat(
                                                          'jm',
                                                          todayFluidItem
                                                              .createdAt!,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Be Vietnam Pro',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                      Text(
                                                        '${todayFluidItem.amount.toString()} l',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Be Vietnam Pro',
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                borderWidth: 1.0,
                                                buttonSize: 50.0,
                                                icon: Icon(
                                                  Icons.delete_outline_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'ADD_FLUIDS_delete_outline_rounded_ICN_ON');
                                                  logFirebaseEvent(
                                                      'IconButton_backend_call');
                                                  await todayFluidItem.reference
                                                      .delete();
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
