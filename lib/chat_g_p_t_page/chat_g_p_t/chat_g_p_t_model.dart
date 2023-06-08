import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home_page/components/blank_chat_g_p_t/blank_chat_g_p_t_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatGPTModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool showQuestion = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for ListViewQuestion widget.
  ScrollController? listViewQuestion;
  // Stores action output result for [Custom Action - chatGPT] action in Container widget.
  String? chatGPTResponse1;
  // Stores action output result for [Custom Action - chatGPT] action in Container widget.
  String? chatGPTResponse2;
  // Stores action output result for [Custom Action - chatGPT] action in Container widget.
  String? chatGPTResponse3;
  // Stores action output result for [Custom Action - chatGPT] action in Container widget.
  String? chatGPTResponse4;
  // Stores action output result for [Custom Action - chatGPT] action in Container widget.
  String? chatGPTResponse5;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - chatGPT] action in IconButton widget.
  String? chatGPTResponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    listViewController = ScrollController();
    listViewQuestion = ScrollController();
  }

  void dispose() {
    listViewController?.dispose();
    listViewQuestion?.dispose();
    textController?.dispose();
  }

  /// Additional helper methods are added here.

}
