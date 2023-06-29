import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'apple_model.dart';
export 'apple_model.dart';

class AppleWidget extends StatefulWidget {
  const AppleWidget({Key? key}) : super(key: key);

  @override
  _AppleWidgetState createState() => _AppleWidgetState();
}

class _AppleWidgetState extends State<AppleWidget> {
  late AppleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppleModel());

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

    return FFButtonWidget(
      onPressed: () {
        print('Button pressed ...');
      },
      text: FFLocalizations.of(context).getText(
        'dagu4yqt' /* Sign in with Apple */,
      ),
      icon: FaIcon(
        FontAwesomeIcons.apple,
        size: 20.0,
      ),
      options: FFButtonOptions(
        width: 230.0,
        height: 44.0,
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 1.0),
        color: Colors.white,
        textStyle: GoogleFonts.getFont(
          'Roboto',
          color: Colors.black,
          fontSize: 17.0,
        ),
        elevation: 4.0,
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 0.0,
        ),
      ),
    );
  }
}
