import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/edit_blood_glucose_a1_c/edit_blood_glucose_a1_c_widget.dart';
import '/components/empty_tracking/empty_tracking_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'track_blood_glucose_a1_c_page_model.dart';
export 'track_blood_glucose_a1_c_page_model.dart';

class TrackBloodGlucoseA1CPageWidget extends StatefulWidget {
  const TrackBloodGlucoseA1CPageWidget({
    Key? key,
    this.pageTitle,
  }) : super(key: key);

  final String? pageTitle;

  @override
  _TrackBloodGlucoseA1CPageWidgetState createState() =>
      _TrackBloodGlucoseA1CPageWidgetState();
}

class _TrackBloodGlucoseA1CPageWidgetState
    extends State<TrackBloodGlucoseA1CPageWidget> {
  late TrackBloodGlucoseA1CPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrackBloodGlucoseA1CPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'trackBloodGlucoseA1CPage'});
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

    return StreamBuilder<List<LabtestResultsRecord>>(
      stream: queryLabtestResultsRecord(
        queryBuilder: (labtestResultsRecord) => labtestResultsRecord
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
        List<LabtestResultsRecord>
            trackBloodGlucoseA1CPageLabtestResultsRecordList = snapshot.data!;
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
                      Icons.arrow_back_outlined,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 20.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'TRACK_BLOOD_GLUCOSE_A1_C_arrow_back_outl');
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
                      if (trackBloodGlucoseA1CPageLabtestResultsRecordList
                              .where((e) => e.bloodGlucose != 0.0)
                              .toList()
                              .length ==
                          0)
                        wrapWithModel(
                          model: _model.emptyTrackingModel,
                          updateCallback: () => setState(() {}),
                          child: EmptyTrackingWidget(
                            route: 'labtest',
                          ),
                        ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: custom_widgets.StickyGroupedBloodGlucoseA1C(
                            width: double.infinity,
                            height: double.infinity,
                            dateColor: FlutterFlowTheme.of(context).primary,
                            textColor: FlutterFlowTheme.of(context).primaryText,
                            primaryColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            emptyString: FFLocalizations.of(context).getText(
                              '82odyxl6' /* Seem like you don't have any b... */,
                            ),
                            dateBorderColor:
                                FlutterFlowTheme.of(context).primary,
                            listLabTest:
                                trackBloodGlucoseA1CPageLabtestResultsRecordList,
                            editLabTest: () async {
                              logFirebaseEvent(
                                  'TRACK_BLOOD_GLUCOSE_A1_C_Container_1kq11');
                              logFirebaseEvent(
                                  'StickyGroupedBloodGlucoseA1C_bottom_shee');
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
                                      child: EditBloodGlucoseA1CWidget(),
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
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
