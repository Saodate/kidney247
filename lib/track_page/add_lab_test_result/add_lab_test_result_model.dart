import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddLabTestResultModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for Switch widget.
  bool? switchValue3;
  // State field(s) for Switch widget.
  bool? switchValue4;
  // State field(s) for Slider widget.
  double? sliderValue1;
  DateTime? datePicked1;
  // State field(s) for Slider widget.
  double? sliderValue2;
  DateTime? datePicked2;
  // State field(s) for Slider widget.
  double? sliderValue3;
  DateTime? datePicked3;
  // State field(s) for Slider widget.
  double? sliderValue4;
  DateTime? datePicked4;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  LabtestResultsRecord? created;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
