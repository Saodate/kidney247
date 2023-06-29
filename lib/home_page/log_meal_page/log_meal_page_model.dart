import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/blank_meal/blank_meal_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/meal_unit_slider/meal_unit_slider_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class LogMealPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  dynamic meal;

  bool? isSearched = false;

  bool? isCustomMeal = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Backend Call - API (selectMeal)] action in TextField widget.
  ApiCallResponse? apiResultpkj;
  List<CustomMealRecord> simpleSearchResults = [];
  // Model for blankMeal component.
  late BlankMealModel blankMealModel;
  // State field(s) for name widget.
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for quantity widget.
  TextEditingController? quantityController;
  String? Function(BuildContext, String?)? quantityControllerValidator;
  // State field(s) for DropDownUnit widget.
  String? dropDownUnitValue;
  FormFieldController<String>? dropDownUnitValueController;
  // State field(s) for calories widget.
  TextEditingController? caloriesController;
  String? Function(BuildContext, String?)? caloriesControllerValidator;
  // State field(s) for DropDownCalo widget.
  String? dropDownCaloValue;
  FormFieldController<String>? dropDownCaloValueController;
  // State field(s) for phosphorus widget.
  TextEditingController? phosphorusController;
  String? Function(BuildContext, String?)? phosphorusControllerValidator;
  // State field(s) for DropDownPhos widget.
  String? dropDownPhosValue;
  FormFieldController<String>? dropDownPhosValueController;
  // State field(s) for protein widget.
  TextEditingController? proteinController;
  String? Function(BuildContext, String?)? proteinControllerValidator;
  // State field(s) for DropDownProtein widget.
  String? dropDownProteinValue;
  FormFieldController<String>? dropDownProteinValueController;
  // State field(s) for potassium widget.
  TextEditingController? potassiumController;
  String? Function(BuildContext, String?)? potassiumControllerValidator;
  // State field(s) for DropDownPotass widget.
  String? dropDownPotassValue;
  FormFieldController<String>? dropDownPotassValueController;
  // State field(s) for sodium widget.
  TextEditingController? sodiumController;
  String? Function(BuildContext, String?)? sodiumControllerValidator;
  // State field(s) for DropDownSodium widget.
  String? dropDownSodiumValue;
  FormFieldController<String>? dropDownSodiumValueController;
  // State field(s) for fluid widget.
  TextEditingController? fluidController;
  String? Function(BuildContext, String?)? fluidControllerValidator;
  // State field(s) for DropDownFluid widget.
  String? dropDownFluidValue;
  FormFieldController<String>? dropDownFluidValueController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CustomMealRecord? created;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    blankMealModel = createModel(context, () => BlankMealModel());
  }

  void dispose() {
    unfocusNode.dispose();
    textController1?.dispose();
    blankMealModel.dispose();
    nameController?.dispose();
    quantityController?.dispose();
    caloriesController?.dispose();
    phosphorusController?.dispose();
    proteinController?.dispose();
    potassiumController?.dispose();
    sodiumController?.dispose();
    fluidController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
