import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'blank_meal_model.dart';
export 'blank_meal_model.dart';

class BlankMealWidget extends StatefulWidget {
  const BlankMealWidget({
    Key? key,
    this.statusCode,
  }) : super(key: key);

  final int? statusCode;

  @override
  _BlankMealWidgetState createState() => _BlankMealWidgetState();
}

class _BlankMealWidgetState extends State<BlankMealWidget> {
  late BlankMealModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlankMealModel());

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
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
          child: Icon(
            Icons.fastfood_outlined,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 60.0,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (widget.statusCode == 200)
              Text(
                FFLocalizations.of(context).getText(
                  'li1350d5' /* Search above to find foods to ... */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Be Vietnam Pro',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            if (widget.statusCode == 404)
              Text(
                FFLocalizations.of(context).getText(
                  '8e3w9sb2' /* We couldn't match any of your ... */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Be Vietnam Pro',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
          ],
        ),
        if (widget.statusCode == 200)
          Text(
            FFLocalizations.of(context).getText(
              'i16rpeek' /* The search function has been d... */,
            ),
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Be Vietnam Pro',
                  color: FlutterFlowTheme.of(context).tertiary,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyMediumFamily),
                ),
          ),
      ],
    );
  }
}
