import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/blank_chat_g_p_t/blank_chat_g_p_t_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
import 'chat_g_p_t_model.dart';
export 'chat_g_p_t_model.dart';

class ChatGPTWidget extends StatefulWidget {
  const ChatGPTWidget({Key? key}) : super(key: key);

  @override
  _ChatGPTWidgetState createState() => _ChatGPTWidgetState();
}

class _ChatGPTWidgetState extends State<ChatGPTWidget>
    with TickerProviderStateMixin {
  late ChatGPTModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 1000.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatGPTModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'chatGPT'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CHAT_G_P_T_PAGE_chatGPT_ON_INIT_STATE');
      logFirebaseEvent('chatGPT_wait__delay');
      await Future.delayed(const Duration(milliseconds: 800));
      logFirebaseEvent('chatGPT_scroll_to');
      await _model.listViewController?.animateTo(
        _model.listViewController!.position.maxScrollExtent,
        duration: Duration(milliseconds: 100),
        curve: Curves.ease,
      );
    });

    _model.textController ??= TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<ChatGPTHistoryRecord>>(
      stream: queryChatGPTHistoryRecord(
        queryBuilder: (chatGPTHistoryRecord) => chatGPTHistoryRecord
            .where('userRef', isEqualTo: currentUserReference),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitCircle(
                  color: FlutterFlowTheme.of(context).teal,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        List<ChatGPTHistoryRecord> chatGPTChatGPTHistoryRecordList =
            snapshot.data!;
        final chatGPTChatGPTHistoryRecord =
            chatGPTChatGPTHistoryRecordList.isNotEmpty
                ? chatGPTChatGPTHistoryRecordList.first
                : null;
        return Title(
            title: 'Kidney247',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () =>
                  FocusScope.of(context).requestFocus(_model.unfocusNode),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                appBar: AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  automaticallyImplyLeading: false,
                  leading: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 20.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'CHAT_G_P_T_arrow_back_ios_rounded_ICN_ON');
                      logFirebaseEvent('IconButton_navigate_back');
                      context.pop();
                    },
                  ),
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'qt82rih1' /* Kidney AI */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Be Vietnam Pro',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 20.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context)
                                  .headlineMediumFamily),
                        ),
                  ),
                  actions: [],
                  centerTitle: true,
                  elevation: 0.0,
                ),
                body: SafeArea(
                  top: true,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/images/blur_bg@1x.png',
                        ).image,
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: 770.0,
                        ),
                        decoration: BoxDecoration(),
                        child: Stack(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          children: [
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 12.0, 12.0, 12.0),
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'be62jok2' /* Note:  */,
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Be Vietnam Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'yyzq1dwi' /* Kidney AI is an artificial int... */,
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Be Vietnam Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            )
                                          ],
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
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 70.0),
                                        child: Builder(
                                          builder: (context) {
                                            final chatHistory =
                                                chatGPTChatGPTHistoryRecord!
                                                    .history
                                                    .toList();
                                            if (chatHistory.isEmpty) {
                                              return Container(
                                                width: double.infinity,
                                                child: BlankChatGPTWidget(),
                                              );
                                            }
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: chatHistory.length,
                                              itemBuilder:
                                                  (context, chatHistoryIndex) {
                                                final chatHistoryItem =
                                                    chatHistory[
                                                        chatHistoryIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      if (chatHistoryIndex %
                                                              2 !=
                                                          0)
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth:
                                                                          () {
                                                                        if (MediaQuery.sizeOf(context).width >=
                                                                            1170.0) {
                                                                          return 700.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <=
                                                                            470.0) {
                                                                          return 330.0;
                                                                        } else {
                                                                          return 530.0;
                                                                        }
                                                                      }(),
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .textColor,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              3.0,
                                                                          color:
                                                                              Color(0x33000000),
                                                                          offset: Offset(
                                                                              0.0,
                                                                              1.0),
                                                                        )
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          12.0,
                                                                          12.0,
                                                                          12.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          SelectionArea(
                                                                              child: AutoSizeText(
                                                                            chatHistoryItem,
                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                  fontFamily: 'Be Vietnam Pro',
                                                                                  color: Colors.black,
                                                                                  fontSize: 14.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                  lineHeight: 1.5,
                                                                                ),
                                                                          )),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            6.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'CHAT_G_P_T_PAGE_Row_499bjn0q_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Row_copy_to_clipboard');
                                                                        await Clipboard.setData(ClipboardData(
                                                                            text:
                                                                                chatHistoryIndex.toString()));
                                                                        logFirebaseEvent(
                                                                            'Row_show_snack_bar');
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Response copied to clipboard.',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    color: Color(0x00000000),
                                                                                    fontSize: 12.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 2000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        );
                                                                      },
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                4.0,
                                                                                0.0),
                                                                            child:
                                                                                Icon(
                                                                              Icons.content_copy,
                                                                              color: FlutterFlowTheme.of(context).primary30,
                                                                              size: 10.0,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'hew4e8k3' /* Copy response */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Be Vietnam Pro',
                                                                                  color: FlutterFlowTheme.of(context).primary30,
                                                                                  fontSize: 10.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      if (chatHistoryIndex %
                                                              2 ==
                                                          0)
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Container(
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxWidth: () {
                                                                  if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width >=
                                                                      1170.0) {
                                                                    return 700.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <=
                                                                      470.0) {
                                                                    return 330.0;
                                                                  } else {
                                                                    return 530.0;
                                                                  }
                                                                }(),
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        12.0,
                                                                        12.0,
                                                                        12.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      chatHistoryItem,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Be Vietnam Pro',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).textColor,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                    ],
                                                  ),
                                                );
                                              },
                                              controller:
                                                  _model.listViewController,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3.0,
                                    color: Color(0x33000000),
                                    offset: Offset(0.0, 1.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  if ((chatGPTChatGPTHistoryRecord!
                                              .history.length ==
                                          0) ||
                                      _model.showQuestion)
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(16.0),
                                          topRight: Radius.circular(16.0),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 0.0),
                                            child: Container(
                                              width: 50.0,
                                              height: 4.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 16.0, 16.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'k9w52upz' /* Select question to ask AI */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily:
                                                            'Be Vietnam Pro',
                                                        fontSize: 18.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily),
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: ListView(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 12.0,
                                                          16.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'CHAT_G_P_T_Container_1kse2lwm_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Container_backend_call');

                                                      await chatGPTChatGPTHistoryRecord!
                                                          .reference
                                                          .update({
                                                        'history': FieldValue
                                                            .arrayUnion([
                                                          FFLocalizations.of(
                                                                          context)
                                                                      .languageCode ==
                                                                  'en'
                                                              ? 'What can I do to improve my quality of life while living with kidney disease?'
                                                              : 'Tôi có thể làm gì để cải thiện chất lượng cuộc sống khi sống chung với bệnh thận?'
                                                        ]),
                                                      });
                                                      logFirebaseEvent(
                                                          'Container_update_widget_state');
                                                      setState(() {
                                                        _model.showQuestion =
                                                            !_model
                                                                .showQuestion;
                                                      });
                                                      logFirebaseEvent(
                                                          'Container_backend_call');

                                                      await chatGPTChatGPTHistoryRecord!
                                                          .reference
                                                          .update({
                                                        'history': FieldValue
                                                            .arrayUnion([
                                                          FFLocalizations.of(
                                                                          context)
                                                                      .languageCode ==
                                                                  'en'
                                                              ? 'I am thinking...'
                                                              : 'Tôi đang suy nghĩ...'
                                                        ]),
                                                      });
                                                      logFirebaseEvent(
                                                          'Container_custom_action');
                                                      _model.chatGPTResponse1 =
                                                          await actions.chatGPT(
                                                        FFAppState().chatGPTKey,
                                                        FFLocalizations.of(
                                                                        context)
                                                                    .languageCode ==
                                                                'en'
                                                            ? 'What can I do to improve my quality of life while living with kidney disease?'
                                                            : 'Tôi có thể làm gì để cải thiện chất lượng cuộc sống khi sống chung với bệnh thận?',
                                                      );
                                                      logFirebaseEvent(
                                                          'Container_clear_text_fields');
                                                      setState(() {
                                                        _model.textController
                                                            ?.clear();
                                                      });
                                                      if (_model
                                                              .chatGPTResponse1 !=
                                                          '') {
                                                        logFirebaseEvent(
                                                            'Container_backend_call');

                                                        await chatGPTChatGPTHistoryRecord!
                                                            .reference
                                                            .update({
                                                          'history': FieldValue
                                                              .arrayRemove([
                                                            FFLocalizations.of(
                                                                            context)
                                                                        .languageCode ==
                                                                    'en'
                                                                ? 'I am thinking...'
                                                                : 'Tôi đang suy nghĩ...'
                                                          ]),
                                                        });
                                                        logFirebaseEvent(
                                                            'Container_backend_call');

                                                        await chatGPTChatGPTHistoryRecord!
                                                            .reference
                                                            .update({
                                                          'history': FieldValue
                                                              .arrayUnion([
                                                            _model
                                                                .chatGPTResponse1
                                                          ]),
                                                        });
                                                      } else {
                                                        logFirebaseEvent(
                                                            'Container_show_snack_bar');
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              FFLocalizations.of(
                                                                              context)
                                                                          .languageCode ==
                                                                      'en'
                                                                  ? 'Something is wrong, try again later!'
                                                                  : 'Đã xảy ra lỗi, hãy thử lại sau!',
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Be Vietnam Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    2000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                        );
                                                        logFirebaseEvent(
                                                            'Container_backend_call');

                                                        await chatGPTChatGPTHistoryRecord!
                                                            .reference
                                                            .update({
                                                          'history': FieldValue
                                                              .arrayRemove(
                                                                  [' ']),
                                                        });
                                                      }

                                                      logFirebaseEvent(
                                                          'Container_wait__delay');
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  800));
                                                      logFirebaseEvent(
                                                          'Container_scroll_to');
                                                      await _model
                                                          .listViewController
                                                          ?.animateTo(
                                                        _model
                                                            .listViewController!
                                                            .position
                                                            .maxScrollExtent,
                                                        duration: Duration(
                                                            milliseconds: 200),
                                                        curve: Curves.ease,
                                                      );

                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent4,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    12.0,
                                                                    8.0,
                                                                    12.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '2zeyophz' /* What can I do to improve my qu... */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Be Vietnam Pro',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 12.0,
                                                          16.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'CHAT_G_P_T_Container_1uv48vtp_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Container_backend_call');

                                                      await chatGPTChatGPTHistoryRecord!
                                                          .reference
                                                          .update({
                                                        'history': FieldValue
                                                            .arrayUnion([
                                                          FFLocalizations.of(
                                                                          context)
                                                                      .languageCode ==
                                                                  'en'
                                                              ? 'How to stay positive while living with kidney disease?'
                                                              : 'Làm thế nào để sống tích cực khi sống chung với bệnh thận?'
                                                        ]),
                                                      });
                                                      logFirebaseEvent(
                                                          'Container_update_widget_state');
                                                      setState(() {
                                                        _model.showQuestion =
                                                            !_model
                                                                .showQuestion;
                                                      });
                                                      logFirebaseEvent(
                                                          'Container_backend_call');

                                                      await chatGPTChatGPTHistoryRecord!
                                                          .reference
                                                          .update({
                                                        'history': FieldValue
                                                            .arrayUnion([
                                                          FFLocalizations.of(
                                                                          context)
                                                                      .languageCode ==
                                                                  'en'
                                                              ? 'I am thinking...'
                                                              : 'Tôi đang suy nghĩ...'
                                                        ]),
                                                      });
                                                      logFirebaseEvent(
                                                          'Container_custom_action');
                                                      _model.chatGPTResponse2 =
                                                          await actions.chatGPT(
                                                        FFAppState().chatGPTKey,
                                                        FFLocalizations.of(
                                                                        context)
                                                                    .languageCode ==
                                                                'en'
                                                            ? 'How to stay positive while living with kidney disease?'
                                                            : 'Làm thế nào để sống tích cực khi sống chung với bệnh thận?',
                                                      );
                                                      logFirebaseEvent(
                                                          'Container_clear_text_fields');
                                                      setState(() {
                                                        _model.textController
                                                            ?.clear();
                                                      });
                                                      if (_model
                                                              .chatGPTResponse2 !=
                                                          '') {
                                                        logFirebaseEvent(
                                                            'Container_backend_call');

                                                        await chatGPTChatGPTHistoryRecord!
                                                            .reference
                                                            .update({
                                                          'history': FieldValue
                                                              .arrayRemove([
                                                            FFLocalizations.of(
                                                                            context)
                                                                        .languageCode ==
                                                                    'en'
                                                                ? 'I am thinking...'
                                                                : 'Tôi đang suy nghĩ...'
                                                          ]),
                                                        });
                                                        logFirebaseEvent(
                                                            'Container_backend_call');

                                                        await chatGPTChatGPTHistoryRecord!
                                                            .reference
                                                            .update({
                                                          'history': FieldValue
                                                              .arrayUnion([
                                                            _model
                                                                .chatGPTResponse2
                                                          ]),
                                                        });
                                                      } else {
                                                        logFirebaseEvent(
                                                            'Container_show_snack_bar');
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              FFLocalizations.of(
                                                                              context)
                                                                          .languageCode ==
                                                                      'en'
                                                                  ? 'Something is wrong, try again later!'
                                                                  : 'Đã xảy ra lỗi, hãy thử lại sau!',
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Be Vietnam Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    2000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                        );
                                                        logFirebaseEvent(
                                                            'Container_backend_call');

                                                        await chatGPTChatGPTHistoryRecord!
                                                            .reference
                                                            .update({
                                                          'history': FieldValue
                                                              .arrayRemove(
                                                                  [' ']),
                                                        });
                                                      }

                                                      logFirebaseEvent(
                                                          'Container_wait__delay');
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  800));
                                                      logFirebaseEvent(
                                                          'Container_scroll_to');
                                                      await _model
                                                          .listViewController
                                                          ?.animateTo(
                                                        _model
                                                            .listViewController!
                                                            .position
                                                            .maxScrollExtent,
                                                        duration: Duration(
                                                            milliseconds: 200),
                                                        curve: Curves.ease,
                                                      );

                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent4,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    12.0,
                                                                    8.0,
                                                                    12.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'xkhy6e64' /* How to stay positive while liv... */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Be Vietnam Pro',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 12.0,
                                                          16.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'CHAT_G_P_T_Container_7omk7jmo_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Container_backend_call');

                                                      await chatGPTChatGPTHistoryRecord!
                                                          .reference
                                                          .update({
                                                        'history': FieldValue
                                                            .arrayUnion([
                                                          FFLocalizations.of(
                                                                          context)
                                                                      .languageCode ==
                                                                  'en'
                                                              ? 'How is kidney disease diagnosed - what tests will I need?'
                                                              : 'Bệnh thận được chẩn đoán như thế nào - tôi sẽ cần những xét nghiệm nào?'
                                                        ]),
                                                      });
                                                      logFirebaseEvent(
                                                          'Container_update_widget_state');
                                                      setState(() {
                                                        _model.showQuestion =
                                                            !_model
                                                                .showQuestion;
                                                      });
                                                      logFirebaseEvent(
                                                          'Container_backend_call');

                                                      await chatGPTChatGPTHistoryRecord!
                                                          .reference
                                                          .update({
                                                        'history': FieldValue
                                                            .arrayUnion([
                                                          FFLocalizations.of(
                                                                          context)
                                                                      .languageCode ==
                                                                  'en'
                                                              ? 'I am thinking...'
                                                              : 'Tôi đang suy nghĩ...'
                                                        ]),
                                                      });
                                                      logFirebaseEvent(
                                                          'Container_custom_action');
                                                      _model.chatGPTResponse3 =
                                                          await actions.chatGPT(
                                                        FFAppState().chatGPTKey,
                                                        FFLocalizations.of(
                                                                        context)
                                                                    .languageCode ==
                                                                'en'
                                                            ? 'How is kidney disease diagnosed - what tests will I need?'
                                                            : 'Bệnh thận được chẩn đoán như thế nào - tôi sẽ cần những xét nghiệm nào?',
                                                      );
                                                      logFirebaseEvent(
                                                          'Container_clear_text_fields');
                                                      setState(() {
                                                        _model.textController
                                                            ?.clear();
                                                      });
                                                      if (_model
                                                              .chatGPTResponse3 !=
                                                          '') {
                                                        logFirebaseEvent(
                                                            'Container_backend_call');

                                                        await chatGPTChatGPTHistoryRecord!
                                                            .reference
                                                            .update({
                                                          'history': FieldValue
                                                              .arrayRemove([
                                                            FFLocalizations.of(
                                                                            context)
                                                                        .languageCode ==
                                                                    'en'
                                                                ? 'I am thinking...'
                                                                : 'Tôi đang suy nghĩ...'
                                                          ]),
                                                        });
                                                        logFirebaseEvent(
                                                            'Container_backend_call');

                                                        await chatGPTChatGPTHistoryRecord!
                                                            .reference
                                                            .update({
                                                          'history': FieldValue
                                                              .arrayUnion([
                                                            _model
                                                                .chatGPTResponse3
                                                          ]),
                                                        });
                                                      } else {
                                                        logFirebaseEvent(
                                                            'Container_show_snack_bar');
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              FFLocalizations.of(
                                                                              context)
                                                                          .languageCode ==
                                                                      'en'
                                                                  ? 'Something is wrong, try again later!'
                                                                  : 'Đã xảy ra lỗi, hãy thử lại sau!',
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Be Vietnam Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    2000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                        );
                                                        logFirebaseEvent(
                                                            'Container_backend_call');

                                                        await chatGPTChatGPTHistoryRecord!
                                                            .reference
                                                            .update({
                                                          'history': FieldValue
                                                              .arrayRemove(
                                                                  [' ']),
                                                        });
                                                      }

                                                      logFirebaseEvent(
                                                          'Container_wait__delay');
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  800));
                                                      logFirebaseEvent(
                                                          'Container_scroll_to');
                                                      await _model
                                                          .listViewController
                                                          ?.animateTo(
                                                        _model
                                                            .listViewController!
                                                            .position
                                                            .maxScrollExtent,
                                                        duration: Duration(
                                                            milliseconds: 200),
                                                        curve: Curves.ease,
                                                      );

                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent4,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    12.0,
                                                                    8.0,
                                                                    12.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'm2z1gdey' /* How is kidney disease diagnose... */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Be Vietnam Pro',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 12.0,
                                                          16.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'CHAT_G_P_T_Container_6xeceovc_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Container_backend_call');

                                                      await chatGPTChatGPTHistoryRecord!
                                                          .reference
                                                          .update({
                                                        'history': FieldValue
                                                            .arrayUnion([
                                                          FFLocalizations.of(
                                                                          context)
                                                                      .languageCode ==
                                                                  'en'
                                                              ? 'Will I need dialysis or a kidney transplant?'
                                                              : 'Tôi có cần lọc máu hoặc ghép thận không?'
                                                        ]),
                                                      });
                                                      logFirebaseEvent(
                                                          'Container_update_widget_state');
                                                      setState(() {
                                                        _model.showQuestion =
                                                            !_model
                                                                .showQuestion;
                                                      });
                                                      logFirebaseEvent(
                                                          'Container_backend_call');

                                                      await chatGPTChatGPTHistoryRecord!
                                                          .reference
                                                          .update({
                                                        'history': FieldValue
                                                            .arrayUnion([
                                                          FFLocalizations.of(
                                                                          context)
                                                                      .languageCode ==
                                                                  'en'
                                                              ? 'I am thinking...'
                                                              : 'Tôi đang suy nghĩ...'
                                                        ]),
                                                      });
                                                      logFirebaseEvent(
                                                          'Container_custom_action');
                                                      _model.chatGPTResponse4 =
                                                          await actions.chatGPT(
                                                        FFAppState().chatGPTKey,
                                                        FFLocalizations.of(
                                                                        context)
                                                                    .languageCode ==
                                                                'en'
                                                            ? 'Will I need dialysis or a kidney transplant?'
                                                            : 'Tôi có cần lọc máu hoặc ghép thận không?',
                                                      );
                                                      logFirebaseEvent(
                                                          'Container_clear_text_fields');
                                                      setState(() {
                                                        _model.textController
                                                            ?.clear();
                                                      });
                                                      if (_model
                                                              .chatGPTResponse4 !=
                                                          '') {
                                                        logFirebaseEvent(
                                                            'Container_backend_call');

                                                        await chatGPTChatGPTHistoryRecord!
                                                            .reference
                                                            .update({
                                                          'history': FieldValue
                                                              .arrayRemove([
                                                            FFLocalizations.of(
                                                                            context)
                                                                        .languageCode ==
                                                                    'en'
                                                                ? 'I am thinking...'
                                                                : 'Tôi đang suy nghĩ...'
                                                          ]),
                                                        });
                                                        logFirebaseEvent(
                                                            'Container_backend_call');

                                                        await chatGPTChatGPTHistoryRecord!
                                                            .reference
                                                            .update({
                                                          'history': FieldValue
                                                              .arrayUnion([
                                                            _model
                                                                .chatGPTResponse4
                                                          ]),
                                                        });
                                                      } else {
                                                        logFirebaseEvent(
                                                            'Container_show_snack_bar');
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              FFLocalizations.of(
                                                                              context)
                                                                          .languageCode ==
                                                                      'en'
                                                                  ? 'Something is wrong, try again later!'
                                                                  : 'Đã xảy ra lỗi, hãy thử lại sau!',
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Be Vietnam Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    2000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                        );
                                                        logFirebaseEvent(
                                                            'Container_backend_call');

                                                        await chatGPTChatGPTHistoryRecord!
                                                            .reference
                                                            .update({
                                                          'history': FieldValue
                                                              .arrayRemove(
                                                                  [' ']),
                                                        });
                                                      }

                                                      logFirebaseEvent(
                                                          'Container_wait__delay');
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  800));
                                                      logFirebaseEvent(
                                                          'Container_scroll_to');
                                                      await _model
                                                          .listViewController
                                                          ?.animateTo(
                                                        _model
                                                            .listViewController!
                                                            .position
                                                            .maxScrollExtent,
                                                        duration: Duration(
                                                            milliseconds: 200),
                                                        curve: Curves.ease,
                                                      );

                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent4,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    12.0,
                                                                    8.0,
                                                                    12.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'wwsvn6wq' /* Will I need dialysis or a kidn... */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Be Vietnam Pro',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 12.0,
                                                          16.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'CHAT_G_P_T_Container_r7n4ivk3_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Container_backend_call');

                                                      await chatGPTChatGPTHistoryRecord!
                                                          .reference
                                                          .update({
                                                        'history': FieldValue
                                                            .arrayUnion([
                                                          FFLocalizations.of(
                                                                          context)
                                                                      .languageCode ==
                                                                  'en'
                                                              ? '5 recipes for renal diet'
                                                              : '5 công thức chế độ ăn uống cho thận'
                                                        ]),
                                                      });
                                                      logFirebaseEvent(
                                                          'Container_update_widget_state');
                                                      setState(() {
                                                        _model.showQuestion =
                                                            !_model
                                                                .showQuestion;
                                                      });
                                                      logFirebaseEvent(
                                                          'Container_backend_call');

                                                      await chatGPTChatGPTHistoryRecord!
                                                          .reference
                                                          .update({
                                                        'history': FieldValue
                                                            .arrayUnion([
                                                          FFLocalizations.of(
                                                                          context)
                                                                      .languageCode ==
                                                                  'en'
                                                              ? 'I am thinking...'
                                                              : 'Tôi đang suy nghĩ...'
                                                        ]),
                                                      });
                                                      logFirebaseEvent(
                                                          'Container_custom_action');
                                                      _model.chatGPTResponse5 =
                                                          await actions.chatGPT(
                                                        FFAppState().chatGPTKey,
                                                        FFLocalizations.of(
                                                                        context)
                                                                    .languageCode ==
                                                                'en'
                                                            ? '5 recipes for renal diet'
                                                            : '5 công thức chế độ ăn uống cho thận',
                                                      );
                                                      logFirebaseEvent(
                                                          'Container_clear_text_fields');
                                                      setState(() {
                                                        _model.textController
                                                            ?.clear();
                                                      });
                                                      if (_model
                                                              .chatGPTResponse5 !=
                                                          '') {
                                                        logFirebaseEvent(
                                                            'Container_backend_call');

                                                        await chatGPTChatGPTHistoryRecord!
                                                            .reference
                                                            .update({
                                                          'history': FieldValue
                                                              .arrayRemove([
                                                            FFLocalizations.of(
                                                                            context)
                                                                        .languageCode ==
                                                                    'en'
                                                                ? 'I am thinking...'
                                                                : 'Tôi đang suy nghĩ...'
                                                          ]),
                                                        });
                                                        logFirebaseEvent(
                                                            'Container_backend_call');

                                                        await chatGPTChatGPTHistoryRecord!
                                                            .reference
                                                            .update({
                                                          'history': FieldValue
                                                              .arrayUnion([
                                                            _model
                                                                .chatGPTResponse5
                                                          ]),
                                                        });
                                                      } else {
                                                        logFirebaseEvent(
                                                            'Container_show_snack_bar');
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              FFLocalizations.of(
                                                                              context)
                                                                          .languageCode ==
                                                                      'en'
                                                                  ? 'Something is wrong, try again later!'
                                                                  : 'Đã xảy ra lỗi, hãy thử lại sau!',
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Be Vietnam Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    2000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                        );
                                                        logFirebaseEvent(
                                                            'Container_backend_call');

                                                        await chatGPTChatGPTHistoryRecord!
                                                            .reference
                                                            .update({
                                                          'history': FieldValue
                                                              .arrayRemove(
                                                                  [' ']),
                                                        });
                                                      }

                                                      logFirebaseEvent(
                                                          'Container_wait__delay');
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  800));
                                                      logFirebaseEvent(
                                                          'Container_scroll_to');
                                                      await _model
                                                          .listViewController
                                                          ?.animateTo(
                                                        _model
                                                            .listViewController!
                                                            .position
                                                            .maxScrollExtent,
                                                        duration: Duration(
                                                            milliseconds: 200),
                                                        curve: Curves.ease,
                                                      );

                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent4,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    12.0,
                                                                    8.0,
                                                                    12.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'gz6gjnmc' /* 5 recipes for renal diet */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Be Vietnam Pro',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                              controller:
                                                  _model.listViewQuestion,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation']!),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 4.0, 10.0, 4.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          icon: FaIcon(
                                            FontAwesomeIcons.stream,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 15.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'CHAT_G_P_T_PAGE_stream_ICN_ON_TAP');
                                            logFirebaseEvent(
                                                'IconButton_update_widget_state');
                                            setState(() {
                                              _model.showQuestion =
                                                  !_model.showQuestion;
                                            });
                                          },
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: 300.0,
                                            child: TextFormField(
                                              controller: _model.textController,
                                              textCapitalization:
                                                  TextCapitalization.sentences,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  's5bjnpgn' /* Type something... */,
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
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                errorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedErrorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
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
                                              maxLines: 8,
                                              minLines: 1,
                                              keyboardType:
                                                  TextInputType.multiline,
                                              validator: _model
                                                  .textControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 60.0,
                                          icon: Icon(
                                            Icons.send_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 30.0,
                                          ),
                                          showLoadingIndicator: true,
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'CHAT_G_P_T_PAGE_send_rounded_ICN_ON_TAP');
                                            if (_model.textController.text !=
                                                    null &&
                                                _model.textController.text !=
                                                    '') {
                                              logFirebaseEvent(
                                                  'IconButton_backend_call');

                                              await chatGPTChatGPTHistoryRecord!
                                                  .reference
                                                  .update({
                                                'history':
                                                    FieldValue.arrayUnion([
                                                  _model.textController.text
                                                ]),
                                              });
                                              logFirebaseEvent(
                                                  'IconButton_update_widget_state');
                                              setState(() {
                                                _model.showQuestion = false;
                                              });
                                              logFirebaseEvent(
                                                  'IconButton_backend_call');

                                              await chatGPTChatGPTHistoryRecord!
                                                  .reference
                                                  .update({
                                                'history':
                                                    FieldValue.arrayUnion([
                                                  FFLocalizations.of(context)
                                                              .languageCode ==
                                                          'en'
                                                      ? 'I am thinking...'
                                                      : 'Tôi đang suy nghĩ...'
                                                ]),
                                              });
                                              logFirebaseEvent(
                                                  'IconButton_custom_action');
                                              _model.chatGPTResponse =
                                                  await actions.chatGPT(
                                                FFAppState().chatGPTKey,
                                                _model.textController.text,
                                              );
                                              if (_model.chatGPTResponse !=
                                                  '') {
                                                logFirebaseEvent(
                                                    'IconButton_clear_text_fields');
                                                setState(() {
                                                  _model.textController
                                                      ?.clear();
                                                });
                                                logFirebaseEvent(
                                                    'IconButton_backend_call');

                                                await chatGPTChatGPTHistoryRecord!
                                                    .reference
                                                    .update({
                                                  'history':
                                                      FieldValue.arrayRemove([
                                                    FFLocalizations.of(context)
                                                                .languageCode ==
                                                            'en'
                                                        ? 'I am thinking...'
                                                        : 'Tôi đang suy nghĩ...'
                                                  ]),
                                                });
                                                logFirebaseEvent(
                                                    'IconButton_backend_call');

                                                await chatGPTChatGPTHistoryRecord!
                                                    .reference
                                                    .update({
                                                  'history':
                                                      FieldValue.arrayUnion([
                                                    _model.chatGPTResponse
                                                  ]),
                                                });
                                              } else {
                                                logFirebaseEvent(
                                                    'IconButton_show_snack_bar');
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      FFLocalizations.of(
                                                                      context)
                                                                  .languageCode ==
                                                              'en'
                                                          ? 'Something is wrong, try again later!'
                                                          : 'Đã xảy ra lỗi, hãy thử lại sau!',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Be Vietnam Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 2000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                              }

                                              logFirebaseEvent(
                                                  'IconButton_wait__delay');
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 800));
                                              logFirebaseEvent(
                                                  'IconButton_scroll_to');
                                              await _model.listViewController
                                                  ?.animateTo(
                                                _model.listViewController!
                                                    .position.maxScrollExtent,
                                                duration:
                                                    Duration(milliseconds: 200),
                                                curve: Curves.ease,
                                              );
                                            } else {
                                              logFirebaseEvent(
                                                  'IconButton_show_snack_bar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    FFLocalizations.of(context)
                                                                .languageCode ==
                                                            'en'
                                                        ? 'Please type something!'
                                                        : 'Vui lòng nhập nội dung!',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      Color(0x00000000),
                                                ),
                                              );
                                            }

                                            setState(() {});
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
