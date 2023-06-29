import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/book_appointment/book_appointment_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_list_home_page_model.dart';
export 'empty_list_home_page_model.dart';

class EmptyListHomePageWidget extends StatefulWidget {
  const EmptyListHomePageWidget({
    Key? key,
    this.name,
    required this.buttonTitle,
    required this.goTo,
  }) : super(key: key);

  final String? name;
  final String? buttonTitle;
  final String? goTo;

  @override
  _EmptyListHomePageWidgetState createState() =>
      _EmptyListHomePageWidgetState();
}

class _EmptyListHomePageWidgetState extends State<EmptyListHomePageWidget> {
  late EmptyListHomePageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListHomePageModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Theme.of(context).brightness == Brightness.dark
              ? 'assets/images/Kidney_247-dark_theme.svg'
              : 'assets/images/Kidney_247_SVG.svg',
          width: 100.0,
          height: 100.0,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  widget.name!,
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Be Vietnam Pro',
                        fontSize: 16.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).headlineSmallFamily),
                      ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
          child: StreamBuilder<List<DoctorsRecord>>(
            stream: queryDoctorsRecord(
              queryBuilder: (doctorsRecord) => doctorsRecord.where('user_ref',
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
              List<DoctorsRecord> buttonDoctorsRecordList = snapshot.data!;
              return FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('EMPTY_LIST_HOME_BUTTON_BTN_ON_TAP');
                  if (widget.goTo == 'medicine') {
                    logFirebaseEvent('Button_navigate_to');

                    context.pushNamed('addMedication');
                  } else if (widget.goTo == 'appointment') {
                    if (buttonDoctorsRecordList.length == 0) {
                      logFirebaseEvent('Button_alert_dialog');
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('❕'),
                                content: Text(FFLocalizations.of(context)
                                            .languageCode ==
                                        'en'
                                    ? 'You have to add a doctor before add an appointment!'
                                    : 'Bạn phải thêm một bác sĩ trước khi thêm lịch khám!'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: Text(FFLocalizations.of(context)
                                                .languageCode ==
                                            'en'
                                        ? 'Cancel'
                                        : 'Hủy'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: Text(FFLocalizations.of(context)
                                                .languageCode ==
                                            'en'
                                        ? 'Add a doctor'
                                        : 'Thêm bác sĩ'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      if (confirmDialogResponse) {
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed(
                          'addCareTeam',
                          queryParameters: {
                            'isCompleteProfile': serializeParam(
                              false,
                              ParamType.bool,
                            ),
                            'fromHomePage': serializeParam(
                              true,
                              ParamType.bool,
                            ),
                          }.withoutNulls,
                        );
                      } else {
                        logFirebaseEvent('Button_close_dialog,_drawer,_etc');
                        Navigator.pop(context);
                      }
                    } else {
                      logFirebaseEvent('Button_bottom_sheet');
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
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
                  } else {
                    logFirebaseEvent('Button_navigate_to');

                    context.pushNamed('addLabTestResult');
                  }
                },
                text: widget.buttonTitle!,
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Be Vietnam Pro',
                        color: Colors.white,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).titleSmallFamily),
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
