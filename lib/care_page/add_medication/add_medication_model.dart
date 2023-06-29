import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_medication_reminder/add_medication_reminder_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class AddMedicationModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  List<MedicationRecord> simpleSearchResults = [];
  // State field(s) for name widget.
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for ingredient widget.
  TextEditingController? ingredientController;
  String? Function(BuildContext, String?)? ingredientControllerValidator;
  // State field(s) for form widget.
  String? formValue;
  FormFieldController<String>? formValueController;
  // State field(s) for dissolution widget.
  String? dissolutionValue;
  FormFieldController<String>? dissolutionValueController;
  // State field(s) for dosage widget.
  TextEditingController? dosageController;
  String? Function(BuildContext, String?)? dosageControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textController1?.dispose();
    nameController?.dispose();
    ingredientController?.dispose();
    dosageController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
