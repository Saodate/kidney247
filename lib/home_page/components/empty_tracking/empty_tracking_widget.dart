import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_tracking_model.dart';
export 'empty_tracking_model.dart';

class EmptyTrackingWidget extends StatefulWidget {
  const EmptyTrackingWidget({
    Key? key,
    this.route,
  }) : super(key: key);

  final String? route;

  @override
  _EmptyTrackingWidgetState createState() => _EmptyTrackingWidgetState();
}

class _EmptyTrackingWidgetState extends State<EmptyTrackingWidget> {
  late EmptyTrackingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyTrackingModel());

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
      decoration: BoxDecoration(
        color: Color(0x00FFFFFF),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            FFLocalizations.of(context).getText(
              'lh0aukf2' /* No tracking history */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Be Vietnam Pro',
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyMediumFamily),
                ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('EMPTY_TRACKING_START_TRACKING_BTN_ON_TAP');
                if (widget.route == 'meal') {
                  logFirebaseEvent('Button_navigate_to');

                  context.pushNamed('logMealPage');
                } else {
                  if (widget.route == 'fluid') {
                    logFirebaseEvent('Button_navigate_to');

                    context.pushNamed('addFluidsPage');
                  } else {
                    if (widget.route == 'vital') {
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed('addVitalEntry');
                    } else {
                      if (widget.route == 'medication') {
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed('addMedication');
                      } else {
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed('addLabTestResult');
                      }
                    }
                  }
                }
              },
              text: FFLocalizations.of(context).getText(
                'pjem2lec' /* Start tracking */,
              ),
              options: FFButtonOptions(
                width: 130.0,
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Be Vietnam Pro',
                      color: Colors.white,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).titleSmallFamily),
                    ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
