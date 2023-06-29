import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/edit_appointment/edit_appointment_widget.dart';
import '/components/empty_appointment/empty_appointment_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'upcoming_appointment_model.dart';
export 'upcoming_appointment_model.dart';

class UpcomingAppointmentWidget extends StatefulWidget {
  const UpcomingAppointmentWidget({
    Key? key,
    this.pageTitle,
  }) : super(key: key);

  final String? pageTitle;

  @override
  _UpcomingAppointmentWidgetState createState() =>
      _UpcomingAppointmentWidgetState();
}

class _UpcomingAppointmentWidgetState extends State<UpcomingAppointmentWidget> {
  late UpcomingAppointmentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpcomingAppointmentModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'upcomingAppointment'});
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

    return StreamBuilder<List<AppointmentsRecord>>(
      stream: queryAppointmentsRecord(
        queryBuilder: (appointmentsRecord) => appointmentsRecord
            .where('user_ref', isEqualTo: currentUserReference),
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
        List<AppointmentsRecord> upcomingAppointmentAppointmentsRecordList =
            snapshot.data!;
        return Title(
            title: 'Kidney247',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () =>
                  FocusScope.of(context).requestFocus(_model.unfocusNode),
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
                      size: 20.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'UPCOMING_APPOINTMENT_arrow_back_ios_roun');
                      logFirebaseEvent('IconButton_navigate_back');
                      context.pop();
                    },
                  ),
                  title: Text(
                    widget.pageTitle!,
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Be Vietnam Pro',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 22.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context)
                                  .headlineMediumFamily),
                        ),
                  ),
                  actions: [],
                  centerTitle: false,
                  elevation: 0.0,
                ),
                body: SafeArea(
                  top: true,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (upcomingAppointmentAppointmentsRecordList.length == 0)
                        wrapWithModel(
                          model: _model.emptyAppointmentModel,
                          updateCallback: () => setState(() {}),
                          child: EmptyAppointmentWidget(),
                        ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: custom_widgets.StickyGroupedAppointment(
                            width: double.infinity,
                            height: double.infinity,
                            dateColor: FlutterFlowTheme.of(context).primary,
                            textColor: FlutterFlowTheme.of(context).primaryText,
                            primaryColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            dateBorderColor:
                                FlutterFlowTheme.of(context).primary,
                            listAppointment:
                                upcomingAppointmentAppointmentsRecordList,
                            language: FFLocalizations.of(context).languageCode,
                            editAppointment: () async {
                              logFirebaseEvent(
                                  'UPCOMING_APPOINTMENT_Container_s1alflrz_');
                              logFirebaseEvent(
                                  'StickyGroupedAppointment_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => FocusScope.of(context)
                                        .requestFocus(_model.unfocusNode),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: Container(
                                        height: 710.0,
                                        child: EditAppointmentWidget(
                                          appointmentRef:
                                              FFAppState().appointmentRef,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                            deleteAppointment: () async {
                              logFirebaseEvent(
                                  'UPCOMING_APPOINTMENT_Container_s1alflrz_');
                              logFirebaseEvent(
                                  'StickyGroupedAppointment_backend_call');
                              await FFAppState().appointmentRef!.delete();
                            },
                          ),
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
