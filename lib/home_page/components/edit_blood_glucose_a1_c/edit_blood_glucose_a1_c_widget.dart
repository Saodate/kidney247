import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_blood_glucose_a1_c_model.dart';
export 'edit_blood_glucose_a1_c_model.dart';

class EditBloodGlucoseA1CWidget extends StatefulWidget {
  const EditBloodGlucoseA1CWidget({Key? key}) : super(key: key);

  @override
  _EditBloodGlucoseA1CWidgetState createState() =>
      _EditBloodGlucoseA1CWidgetState();
}

class _EditBloodGlucoseA1CWidgetState extends State<EditBloodGlucoseA1CWidget> {
  late EditBloodGlucoseA1CModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditBloodGlucoseA1CModel());

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

    return Container(
      width: double.infinity,
      height: 350.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
        child: StreamBuilder<LabtestResultsRecord>(
          stream: LabtestResultsRecord.getDocument(FFAppState().editLabTest!),
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
            final cardLabtestResultsRecord = snapshot.data!;
            return Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              elevation: 0.0,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'wz3spkdd' /* What was your Blood Glucose A1... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Be Vietnam Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 16.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                        ],
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
                              .bodyMedium
                              .override(
                                fontFamily: 'Be Vietnam Pro',
                                color: Color(0xFF5549D3),
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'ntgx9kmq' /* % */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Be Vietnam Pro',
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Slider(
                            activeColor: FlutterFlowTheme.of(context).primary,
                            inactiveColor:
                                FlutterFlowTheme.of(context).primaryText,
                            min: 0.0,
                            max: 10.0,
                            value: _model.sliderValue ??=
                                cardLabtestResultsRecord.bloodGlucose,
                            label: _model.sliderValue.toString(),
                            divisions: 100,
                            onChanged: (newValue) {
                              newValue =
                                  double.parse(newValue.toStringAsFixed(4));
                              setState(() => _model.sliderValue = newValue);
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'EDIT_BLOOD_GLUCOSE_A1_C_Icon_medrb55y_ON');
                            logFirebaseEvent('Icon_date_time_picker');
                            final _datePickedDate = await showDatePicker(
                              context: context,
                              initialDate:
                                  cardLabtestResultsRecord.bloodGlucoseTime!,
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2050),
                            );

                            if (_datePickedDate != null) {
                              setState(() {
                                _model.datePicked = DateTime(
                                  _datePickedDate.year,
                                  _datePickedDate.month,
                                  _datePickedDate.day,
                                );
                              });
                            }
                          },
                          child: FaIcon(
                            FontAwesomeIcons.calendarPlus,
                            color: Color(0xFF5549D3),
                            size: 30.0,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 0.0, 0.0, 0.0),
                            child: Text(
                              dateTimeFormat(
                                        'd/M/y',
                                        _model.datePicked,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ) ==
                                      ''
                                  ? dateTimeFormat(
                                      'd/M/y',
                                      cardLabtestResultsRecord
                                          .bloodGlucoseTime!,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )
                                  : dateTimeFormat(
                                      'd/M/y',
                                      _model.datePicked,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Be Vietnam Pro',
                                    fontSize: 16.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'EDIT_BLOOD_GLUCOSE_A1_C_SAVE_CHANGES_BTN');
                        logFirebaseEvent('Button_backend_call');

                        final labtestResultsUpdateData =
                            createLabtestResultsRecordData(
                          bloodGlucoseTime: _model.datePicked,
                          bloodGlucose: _model.sliderValue,
                        );
                        await cardLabtestResultsRecord.reference
                            .update(labtestResultsUpdateData);
                        logFirebaseEvent('Button_show_snack_bar');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              FFLocalizations.of(context).languageCode == 'en'
                                  ? 'Update Successfully!'
                                  : 'Chỉnh sửa thành công!',
                              style: GoogleFonts.getFont(
                                'Be Vietnam Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 2000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                        logFirebaseEvent('Button_close_dialog,_drawer,_etc');
                        Navigator.pop(context);
                      },
                      text: FFLocalizations.of(context).getText(
                        'dl2jeap1' /* Save changes */,
                      ),
                      options: FFButtonOptions(
                        width: 130.0,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Be Vietnam Pro',
                                  color: Colors.white,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
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
      ),
    );
  }
}
