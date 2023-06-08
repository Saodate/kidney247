import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home_page/components/edit_g_f_r/edit_g_f_r_widget.dart';
import '/home_page/components/empty_tracking/empty_tracking_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'track_g_r_f_page_model.dart';
export 'track_g_r_f_page_model.dart';

class TrackGRFPageWidget extends StatefulWidget {
  const TrackGRFPageWidget({
    Key? key,
    this.pageTitle,
  }) : super(key: key);

  final String? pageTitle;

  @override
  _TrackGRFPageWidgetState createState() => _TrackGRFPageWidgetState();
}

class _TrackGRFPageWidgetState extends State<TrackGRFPageWidget> {
  late TrackGRFPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrackGRFPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'trackGRFPage'});
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
        List<LabtestResultsRecord> trackGRFPageLabtestResultsRecordList =
            snapshot.data!;
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
                      size: 20.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'TRACK_G_R_F_arrow_back_ios_rounded_ICN_O');
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
                      if (trackGRFPageLabtestResultsRecordList
                              .where((e) => e.gfr != 0.0)
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
                          child: custom_widgets.StickyGroupedGFR(
                            width: double.infinity,
                            height: double.infinity,
                            dateColor: FlutterFlowTheme.of(context).primary,
                            textColor: FlutterFlowTheme.of(context).primaryText,
                            primaryColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            emptyString: FFLocalizations.of(context).getText(
                              '3ps5qymm' /* Seem like you don't have any G... */,
                            ),
                            dateBorderColor:
                                FlutterFlowTheme.of(context).primary,
                            listLabtest: trackGRFPageLabtestResultsRecordList,
                            editLabTest: () async {
                              logFirebaseEvent(
                                  'TRACK_G_R_F_Container_ta22t930_CALLBACK');
                              logFirebaseEvent('StickyGroupedGFR_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => FocusScope.of(context)
                                        .requestFocus(_unfocusNode),
                                    child: Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: EditGFRWidget(),
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
