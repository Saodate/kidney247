import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home_page/components/book_appointment/book_appointment_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'care_page_model.dart';
export 'care_page_model.dart';

class CarePageWidget extends StatefulWidget {
  const CarePageWidget({Key? key}) : super(key: key);

  @override
  _CarePageWidgetState createState() => _CarePageWidgetState();
}

class _CarePageWidgetState extends State<CarePageWidget> {
  late CarePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'carePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CARE_PAGE_PAGE_carePage_ON_INIT_STATE');
      if (!loggedIn) {
        logFirebaseEvent('carePage_navigate_to');

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

    return Title(
        title: 'Kidney247',
        color: FlutterFlowTheme.of(context).primary,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 50.0, 20.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            '2jd6hlsf' /* Care 👨‍🔬 */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Be Vietnam Pro',
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .displaySmallFamily),
                              ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '3e1l9dv8' /* Expand each category below to ... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Be Vietnam Pro',
                                        fontSize: 16.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily),
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).lineColor,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 15.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 20.0, 0.0),
                                child: FaIcon(
                                  FontAwesomeIcons.pills,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 30.0,
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'n990j908' /* Medications */,
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
                            ],
                          ),
                          Container(
                            width: 24.0,
                            height: 24.0,
                            child: custom_widgets.TooltipWidget(
                              width: 24.0,
                              height: 24.0,
                              message: FFLocalizations.of(context).getText(
                                '18gethf3' /* This is tooltip! */,
                              ),
                              icon: Icon(
                                Icons.info_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'CARE_PAGE_PAGE_ListTile_s5ad2fjb_ON_TAP');
                          logFirebaseEvent('ListTile_navigate_to');

                          context.pushNamed(
                            'listMedicationRemind',
                            queryParameters: {
                              'pageTitle': serializeParam(
                                FFLocalizations.of(context).getText(
                                  'x853vyw8' /* Current Medication */,
                                ),
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.format_list_numbered_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          title: Text(
                            FFLocalizations.of(context).getText(
                              'yh3u8w1d' /* Current Medications */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Be Vietnam Pro',
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF303030),
                            size: 20.0,
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          dense: false,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'CARE_PAGE_PAGE_ListTile_u30bftq8_ON_TAP');
                            logFirebaseEvent('ListTile_navigate_to');

                            context.pushNamed('addMedication');
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.add_circle,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            title: Text(
                              FFLocalizations.of(context).getText(
                                'h1m0tn4q' /* Add a Medication */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Be Vietnam Pro',
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleMediumFamily),
                                  ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 20.0,
                            ),
                            tileColor: FlutterFlowTheme.of(context).primary,
                            dense: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).lineColor,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 15.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 20.0, 0.0),
                                child: FaIcon(
                                  FontAwesomeIcons.calendarAlt,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 30.0,
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'q2nwi88h' /* Appointments */,
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
                            ],
                          ),
                          Container(
                            width: 24.0,
                            height: 24.0,
                            child: custom_widgets.TooltipWidget(
                              width: 24.0,
                              height: 24.0,
                              message: FFLocalizations.of(context).getText(
                                'esvbgmxh' /* This is tooltip! */,
                              ),
                              icon: Icon(
                                Icons.info_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'CARE_PAGE_PAGE_ListTile_91p723b9_ON_TAP');
                          logFirebaseEvent('ListTile_navigate_to');

                          context.pushNamed(
                            'upcomingAppointment',
                            queryParameters: {
                              'pageTitle': serializeParam(
                                FFLocalizations.of(context).getText(
                                  'cerxdptm' /* Upcoming Appointment */,
                                ),
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.calendarWeek,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          title: Text(
                            FFLocalizations.of(context).getText(
                              '2yy63275' /* Upcoming Appointments */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Be Vietnam Pro',
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF303030),
                            size: 20.0,
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          dense: false,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: StreamBuilder<List<DoctorsRecord>>(
                          stream: queryDoctorsRecord(
                            queryBuilder: (doctorsRecord) =>
                                doctorsRecord.where('user_ref',
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
                            List<DoctorsRecord> listTileDoctorsRecordList =
                                snapshot.data!;
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'CARE_PAGE_PAGE_ListTile_2vbrmsh6_ON_TAP');
                                if (listTileDoctorsRecordList.length == 0) {
                                  logFirebaseEvent('ListTile_show_snack_bar');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                                    .languageCode ==
                                                'en'
                                            ? 'You have to add at least one doctor first in order to add an appointment'
                                            : 'Bạn phải thêm ít nhất một bác sĩ trước để có thể thêm một cuộc hẹn',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                } else {
                                  logFirebaseEvent('ListTile_bottom_sheet');
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: Container(
                                          height: 710.0,
                                          child: BookAppointmentWidget(
                                            isCompleteProfile: false,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                }
                              },
                              child: ListTile(
                                leading: Icon(
                                  Icons.add_circle,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                title: Text(
                                  FFLocalizations.of(context).getText(
                                    'a9noxkfo' /* Add an Appointments */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Be Vietnam Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily),
                                      ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  size: 20.0,
                                ),
                                tileColor: FlutterFlowTheme.of(context).primary,
                                dense: false,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).lineColor,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 15.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 20.0, 0.0),
                                child: Icon(
                                  Icons.people_outlined,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 30.0,
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'j2vvdlm6' /* Care Team */,
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
                            ],
                          ),
                          Container(
                            width: 24.0,
                            height: 24.0,
                            child: custom_widgets.TooltipWidget(
                              width: 24.0,
                              height: 24.0,
                              message: FFLocalizations.of(context).getText(
                                '0l8pib0q' /* This is tooltip! */,
                              ),
                              icon: Icon(
                                Icons.info_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'CARE_PAGE_PAGE_ListTile_5k783zfg_ON_TAP');
                          logFirebaseEvent('ListTile_navigate_to');

                          context.pushNamed('listCareTeam');
                        },
                        child: ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.handHoldingHeart,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          title: Text(
                            FFLocalizations.of(context).getText(
                              '32vmt1k7' /* Your Team Members */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Be Vietnam Pro',
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF303030),
                            size: 20.0,
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          dense: false,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'CARE_PAGE_PAGE_ListTile_nlwn8luo_ON_TAP');
                            logFirebaseEvent('ListTile_navigate_to');

                            context.pushNamed(
                              'addCareTeam',
                              queryParameters: {
                                'isCompleteProfile': serializeParam(
                                  false,
                                  ParamType.bool,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.add_circle,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            title: Text(
                              FFLocalizations.of(context).getText(
                                'c0tjk74w' /* Add a Member */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Be Vietnam Pro',
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleMediumFamily),
                                  ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 20.0,
                            ),
                            tileColor: FlutterFlowTheme.of(context).primary,
                            dense: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
