import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'post_option_icon_model.dart';
export 'post_option_icon_model.dart';

class PostOptionIconWidget extends StatefulWidget {
  const PostOptionIconWidget({Key? key}) : super(key: key);

  @override
  _PostOptionIconWidgetState createState() => _PostOptionIconWidgetState();
}

class _PostOptionIconWidgetState extends State<PostOptionIconWidget> {
  late PostOptionIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostOptionIconModel());

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

    return FaIcon(
      FontAwesomeIcons.ellipsisV,
      color: FlutterFlowTheme.of(context).primaryText,
      size: 16.0,
    );
  }
}
