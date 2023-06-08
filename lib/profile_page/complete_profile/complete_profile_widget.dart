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
import 'complete_profile_model.dart';
export 'complete_profile_model.dart';

class CompleteProfileWidget extends StatefulWidget {
  const CompleteProfileWidget({Key? key}) : super(key: key);

  @override
  _CompleteProfileWidgetState createState() => _CompleteProfileWidgetState();
}

class _CompleteProfileWidgetState extends State<CompleteProfileWidget>
    with TickerProviderStateMixin {
  late CompleteProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'circleImageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 19.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 600.ms,
          begin: Offset(0.0, 20.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'textFieldOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          begin: Offset(0.0, 20.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'textFieldOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: Offset(0.0, 40.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'textFieldOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: Offset(0.0, 40.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'textFieldOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: Offset(0.0, 40.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'textFieldOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: Offset(0.0, 40.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'textFieldOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: Offset(0.0, 40.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 250.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 250.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 250.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 250.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 250.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 250.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 250.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 250.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 250.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'radioButtonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 250.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 250.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 250.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'buttonOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.bounceOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: Offset(0.0, 40.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'buttonOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.bounceOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: Offset(0.0, 40.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompleteProfileModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'completeProfile'});
    _model.yourNameController ??= TextEditingController();
    _model.heightController ??= TextEditingController();
    _model.weightController ??= TextEditingController();
    _model.yourAgeController ??= TextEditingController();
    _model.creatinineController ??= TextEditingController();
    _model.fluidOutput24hController ??= TextEditingController();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'Kidney247',
        color: FlutterFlowTheme.of(context).primary,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('COMPLETE_PROFILE_Icon_guv9uzf8_ON_TAP');
                  logFirebaseEvent('Icon_navigate_back');
                  context.pop();
                },
                child: Icon(
                  Icons.arrow_back_outlined,
                  color: FlutterFlowTheme.of(context).grayLight,
                  size: 32.0,
                ),
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  '1a2m7636' /* Complete Profile */,
                ),
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Be Vietnam Pro',
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).headlineSmallFamily),
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 1.0,
                  constraints: BoxConstraints(
                    maxWidth: 770.0,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: Image.asset(
                        'assets/images/page_bg_transparent@2x.png',
                      ).image,
                    ),
                  ),
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            AuthUserStreamWidget(
                              builder: (context) => InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'COMPLETE_PROFILE_PAGE_userAvatar_ON_TAP');
                                  logFirebaseEvent(
                                      'userAvatar_upload_media_to_firebase');
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    allowPhoto: true,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    setState(
                                        () => _model.isDataUploading1 = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];
                                    var downloadUrls = <String>[];
                                    try {
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                              ))
                                          .toList();

                                      downloadUrls = (await Future.wait(
                                        selectedMedia.map(
                                          (m) async => await uploadData(
                                              m.storagePath, m.bytes),
                                        ),
                                      ))
                                          .where((u) => u != null)
                                          .map((u) => u!)
                                          .toList();
                                    } finally {
                                      _model.isDataUploading1 = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                            selectedMedia.length &&
                                        downloadUrls.length ==
                                            selectedMedia.length) {
                                      setState(() {
                                        _model.uploadedLocalFile1 =
                                            selectedUploadedFiles.first;
                                        _model.uploadedFileUrl1 =
                                            downloadUrls.first;
                                      });
                                    } else {
                                      setState(() {});
                                      return;
                                    }
                                  }

                                  logFirebaseEvent('userAvatar_backend_call');

                                  final usersUpdateData = createUsersRecordData(
                                    photoUrl: _model.uploadedFileUrl1,
                                  );
                                  await currentUserReference!
                                      .update(usersUpdateData);
                                },
                                child: Container(
                                  width: 120.0,
                                  height: 120.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      currentUserPhoto,
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/kidney-s1k692/assets/kb3k8basj6js/105356-kidney-loading.gif',
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'circleImageOnPageLoadAnimation']!),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'i0yd39rz' /* Upload a photo for us to easil... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Be Vietnam Pro',
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ).animateOnPageLoad(
                                animationsMap['textOnPageLoadAnimation1']!),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 0.0),
                              child: TextFormField(
                                controller: _model.yourNameController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'f45t5aiy' /* Your Name */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Be Vietnam Pro',
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily),
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    'ounyhigo' /* i.e. Kyle John */,
                                  ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Be Vietnam Pro',
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          20.0, 24.0, 20.0, 24.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Be Vietnam Pro',
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                validator: _model.yourNameControllerValidator
                                    .asValidator(context),
                              ).animateOnPageLoad(animationsMap[
                                  'textFieldOnPageLoadAnimation1']!),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 0.0),
                              child: TextFormField(
                                controller: _model.heightController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'vgttgz1e' /* Your Height */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Be Vietnam Pro',
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily),
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    '57t248nn' /* i.e. 160 (cm) */,
                                  ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Be Vietnam Pro',
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          20.0, 24.0, 20.0, 24.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Be Vietnam Pro',
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                keyboardType: TextInputType.number,
                                validator: _model.heightControllerValidator
                                    .asValidator(context),
                              ).animateOnPageLoad(animationsMap[
                                  'textFieldOnPageLoadAnimation2']!),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 0.0),
                              child: TextFormField(
                                controller: _model.weightController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'he5l2fn3' /* Your Weight */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Be Vietnam Pro',
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily),
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    '26vujieq' /* i.e. 60 (kg) */,
                                  ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Be Vietnam Pro',
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          20.0, 24.0, 20.0, 24.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Be Vietnam Pro',
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                validator: _model.weightControllerValidator
                                    .asValidator(context),
                              ).animateOnPageLoad(animationsMap[
                                  'textFieldOnPageLoadAnimation3']!),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: TextFormField(
                                        controller: _model.yourAgeController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            'uy6udiaq' /* Your Age */,
                                          ),
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily:
                                                        'Be Vietnam Pro',
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                        .containsKey(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily),
                                                  ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'e9dx1x36' /* i.e. 34 */,
                                          ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily:
                                                        'Be Vietnam Pro',
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                        .containsKey(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily),
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 24.0, 20.0, 24.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Be Vietnam Pro',
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .yourAgeControllerValidator
                                            .asValidator(context),
                                      ).animateOnPageLoad(animationsMap[
                                          'textFieldOnPageLoadAnimation4']!),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: FlutterFlowDropDown<String>(
                                        controller: _model
                                                .dropDownAgeValueController ??=
                                            FormFieldController<String>(
                                          _model.dropDownAgeValue ??= 'Năm',
                                        ),
                                        options: ['Năm', 'Tháng'],
                                        optionLabels: [
                                          FFLocalizations.of(context).getText(
                                            'c5d7u6bq' /* Year */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            '9t50geaw' /* Month */,
                                          )
                                        ],
                                        onChanged: (val) => setState(() =>
                                            _model.dropDownAgeValue = val),
                                        width: 300.0,
                                        height: 50.0,
                                        searchHintTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .labelMedium,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Be Vietnam Pro',
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'mr5hze9w' /* Please select... */,
                                        ),
                                        searchHintText:
                                            FFLocalizations.of(context).getText(
                                          'rvqwqcig' /* Search for an item... */,
                                        ),
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 0.0),
                              child: TextFormField(
                                controller: _model.creatinineController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'l8w06274' /* Creatinine */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Be Vietnam Pro',
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily),
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    '9hukyu70' /* i.e. 70 (umol/L) */,
                                  ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Be Vietnam Pro',
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          20.0, 24.0, 20.0, 24.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Be Vietnam Pro',
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        signed: true, decimal: true),
                                validator: _model.creatinineControllerValidator
                                    .asValidator(context),
                              ).animateOnPageLoad(animationsMap[
                                  'textFieldOnPageLoadAnimation5']!),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 0.0),
                              child: TextFormField(
                                controller: _model.fluidOutput24hController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    '19ar53qd' /* 24 hour Fluid Output */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Be Vietnam Pro',
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily),
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    'rmu583o3' /* i.e. 200 (ml) */,
                                  ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Be Vietnam Pro',
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          20.0, 24.0, 20.0, 24.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Be Vietnam Pro',
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                keyboardType: TextInputType.number,
                                validator: _model
                                    .fluidOutput24hControllerValidator
                                    .asValidator(context),
                              ).animateOnPageLoad(animationsMap[
                                  'textFieldOnPageLoadAnimation6']!),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '06u4vg40' /* Your Status */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Be Vietnam Pro',
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation2']!),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: FlutterFlowDropDown<String>(
                                controller:
                                    _model.dropDownStatusValueController ??=
                                        FormFieldController<String>(
                                  _model.dropDownStatusValue ??=
                                      'Không muốn tiết lộ',
                                ),
                                options: [
                                  'Không muốn tiết lộ',
                                  'Chưa chạy thận',
                                  'Chuẩn bị ghép thận',
                                  'Đang chạy thận',
                                  'Đã ghép thận'
                                ],
                                optionLabels: [
                                  FFLocalizations.of(context).getText(
                                    'k4qz9yxt' /* Undisclosed */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'hmnomybq' /* Not on dialysis */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'jy676ois' /* Preparing for a kidney transpl... */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '43tjyb3d' /* On dialysis */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'arfs12ex' /* Had a kidney transplant */,
                                  )
                                ],
                                onChanged: (val) => setState(
                                    () => _model.dropDownStatusValue = val),
                                width: double.infinity,
                                height: 50.0,
                                searchHintTextStyle:
                                    FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Be Vietnam Pro',
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Be Vietnam Pro',
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  'tnt7geu3' /* Please select... */,
                                ),
                                searchHintText:
                                    FFLocalizations.of(context).getText(
                                  'mmoxeer0' /* Search for an item... */,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 0.0,
                                borderRadius: 0.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                isSearchable: false,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '16wfyi8c' /* Your Stage */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Be Vietnam Pro',
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation3']!),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: FlutterFlowDropDown<String>(
                                controller:
                                    _model.dropDownStageValueController ??=
                                        FormFieldController<String>(
                                  _model.dropDownStageValue ??=
                                      'Chưa bị bệnh thận',
                                ),
                                options: [
                                  'Giai đoạn 1',
                                  'Giai đoạn 2',
                                  'Giai đoạn 3A',
                                  'Giai đoạn 3B',
                                  'Giai đoạn 4',
                                  'Giai đoạn 5',
                                  'Chưa bị bệnh thận'
                                ],
                                optionLabels: [
                                  FFLocalizations.of(context).getText(
                                    'yg3w463k' /* Stage 1 */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'ajrxsds2' /* Stage 2 */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '63otkktg' /* Stage 3A */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'rxx5suqz' /* Stage 3B */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'faxpbca0' /* Stage 4 */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'm4iwabs7' /* Stage 5 */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'ae8owbmv' /* No kidney disease */,
                                  )
                                ],
                                onChanged: (val) => setState(
                                    () => _model.dropDownStageValue = val),
                                width: double.infinity,
                                height: 50.0,
                                searchHintTextStyle:
                                    FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Be Vietnam Pro',
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Be Vietnam Pro',
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  'k51r900d' /* Please select... */,
                                ),
                                searchHintText:
                                    FFLocalizations.of(context).getText(
                                  'esjtthk4' /* Search for an item... */,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 0.0,
                                borderRadius: 0.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                isSearchable: false,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 12.0, 20.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'xpeoj7pm' /* Your Birth Sex */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Be Vietnam Pro',
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation4']!),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 12.0, 20.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: FlutterFlowRadioButton(
                                        options: [
                                          FFLocalizations.of(context).getText(
                                            '113p8lmv' /* Male */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            '5made8we' /* Female */,
                                          )
                                        ].toList(),
                                        onChanged: (val) => setState(() {}),
                                        controller: _model
                                                .radioButtonValueController ??=
                                            FormFieldController<String>(
                                                FFLocalizations.of(context)
                                                            .languageCode ==
                                                        'en'
                                                    ? 'Male'
                                                    : 'Nam giới'),
                                        optionHeight: 25.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                        selectedTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Be Vietnam Pro',
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                        textPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 15.0, 0.0),
                                        buttonPosition:
                                            RadioButtonPosition.left,
                                        direction: Axis.horizontal,
                                        radioButtonColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        inactiveRadioButtonColor:
                                            FlutterFlowTheme.of(context)
                                                .grayLight,
                                        toggleable: false,
                                        horizontalAlignment:
                                            WrapAlignment.center,
                                        verticalAlignment:
                                            WrapCrossAlignment.start,
                                      ).animateOnPageLoad(animationsMap[
                                          'radioButtonOnPageLoadAnimation']!),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '9k5dndp6' /* Upload lab test paper (if avai... */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Be Vietnam Pro',
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation5']!),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (_model.uploadedFileUrl2 == null ||
                                      _model.uploadedFileUrl2 == '')
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'COMPLETE_PROFILE_Column_qiy88yvn_ON_TAP');
                                        logFirebaseEvent(
                                            'Column_upload_media_to_firebase');
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          allowPhoto: true,
                                          pickerFontFamily: 'Be Vietnam Pro',
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading2 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];
                                          var downloadUrls = <String>[];
                                          try {
                                            showUploadMessage(
                                              context,
                                              'Uploading file...',
                                              showLoading: true,
                                            );
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();

                                            downloadUrls = (await Future.wait(
                                              selectedMedia.map(
                                                (m) async => await uploadData(
                                                    m.storagePath, m.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentSnackBar();
                                            _model.isDataUploading2 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile2 =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl2 =
                                                  downloadUrls.first;
                                            });
                                            showUploadMessage(
                                                context, 'Success!');
                                          } else {
                                            setState(() {});
                                            showUploadMessage(context,
                                                'Failed to upload data');
                                            return;
                                          }
                                        }
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.upload_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 40.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '22n8dvez' /* Click to upload file */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Be Vietnam Pro',
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (_model.uploadedFileUrl2 != null &&
                                      _model.uploadedFileUrl2 != '')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional(1.0, -1.0),
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'COMPLETE_PROFILE_Image_aexpy3on_ON_TAP');
                                              logFirebaseEvent(
                                                  'Image_expand_image');
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType.fade,
                                                  child:
                                                      FlutterFlowExpandedImageView(
                                                    image: Image.network(
                                                      _model.uploadedFileUrl2,
                                                      fit: BoxFit.contain,
                                                    ),
                                                    allowRotation: false,
                                                    tag:
                                                        _model.uploadedFileUrl2,
                                                    useHeroAnimation: true,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Hero(
                                              tag: _model.uploadedFileUrl2,
                                              transitionOnUserGestures: true,
                                              child: Image.network(
                                                _model.uploadedFileUrl2,
                                                width: double.infinity,
                                                height: 300.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                            icon: Icon(
                                              Icons.close_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'COMPLETE_PROFILE_close_rounded_ICN_ON_TA');
                                              logFirebaseEvent(
                                                  'IconButton_delete_data');
                                              await FirebaseStorage.instance
                                                  .refFromURL(
                                                      _model.uploadedFileUrl2)
                                                  .delete();
                                              logFirebaseEvent(
                                                  'IconButton_clear_uploaded_data');
                                              setState(() {
                                                _model.isDataUploading2 = false;
                                                _model.uploadedLocalFile2 =
                                                    FFUploadedFile(
                                                        bytes:
                                                            Uint8List.fromList(
                                                                []));
                                                _model.uploadedFileUrl2 = '';
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            if (!FFAppState().isBack)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'COMPLETE_PROFILE_Button-Login_ON_TAP');
                                    logFirebaseEvent(
                                        'Button-Login_validate_form');
                                    if (_model.formKey.currentState == null ||
                                        !_model.formKey.currentState!
                                            .validate()) {
                                      return;
                                    }
                                    logFirebaseEvent(
                                        'Button-Login_backend_call');

                                    final usersUpdateData =
                                        createUsersRecordData(
                                      displayName:
                                          _model.yourNameController.text,
                                      age: double.tryParse(
                                          _model.yourAgeController.text),
                                      userSex: _model.radioButtonValue,
                                      stage: _model.dropDownStageValue,
                                      todayfluidOutput: double.parse((int.parse(
                                                  _model.creatinineController
                                                      .text) /
                                              1000)
                                          .toStringAsFixed(2)),
                                      weight: double.tryParse(
                                          _model.weightController.text),
                                      height: int.tryParse(
                                          _model.heightController.text),
                                      status: _model.dropDownStatusValue,
                                      creatinine: double.parse(
                                          _model.creatinineController.text),
                                      ageUnit: _model.dropDownAgeValue,
                                    );
                                    await currentUserReference!
                                        .update(usersUpdateData);
                                    logFirebaseEvent(
                                        'Button-Login_backend_call');

                                    final targetsCreateData =
                                        createTargetsRecordData(
                                      createdAt: getCurrentTimestamp,
                                      userRef: currentUserReference,
                                    );
                                    var targetsRecordReference =
                                        TargetsRecord.collection.doc();
                                    await targetsRecordReference
                                        .set(targetsCreateData);
                                    _model.createdTarget =
                                        TargetsRecord.getDocumentFromData(
                                            targetsCreateData,
                                            targetsRecordReference);
                                    logFirebaseEvent(
                                        'Button-Login_backend_call');

                                    final nutrientCreateData =
                                        createNutrientRecordData(
                                      phosphorus: 0.0,
                                      protein: 0.0,
                                      sodium: 0.0,
                                      fluidIntake: 0.0,
                                      potassium: 0.0,
                                      calories: 0.0,
                                    );
                                    await NutrientRecord.createDoc(
                                            _model.createdTarget!.reference)
                                        .set(nutrientCreateData);
                                    logFirebaseEvent(
                                        'Button-Login_backend_call');

                                    final vitalCreateData =
                                        createVitalRecordData(
                                      bloodPressureFrom: 0,
                                      bloodPressureTo: 0,
                                      bloodGlucose: 0.0,
                                      fluidOutput: 0.0,
                                    );
                                    await VitalRecord.createDoc(
                                            _model.createdTarget!.reference)
                                        .set(vitalCreateData);
                                    logFirebaseEvent(
                                        'Button-Login_backend_call');

                                    final labtestCreateData =
                                        createLabtestRecordData(
                                      eGFR: 0.0,
                                      albumin: 0.0,
                                      bloodUN: 0.0,
                                      bloodGlucose: 0.0,
                                    );
                                    await LabtestRecord.createDoc(
                                            _model.createdTarget!.reference)
                                        .set(labtestCreateData);
                                    if (_model.uploadedFileUrl2 != null &&
                                        _model.uploadedFileUrl2 != '') {
                                      logFirebaseEvent(
                                          'Button-Login_backend_call');

                                      final labTestPhotoCreateData =
                                          createLabTestPhotoRecordData(
                                        photoUrl: _model.uploadedFileUrl2,
                                        userRef: currentUserReference,
                                        createdAt: getCurrentTimestamp,
                                      );
                                      await LabTestPhotoRecord.collection
                                          .doc()
                                          .set(labTestPhotoCreateData);
                                    }
                                    logFirebaseEvent(
                                        'Button-Login_navigate_to');

                                    context.pushNamed(
                                      'setTargetPage',
                                      queryParameters: {
                                        'isEdited': serializeParam(
                                          false,
                                          ParamType.bool,
                                        ),
                                      }.withoutNulls,
                                    );

                                    setState(() {});
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '59csbupd' /* Next */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 230.0,
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Be Vietnam Pro',
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'buttonOnPageLoadAnimation1']!),
                              ),
                            if (FFAppState().isBack)
                              StreamBuilder<List<TargetsRecord>>(
                                stream: queryTargetsRecord(
                                  queryBuilder: (targetsRecord) =>
                                      targetsRecord.where('user_ref',
                                          isEqualTo: currentUserReference),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 40.0,
                                        height: 40.0,
                                        child: SpinKitCircle(
                                          color:
                                              FlutterFlowTheme.of(context).teal,
                                          size: 40.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<TargetsRecord>
                                      containerTargetsRecordList =
                                      snapshot.data!;
                                  final containerTargetsRecord =
                                      containerTargetsRecordList.isNotEmpty
                                          ? containerTargetsRecordList.first
                                          : null;
                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: StreamBuilder<List<NutrientRecord>>(
                                      stream: queryNutrientRecord(
                                        parent:
                                            containerTargetsRecord!.reference,
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 40.0,
                                              height: 40.0,
                                              child: SpinKitCircle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .teal,
                                                size: 40.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<NutrientRecord>
                                            containerNutrientRecordList =
                                            snapshot.data!;
                                        final containerNutrientRecord =
                                            containerNutrientRecordList
                                                    .isNotEmpty
                                                ? containerNutrientRecordList
                                                    .first
                                                : null;
                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: StreamBuilder<
                                                List<LabtestRecord>>(
                                              stream: queryLabtestRecord(
                                                parent: containerTargetsRecord!
                                                    .reference,
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 40.0,
                                                      height: 40.0,
                                                      child: SpinKitCircle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .teal,
                                                        size: 40.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<LabtestRecord>
                                                    buttonLoginLabtestRecordList =
                                                    snapshot.data!;
                                                final buttonLoginLabtestRecord =
                                                    buttonLoginLabtestRecordList
                                                            .isNotEmpty
                                                        ? buttonLoginLabtestRecordList
                                                            .first
                                                        : null;
                                                return FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'COMPLETE_PROFILE_Button-Login_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Button-Login_validate_form');
                                                    if (_model.formKey
                                                                .currentState ==
                                                            null ||
                                                        !_model.formKey
                                                            .currentState!
                                                            .validate()) {
                                                      return;
                                                    }
                                                    logFirebaseEvent(
                                                        'Button-Login_backend_call');

                                                    final usersUpdateData =
                                                        createUsersRecordData(
                                                      displayName: _model
                                                          .yourNameController
                                                          .text,
                                                      age: double.tryParse(
                                                          _model
                                                              .yourAgeController
                                                              .text),
                                                      userSex: _model
                                                          .radioButtonValue,
                                                      stage: _model
                                                          .dropDownStageValue,
                                                      todayfluidOutput: double
                                                          .parse((int.parse(_model
                                                                      .creatinineController
                                                                      .text) /
                                                                  1000)
                                                              .toStringAsFixed(
                                                                  2)),
                                                      weight: double.tryParse(
                                                          _model
                                                              .weightController
                                                              .text),
                                                      height: int.tryParse(
                                                          _model
                                                              .heightController
                                                              .text),
                                                      status: _model
                                                          .dropDownStatusValue,
                                                      creatinine: double.parse(
                                                          _model
                                                              .creatinineController
                                                              .text),
                                                      ageUnit: _model
                                                          .dropDownAgeValue,
                                                    );
                                                    await currentUserReference!
                                                        .update(
                                                            usersUpdateData);
                                                    logFirebaseEvent(
                                                        'Button-Login_backend_call');

                                                    final targetsUpdateData =
                                                        createTargetsRecordData(
                                                      createdAt:
                                                          getCurrentTimestamp,
                                                    );
                                                    await containerTargetsRecord!
                                                        .reference
                                                        .update(
                                                            targetsUpdateData);
                                                    logFirebaseEvent(
                                                        'Button-Login_backend_call');

                                                    final nutrientUpdateData =
                                                        createNutrientRecordData(
                                                      protein: double.parse((1.4 *
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.weight,
                                                                  0.0))
                                                          .toStringAsFixed(2)),
                                                      fluidIntake: FFLocalizations
                                                                      .of(
                                                                          context)
                                                                  .languageCode ==
                                                              'en'
                                                          ? ((String
                                                                      var1,
                                                                  double var2) {
                                                              return var1 ==
                                                                      'No kidney disease'
                                                                  ? 2.0
                                                                  : var1 ==
                                                                          'Stage 1'
                                                                      ? 2.0
                                                                      : var1 ==
                                                                              'Stage 2'
                                                                          ? 2.0
                                                                          : var2 +
                                                                              0.5;
                                                            }(
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.stage,
                                                                  ''),
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.todayfluidOutput,
                                                                  0.0)))
                                                          : ((String
                                                                      var1,
                                                                  double var2) {
                                                              return var1 ==
                                                                      'Chưa bị bệnh thận'
                                                                  ? 2.0
                                                                  : var1 ==
                                                                          'Giai đoạn 1'
                                                                      ? 2.0
                                                                      : var1 ==
                                                                              'Giai đoạn 2'
                                                                          ? 2.0
                                                                          : var2 +
                                                                              0.5;
                                                            }(
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.stage,
                                                                  ''),
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.todayfluidOutput,
                                                                  0.0))),
                                                    );
                                                    await containerNutrientRecord!
                                                        .reference
                                                        .update(
                                                            nutrientUpdateData);
                                                    logFirebaseEvent(
                                                        'Button-Login_backend_call');

                                                    final labtestUpdateData =
                                                        createLabtestRecordData(
                                                      eGFR:
                                                          valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.ageUnit,
                                                                      '') ==
                                                                  'Năm'
                                                              ? (valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.age,
                                                                          0.0) >=
                                                                      19.0
                                                                  ? (FFLocalizations.of(context).languageCode ==
                                                                          'en'
                                                                      ? (valueOrDefault(currentUserDocument?.userSex, '') == 'Male'
                                                                          ? (double.parse((0.0205 * 1 * (140 - valueOrDefault(currentUserDocument?.age, 0.0)) * valueOrDefault(currentUserDocument?.weight, 0.0) / valueOrDefault(currentUserDocument?.creatinine, 0.0)).toStringAsFixed(
                                                                              2)))
                                                                          : (double.parse((0.0205 * 0.85 * (140 - valueOrDefault(currentUserDocument?.age, 0.0)) * valueOrDefault(currentUserDocument?.weight, 0.0) / valueOrDefault(currentUserDocument?.creatinine, 0.0)).toStringAsFixed(
                                                                              2))))
                                                                      : (valueOrDefault(currentUserDocument?.userSex, '') == 'Nam giới'
                                                                          ? (double.parse((0.0205 * 1 * (140 - valueOrDefault(currentUserDocument?.age, 0.0)) * valueOrDefault(currentUserDocument?.weight, 0.0) / valueOrDefault(currentUserDocument?.creatinine, 0.0)).toStringAsFixed(2)))
                                                                          : (double.parse((0.0205 * 0.85 * (140 - valueOrDefault(currentUserDocument?.age, 0.0)) * valueOrDefault(currentUserDocument?.weight, 0.0) / valueOrDefault(currentUserDocument?.creatinine, 0.0)).toStringAsFixed(2)))))
                                                                  : () {
                                                                      if (valueOrDefault(
                                                                              currentUserDocument?.age,
                                                                              0.0) >
                                                                          13.0) {
                                                                        return (FFLocalizations.of(context).languageCode ==
                                                                                'en'
                                                                            ? (valueOrDefault(currentUserDocument?.userSex, '') == 'Male'
                                                                                ? (double.parse((0.70 * valueOrDefault(currentUserDocument?.height, 0) / valueOrDefault(currentUserDocument?.creatinine, 0.0)).toStringAsFixed(2)))
                                                                                : (double.parse((0.55 * valueOrDefault(currentUserDocument?.height, 0) / valueOrDefault(currentUserDocument?.creatinine, 0.0)).toStringAsFixed(2))))
                                                                            : (valueOrDefault(currentUserDocument?.userSex, '') == 'Nam giới' ? (double.parse((0.70 * valueOrDefault(currentUserDocument?.height, 0) / valueOrDefault(currentUserDocument?.creatinine, 0.0)).toStringAsFixed(2))) : (double.parse((0.55 * valueOrDefault(currentUserDocument?.height, 0) / valueOrDefault(currentUserDocument?.creatinine, 0.0)).toStringAsFixed(2)))));
                                                                      } else if (valueOrDefault(
                                                                              currentUserDocument?.age,
                                                                              0.0) >=
                                                                          2.0) {
                                                                        return (double.parse((0.55 *
                                                                                valueOrDefault(currentUserDocument?.height, 0) /
                                                                                valueOrDefault(currentUserDocument?.creatinine, 0.0))
                                                                            .toStringAsFixed(2)));
                                                                      } else {
                                                                        return (double.parse((0.45 *
                                                                                valueOrDefault(currentUserDocument?.height, 0) /
                                                                                valueOrDefault(currentUserDocument?.creatinine, 0.0))
                                                                            .toStringAsFixed(2)));
                                                                      }
                                                                    }())
                                                              : (valueOrDefault(currentUserDocument?.age, 0.0) >= 1.0 ? (double.parse((0.45 * valueOrDefault(currentUserDocument?.height, 0) / valueOrDefault(currentUserDocument?.creatinine, 0.0)).toStringAsFixed(2))) : (double.parse((0.33 * valueOrDefault(currentUserDocument?.height, 0) / valueOrDefault(currentUserDocument?.creatinine, 0.0)).toStringAsFixed(2)))),
                                                      bloodGlucose: valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.ageUnit,
                                                                  '') ==
                                                              'Năm'
                                                          ? () {
                                                              if (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.age,
                                                                      0.0) <=
                                                                  5.0) {
                                                                return 8.5;
                                                              } else if (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.age,
                                                                      0.0) <=
                                                                  12.0) {
                                                                return 8.0;
                                                              } else if (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.age,
                                                                      0.0) <=
                                                                  19.0) {
                                                                return 7.5;
                                                              } else if (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.age,
                                                                      0.0) <=
                                                                  39.0) {
                                                                return 6.0;
                                                              } else if (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.age,
                                                                      0.0) <=
                                                                  59.0) {
                                                                return 6.1;
                                                              } else {
                                                                return 6.5;
                                                              }
                                                            }()
                                                          : 8.5,
                                                      bloodUN: valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.ageUnit,
                                                                  '') ==
                                                              'Năm'
                                                          ? () {
                                                              if (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.age,
                                                                      0.0) <
                                                                  18.0) {
                                                                return 6.0;
                                                              } else if (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.age,
                                                                      0.0) <=
                                                                  29.0) {
                                                                return functions.pieceValueCalculation(
                                                                    6.0,
                                                                    20.0,
                                                                    12,
                                                                    18,
                                                                    29,
                                                                    valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.age,
                                                                        0.0));
                                                              } else if (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.age,
                                                                      0.0) <=
                                                                  39.0) {
                                                                return functions.pieceValueCalculation(
                                                                    7.0,
                                                                    21.0,
                                                                    10,
                                                                    30,
                                                                    39,
                                                                    valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.age,
                                                                        0.0));
                                                              } else if (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.age,
                                                                      0.0) <=
                                                                  49.0) {
                                                                return functions.pieceValueCalculation(
                                                                    8.0,
                                                                    23.0,
                                                                    10,
                                                                    40,
                                                                    49,
                                                                    valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.age,
                                                                        0.0));
                                                              } else if (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.age,
                                                                      0.0) <=
                                                                  59.0) {
                                                                return functions.pieceValueCalculation(
                                                                    9.0,
                                                                    25.0,
                                                                    10,
                                                                    50,
                                                                    59,
                                                                    valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.age,
                                                                        0.0));
                                                              } else if (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.age,
                                                                      0.0) <=
                                                                  69.0) {
                                                                return functions.pieceValueCalculation(
                                                                    10.0,
                                                                    28.0,
                                                                    10,
                                                                    60,
                                                                    69,
                                                                    valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.age,
                                                                        0.0));
                                                              } else {
                                                                return functions.pieceValueCalculation(
                                                                    11.0,
                                                                    30.0,
                                                                    11,
                                                                    70,
                                                                    80,
                                                                    valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.age,
                                                                        0.0));
                                                              }
                                                            }()
                                                          : 6.0,
                                                      albumin: valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.ageUnit,
                                                                  '') ==
                                                              'Năm'
                                                          ? () {
                                                              if (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.age,
                                                                      0.0) <
                                                                  16.0) {
                                                                return functions.pieceValueCalculation(
                                                                    3.0,
                                                                    5.0,
                                                                    14,
                                                                    2,
                                                                    15,
                                                                    valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.age,
                                                                        0.0));
                                                              } else if (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.age,
                                                                      0.0) ==
                                                                  16.0) {
                                                                return 3.5;
                                                              } else {
                                                                return 4.8;
                                                              }
                                                            }()
                                                          : () {
                                                              if (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.age,
                                                                      0.0) <=
                                                                  4.0) {
                                                                return functions.pieceValueCalculation(
                                                                    2.0,
                                                                    4.5,
                                                                    4,
                                                                    1,
                                                                    4,
                                                                    valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.age,
                                                                        0.0));
                                                              } else if (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.age,
                                                                      0.0) <
                                                                  16.0) {
                                                                return functions.pieceValueCalculation(
                                                                    3.2,
                                                                    5.2,
                                                                    11,
                                                                    5,
                                                                    15,
                                                                    valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.age,
                                                                        0.0));
                                                              } else {
                                                                return functions.pieceValueCalculation(
                                                                    3.0,
                                                                    5.0,
                                                                    11,
                                                                    16,
                                                                    24,
                                                                    valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.age,
                                                                        0.0));
                                                              }
                                                            }(),
                                                    );
                                                    await buttonLoginLabtestRecord!
                                                        .reference
                                                        .update(
                                                            labtestUpdateData);
                                                    if (_model.uploadedFileUrl2 !=
                                                            null &&
                                                        _model.uploadedFileUrl2 !=
                                                            '') {
                                                      logFirebaseEvent(
                                                          'Button-Login_backend_call');

                                                      final labTestPhotoCreateData =
                                                          createLabTestPhotoRecordData(
                                                        photoUrl: _model
                                                            .uploadedFileUrl2,
                                                        userRef:
                                                            currentUserReference,
                                                        createdAt:
                                                            getCurrentTimestamp,
                                                      );
                                                      await LabTestPhotoRecord
                                                          .collection
                                                          .doc()
                                                          .set(
                                                              labTestPhotoCreateData);
                                                    }
                                                    logFirebaseEvent(
                                                        'Button-Login_navigate_to');

                                                    context.pushNamed(
                                                      'setTargetPage',
                                                      queryParameters: {
                                                        'isEdited':
                                                            serializeParam(
                                                          false,
                                                          ParamType.bool,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'k2wzyi2s' /* Next */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 230.0,
                                                    height: 50.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .override(
                                                              fontFamily:
                                                                  'Be Vietnam Pro',
                                                              useGoogleFonts: GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmallFamily),
                                                            ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                  ),
                                                ).animateOnPageLoad(animationsMap[
                                                    'buttonOnPageLoadAnimation2']!);
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
