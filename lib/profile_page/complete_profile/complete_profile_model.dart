import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class CompleteProfileModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for yourName widget.
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  String? _yourNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'o202cs0d' /* * Field is required */,
      );
    }

    return null;
  }

  // State field(s) for height widget.
  TextEditingController? heightController;
  String? Function(BuildContext, String?)? heightControllerValidator;
  String? _heightControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ewrbinhs' /* * Field is required */,
      );
    }

    return null;
  }

  // State field(s) for weight widget.
  TextEditingController? weightController;
  String? Function(BuildContext, String?)? weightControllerValidator;
  String? _weightControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'zsvzcw58' /* * Field is required */,
      );
    }

    return null;
  }

  // State field(s) for yourAge widget.
  TextEditingController? yourAgeController;
  String? Function(BuildContext, String?)? yourAgeControllerValidator;
  // State field(s) for DropDownAge widget.
  String? dropDownAgeValue;
  FormFieldController<String>? dropDownAgeValueController;
  // State field(s) for creatinine widget.
  TextEditingController? creatinineController;
  String? Function(BuildContext, String?)? creatinineControllerValidator;
  String? _creatinineControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hhbkmz7r' /* * Field is required */,
      );
    }

    return null;
  }

  // State field(s) for fluidOutput24h widget.
  TextEditingController? fluidOutput24hController;
  String? Function(BuildContext, String?)? fluidOutput24hControllerValidator;
  String? _fluidOutput24hControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'd18zcaf6' /* * Field is required */,
      );
    }

    return null;
  }

  // State field(s) for DropDownStatus widget.
  String? dropDownStatusValue;
  FormFieldController<String>? dropDownStatusValueController;
  // State field(s) for DropDownStage widget.
  String? dropDownStageValue;
  FormFieldController<String>? dropDownStageValueController;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Create Document] action in Button-Login widget.
  TargetsRecord? createdTarget;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    yourNameControllerValidator = _yourNameControllerValidator;
    heightControllerValidator = _heightControllerValidator;
    weightControllerValidator = _weightControllerValidator;
    creatinineControllerValidator = _creatinineControllerValidator;
    fluidOutput24hControllerValidator = _fluidOutput24hControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    yourNameController?.dispose();
    heightController?.dispose();
    weightController?.dispose();
    yourAgeController?.dispose();
    creatinineController?.dispose();
    fluidOutput24hController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonValue => radioButtonValueController?.value;
}
