import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home_page/components/edit_blood_pressure/edit_blood_pressure_widget.dart';
import '/home_page/components/empty_tracking/empty_tracking_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TrackBloodPressurePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for emptyTracking component.
  late EmptyTrackingModel emptyTrackingModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emptyTrackingModel = createModel(context, () => EmptyTrackingModel());
  }

  void dispose() {
    emptyTrackingModel.dispose();
  }

  /// Additional helper methods are added here.

}
