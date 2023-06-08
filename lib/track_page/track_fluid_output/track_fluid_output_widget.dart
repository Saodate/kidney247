import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home_page/components/edit_fluid_output/edit_fluid_output_widget.dart';
import '/home_page/components/empty_tracking/empty_tracking_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'track_fluid_output_model.dart';
export 'track_fluid_output_model.dart';

class TrackFluidOutputWidget extends StatefulWidget {
  const TrackFluidOutputWidget({
    Key? key,
    this.pageTitle,
  }) : super(key: key);

  final String? pageTitle;

  @override
  _TrackFluidOutputWidgetState createState() => _TrackFluidOutputWidgetState();
}

class _TrackFluidOutputWidgetState extends State<TrackFluidOutputWidget> {
  late TrackFluidOutputModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrackFluidOutputModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'trackFluidOutput'});
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

    return StreamBuilder<List<VitalsResultRecord>>(
      stream: queryVitalsResultRecord(
        queryBuilder: (vitalsResultRecord) => vitalsResultRecord
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
        List<VitalsResultRecord> trackFluidOutputVitalsResultRecordList =
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
                          'TRACK_FLUID_OUTPUT_arrow_back_ios_rounde');
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
                      if (trackFluidOutputVitalsResultRecordList
                              .where((e) => e.fluidOutput != 0.0)
                              .toList()
                              .length ==
                          0)
                        wrapWithModel(
                          model: _model.emptyTrackingModel,
                          updateCallback: () => setState(() {}),
                          child: EmptyTrackingWidget(
                            route: 'vital',
                          ),
                        ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: custom_widgets.StickyGroupedFluidOutput(
                            width: double.infinity,
                            height: double.infinity,
                            dateColor: FlutterFlowTheme.of(context).primary,
                            textColor: FlutterFlowTheme.of(context).primaryText,
                            primaryColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            emptyString: FFLocalizations.of(context).getText(
                              'oi5bos2a' /* Seem like you don't have any f... */,
                            ),
                            dateBorderColor:
                                FlutterFlowTheme.of(context).primary,
                            listVitals: trackFluidOutputVitalsResultRecordList,
                            editVital: () async {
                              logFirebaseEvent(
                                  'TRACK_FLUID_OUTPUT_Container_m44i4dob_CA');
                              logFirebaseEvent(
                                  'StickyGroupedFluidOutput_bottom_sheet');
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
                                      child: EditFluidOutputWidget(),
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
