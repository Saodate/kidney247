import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home_page/components/edit_appointment/edit_appointment_widget.dart';
import '/home_page/components/empty_appointment/empty_appointment_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpcomingAppointmentModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for emptyAppointment component.
  late EmptyAppointmentModel emptyAppointmentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emptyAppointmentModel = createModel(context, () => EmptyAppointmentModel());
  }

  void dispose() {
    emptyAppointmentModel.dispose();
  }

  /// Additional helper methods are added here.

}
