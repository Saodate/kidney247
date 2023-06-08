import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SetTargetPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for phosphorusRecom widget.
  TextEditingController? phosphorusRecomController;
  String? Function(BuildContext, String?)? phosphorusRecomControllerValidator;
  // State field(s) for phosphorusText widget.
  TextEditingController? phosphorusTextController;
  String? Function(BuildContext, String?)? phosphorusTextControllerValidator;
  // State field(s) for proteinRecom widget.
  TextEditingController? proteinRecomController;
  String? Function(BuildContext, String?)? proteinRecomControllerValidator;
  // State field(s) for proteinText widget.
  TextEditingController? proteinTextController;
  String? Function(BuildContext, String?)? proteinTextControllerValidator;
  // State field(s) for caloriesRecom widget.
  TextEditingController? caloriesRecomController;
  String? Function(BuildContext, String?)? caloriesRecomControllerValidator;
  // State field(s) for caloriesText widget.
  TextEditingController? caloriesTextController;
  String? Function(BuildContext, String?)? caloriesTextControllerValidator;
  // State field(s) for potassiumRecom widget.
  TextEditingController? potassiumRecomController;
  String? Function(BuildContext, String?)? potassiumRecomControllerValidator;
  // State field(s) for potassiumText widget.
  TextEditingController? potassiumTextController;
  String? Function(BuildContext, String?)? potassiumTextControllerValidator;
  // State field(s) for sodiumRecom widget.
  TextEditingController? sodiumRecomController;
  String? Function(BuildContext, String?)? sodiumRecomControllerValidator;
  // State field(s) for sodiumText widget.
  TextEditingController? sodiumTextController;
  String? Function(BuildContext, String?)? sodiumTextControllerValidator;
  // State field(s) for fluidIntakeRecom widget.
  TextEditingController? fluidIntakeRecomController;
  String? Function(BuildContext, String?)? fluidIntakeRecomControllerValidator;
  // State field(s) for fluidIntakeText widget.
  TextEditingController? fluidIntakeTextController;
  String? Function(BuildContext, String?)? fluidIntakeTextControllerValidator;
  // State field(s) for bloodPressureFromRecom widget.
  TextEditingController? bloodPressureFromRecomController;
  String? Function(BuildContext, String?)?
      bloodPressureFromRecomControllerValidator;
  // State field(s) for bloodPressureFromText widget.
  TextEditingController? bloodPressureFromTextController;
  String? Function(BuildContext, String?)?
      bloodPressureFromTextControllerValidator;
  // State field(s) for bloodPressureToRecom widget.
  TextEditingController? bloodPressureToRecomController;
  String? Function(BuildContext, String?)?
      bloodPressureToRecomControllerValidator;
  // State field(s) for bloodPressureToText widget.
  TextEditingController? bloodPressureToTextController;
  String? Function(BuildContext, String?)?
      bloodPressureToTextControllerValidator;
  // State field(s) for bloodGlucoseRecom widget.
  TextEditingController? bloodGlucoseRecomController;
  String? Function(BuildContext, String?)? bloodGlucoseRecomControllerValidator;
  // State field(s) for bloodGlucoseText widget.
  TextEditingController? bloodGlucoseTextController;
  String? Function(BuildContext, String?)? bloodGlucoseTextControllerValidator;
  // State field(s) for fluidOutputRecom widget.
  TextEditingController? fluidOutputRecomController;
  String? Function(BuildContext, String?)? fluidOutputRecomControllerValidator;
  // State field(s) for fluidOutputText widget.
  TextEditingController? fluidOutputTextController;
  String? Function(BuildContext, String?)? fluidOutputTextControllerValidator;
  // State field(s) for bloodGlucoseA1CRecom widget.
  TextEditingController? bloodGlucoseA1CRecomController;
  String? Function(BuildContext, String?)?
      bloodGlucoseA1CRecomControllerValidator;
  // State field(s) for bloodGlucoseA1CText widget.
  TextEditingController? bloodGlucoseA1CTextController;
  String? Function(BuildContext, String?)?
      bloodGlucoseA1CTextControllerValidator;
  // State field(s) for eGFRTextRecom widget.
  TextEditingController? eGFRTextRecomController;
  String? Function(BuildContext, String?)? eGFRTextRecomControllerValidator;
  // State field(s) for eGFRText widget.
  TextEditingController? eGFRTextController;
  String? Function(BuildContext, String?)? eGFRTextControllerValidator;
  // State field(s) for albuminRecom widget.
  TextEditingController? albuminRecomController;
  String? Function(BuildContext, String?)? albuminRecomControllerValidator;
  // State field(s) for albuminText widget.
  TextEditingController? albuminTextController;
  String? Function(BuildContext, String?)? albuminTextControllerValidator;
  // State field(s) for bloodUNRecom widget.
  TextEditingController? bloodUNRecomController;
  String? Function(BuildContext, String?)? bloodUNRecomControllerValidator;
  // State field(s) for bloodUNText widget.
  TextEditingController? bloodUNTextController;
  String? Function(BuildContext, String?)? bloodUNTextControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    phosphorusRecomController?.dispose();
    phosphorusTextController?.dispose();
    proteinRecomController?.dispose();
    proteinTextController?.dispose();
    caloriesRecomController?.dispose();
    caloriesTextController?.dispose();
    potassiumRecomController?.dispose();
    potassiumTextController?.dispose();
    sodiumRecomController?.dispose();
    sodiumTextController?.dispose();
    fluidIntakeRecomController?.dispose();
    fluidIntakeTextController?.dispose();
    bloodPressureFromRecomController?.dispose();
    bloodPressureFromTextController?.dispose();
    bloodPressureToRecomController?.dispose();
    bloodPressureToTextController?.dispose();
    bloodGlucoseRecomController?.dispose();
    bloodGlucoseTextController?.dispose();
    fluidOutputRecomController?.dispose();
    fluidOutputTextController?.dispose();
    bloodGlucoseA1CRecomController?.dispose();
    bloodGlucoseA1CTextController?.dispose();
    eGFRTextRecomController?.dispose();
    eGFRTextController?.dispose();
    albuminRecomController?.dispose();
    albuminTextController?.dispose();
    bloodUNRecomController?.dispose();
    bloodUNTextController?.dispose();
  }

  /// Additional helper methods are added here.

}
