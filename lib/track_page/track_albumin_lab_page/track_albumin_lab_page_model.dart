import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/edit_albumin/edit_albumin_widget.dart';
import '/components/empty_tracking/empty_tracking_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TrackAlbuminLabPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for emptyTracking component.
  late EmptyTrackingModel emptyTrackingModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emptyTrackingModel = createModel(context, () => EmptyTrackingModel());
  }

  void dispose() {
    unfocusNode.dispose();
    emptyTrackingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
