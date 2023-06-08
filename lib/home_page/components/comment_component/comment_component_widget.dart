import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/comment_reply_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home_page/components/empty_list/empty_list_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comment_component_model.dart';
export 'comment_component_model.dart';

class CommentComponentWidget extends StatefulWidget {
  const CommentComponentWidget({
    Key? key,
    this.videoRef,
    this.postRef,
  }) : super(key: key);

  final DocumentReference? videoRef;
  final DocumentReference? postRef;

  @override
  _CommentComponentWidgetState createState() => _CommentComponentWidgetState();
}

class _CommentComponentWidgetState extends State<CommentComponentWidget> {
  late CommentComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentComponentModel());

    _model.textFieldReplyController ??= TextEditingController();
    _model.textController2 ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (widget.postRef != null)
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: StreamBuilder<List<PostCommentsRecord>>(
                  stream: queryPostCommentsRecord(
                    queryBuilder: (postCommentsRecord) => postCommentsRecord
                        .where('postRef', isEqualTo: widget.postRef)
                        .orderBy('createdAt', descending: true),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 40.0,
                          height: 40.0,
                          child: SpinKitCircle(
                            color: FlutterFlowTheme.of(context).teal,
                            size: 40.0,
                          ),
                        ),
                      );
                    }
                    List<PostCommentsRecord> listViewPostCommentsRecordList =
                        snapshot.data!;
                    if (listViewPostCommentsRecordList.isEmpty) {
                      return EmptyListWidget(
                        name: FFLocalizations.of(context).getText(
                          'nbq72vzz' /* No comment yet. */,
                        ),
                        isDesc: false,
                      );
                    }
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewPostCommentsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewPostCommentsRecord =
                            listViewPostCommentsRecordList[listViewIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: StreamBuilder<UsersRecord>(
                            stream: _model.userCommentCache(
                              requestFn: () => UsersRecord.getDocument(
                                  listViewPostCommentsRecord.userRef!),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 40.0,
                                    height: 40.0,
                                    child: SpinKitCircle(
                                      color: FlutterFlowTheme.of(context).teal,
                                      size: 40.0,
                                    ),
                                  ),
                                );
                              }
                              final containerUsersRecord = snapshot.data!;
                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              width: 50.0,
                                              height: 50.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  containerUsersRecord.photoUrl,
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/kidney-s1k692/assets/kb3k8basj6js/105356-kidney-loading.gif',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  8.0,
                                                                  8.0,
                                                                  8.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
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
                                                                Text(
                                                                  containerUsersRecord
                                                                      .displayName,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Be Vietnam Pro',
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                                SelectionArea(
                                                                    child: Text(
                                                                  listViewPostCommentsRecord
                                                                      .comment,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Be Vietnam Pro',
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                )),
                                                              ],
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                dateTimeFormat(
                                                                  'relative',
                                                                  listViewPostCommentsRecord
                                                                      .createdAt!,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Be Vietnam Pro',
                                                                      fontSize:
                                                                          12.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                              if (listViewPostCommentsRecord
                                                                      .userRef ==
                                                                  currentUserReference)
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
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
                                                                            'COMMENT_COMPONENT_Text_hedcpmhh_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Text_set_form_field');
                                                                        setState(
                                                                            () {
                                                                          _model
                                                                              .textController2
                                                                              ?.text = listViewPostCommentsRecord.comment;
                                                                        });
                                                                        logFirebaseEvent(
                                                                            'Text_update_widget_state');
                                                                        setState(
                                                                            () {
                                                                          _model.isEdit =
                                                                              true;
                                                                          _model.postCommentRef =
                                                                              listViewPostCommentsRecord.reference;
                                                                        });
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'g7bb2etn' /* Edit */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Be Vietnam Pro',
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'COMMENT_COMPONENT_Text_bslmhng3_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Text_alert_dialog');
                                                                          var confirmDialogResponse = await showDialog<bool>(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    title: Text('⚠'),
                                                                                    content: Text(FFLocalizations.of(context).languageCode == 'en' ? 'Are you sure want to delete this comment?' : 'Bạn có chắc muốn xoá bình luận này?'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                        child: Text(FFLocalizations.of(context).languageCode == 'en' ? 'Cancel' : 'Huỷ'),
                                                                                      ),
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                        child: Text(FFLocalizations.of(context).languageCode == 'en' ? 'Confirm' : 'Xoá'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              ) ??
                                                                              false;
                                                                          if (confirmDialogResponse) {
                                                                            logFirebaseEvent('Text_backend_call');
                                                                            await listViewPostCommentsRecord.reference.delete();
                                                                          }
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '6enc8kaa' /* Delete */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Be Vietnam Pro',
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  CommentReplyWidget(
                                                    key: Key(
                                                        'Key4cd_${listViewIndex}_of_${listViewPostCommentsRecordList.length}'),
                                                    postCommentDoc:
                                                        listViewPostCommentsRecord,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          if (widget.videoRef != null)
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: StreamBuilder<List<VideoCommentsRecord>>(
                  stream: queryVideoCommentsRecord(
                    queryBuilder: (videoCommentsRecord) => videoCommentsRecord
                        .where('video_ref', isEqualTo: widget.videoRef)
                        .orderBy('created_at', descending: true),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 40.0,
                          height: 40.0,
                          child: SpinKitCircle(
                            color: FlutterFlowTheme.of(context).teal,
                            size: 40.0,
                          ),
                        ),
                      );
                    }
                    List<VideoCommentsRecord> listViewVideoCommentsRecordList =
                        snapshot.data!;
                    if (listViewVideoCommentsRecordList.isEmpty) {
                      return EmptyListWidget(
                        name: FFLocalizations.of(context).getText(
                          '4raeqm0g' /* No comment yet. */,
                        ),
                        isDesc: false,
                      );
                    }
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewVideoCommentsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewVideoCommentsRecord =
                            listViewVideoCommentsRecordList[listViewIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: StreamBuilder<UsersRecord>(
                            stream: _model.userCommentCache(
                              requestFn: () => UsersRecord.getDocument(
                                  listViewVideoCommentsRecord.userRef!),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 40.0,
                                    height: 40.0,
                                    child: SpinKitCircle(
                                      color: FlutterFlowTheme.of(context).teal,
                                      size: 40.0,
                                    ),
                                  ),
                                );
                              }
                              final containerUsersRecord = snapshot.data!;
                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              width: 50.0,
                                              height: 50.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  containerUsersRecord.photoUrl,
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/kidney-s1k692/assets/kb3k8basj6js/105356-kidney-loading.gif',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  8.0,
                                                                  8.0,
                                                                  8.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
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
                                                                Text(
                                                                  containerUsersRecord
                                                                      .displayName,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Be Vietnam Pro',
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                                Text(
                                                                  listViewVideoCommentsRecord
                                                                      .comment,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Be Vietnam Pro',
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                dateTimeFormat(
                                                                  'relative',
                                                                  listViewVideoCommentsRecord
                                                                      .createdAt!,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Be Vietnam Pro',
                                                                      fontSize:
                                                                          12.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                              if (listViewVideoCommentsRecord
                                                                      .userRef ==
                                                                  currentUserReference)
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
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
                                                                            'COMMENT_COMPONENT_Text_6f3ndslj_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Text_set_form_field');
                                                                        setState(
                                                                            () {
                                                                          _model
                                                                              .textController2
                                                                              ?.text = listViewVideoCommentsRecord.comment;
                                                                        });
                                                                        logFirebaseEvent(
                                                                            'Text_update_widget_state');
                                                                        setState(
                                                                            () {
                                                                          _model.isEdit =
                                                                              true;
                                                                          _model.videoCommentRef =
                                                                              listViewVideoCommentsRecord.reference;
                                                                        });
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'hupepc8t' /* Edit */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Be Vietnam Pro',
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'COMMENT_COMPONENT_Text_fvlgbaj8_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Text_alert_dialog');
                                                                          var confirmDialogResponse = await showDialog<bool>(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    title: Text('⚠'),
                                                                                    content: Text(FFLocalizations.of(context).languageCode == 'en' ? 'Are you sure want to delete this comment?' : 'Bạn có chắc muốn xoá bình luận này?'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                        child: Text(FFLocalizations.of(context).languageCode == 'en' ? 'Cancel' : 'Huỷ'),
                                                                                      ),
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                        child: Text(FFLocalizations.of(context).languageCode == 'en' ? 'Confirm' : 'Xoá'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              ) ??
                                                                              false;
                                                                          if (confirmDialogResponse) {
                                                                            logFirebaseEvent('Text_backend_call');
                                                                            await listViewVideoCommentsRecord.reference.delete();
                                                                          }
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '9mqacp9f' /* Delete */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Be Vietnam Pro',
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  CommentReplyWidget(
                                                    key: Key(
                                                        'Key2y6_${listViewIndex}_of_${listViewVideoCommentsRecordList.length}'),
                                                    videoCommentDoc:
                                                        listViewVideoCommentsRecord,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (FFAppState().postCommentReply != null)
                StreamBuilder<PostCommentsRecord>(
                  stream: PostCommentsRecord.getDocument(
                      FFAppState().postCommentReply!),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 40.0,
                          height: 40.0,
                          child: SpinKitCircle(
                            color: FlutterFlowTheme.of(context).teal,
                            size: 40.0,
                          ),
                        ),
                      );
                    }
                    final containerPostCommentsRecord = snapshot.data!;
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.subdirectory_arrow_right_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: StreamBuilder<UsersRecord>(
                                    stream: UsersRecord.getDocument(
                                        containerPostCommentsRecord.userRef!),
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
                                      final richTextUsersRecord =
                                          snapshot.data!;
                                      return RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'r5jj1upl' /* Reply  */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Be Vietnam Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                            TextSpan(
                                              text: richTextUsersRecord
                                                  .displayName,
                                              style: GoogleFonts.getFont(
                                                'Be Vietnam Pro',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
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
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'COMMENT_COMPONENT_Icon_0e42l2td_ON_TAP');
                                logFirebaseEvent('Icon_update_app_state');
                                setState(() {
                                  FFAppState().postCommentReply = null;
                                });
                              },
                              child: Icon(
                                Icons.close,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              if (FFAppState().videoCommentReply != null)
                StreamBuilder<VideoCommentsRecord>(
                  stream: VideoCommentsRecord.getDocument(
                      FFAppState().videoCommentReply!),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 40.0,
                          height: 40.0,
                          child: SpinKitCircle(
                            color: FlutterFlowTheme.of(context).teal,
                            size: 40.0,
                          ),
                        ),
                      );
                    }
                    final containerVideoCommentsRecord = snapshot.data!;
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.subdirectory_arrow_right_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: StreamBuilder<UsersRecord>(
                                    stream: UsersRecord.getDocument(
                                        containerVideoCommentsRecord.userRef!),
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
                                      final richTextUsersRecord =
                                          snapshot.data!;
                                      return RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'tvme4sea' /* Reply  */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Be Vietnam Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                            TextSpan(
                                              text: richTextUsersRecord
                                                  .displayName,
                                              style: GoogleFonts.getFont(
                                                'Be Vietnam Pro',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
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
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'COMMENT_COMPONENT_Icon_epzjml31_ON_TAP');
                                logFirebaseEvent('Icon_update_app_state');
                                setState(() {
                                  FFAppState().videoCommentReply = null;
                                });
                              },
                              child: Icon(
                                Icons.close,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if ((FFAppState().postCommentReply != null) ||
                        (FFAppState().videoCommentReply != null))
                      Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent2,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _model.textFieldReplyController,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: FFLocalizations.of(context).getText(
                                    'jgsaagw2' /* Write some comment... */,
                                  ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Be Vietnam Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
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
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor:
                                      FlutterFlowTheme.of(context).accent2,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Be Vietnam Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                maxLines: null,
                                validator: _model
                                    .textFieldReplyControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 20.0,
                                borderWidth: 0.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.send,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'COMMENT_COMPONENT_COMP_send_ICN_ON_TAP');
                                  if (loggedIn) {
                                    if (FFAppState().postCommentReply != null) {
                                      logFirebaseEvent(
                                          'IconButton_validate_form');
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      logFirebaseEvent(
                                          'IconButton_backend_call');

                                      final postCommentReplyCreateData =
                                          createPostCommentReplyRecordData(
                                        userRef: currentUserReference,
                                        comment: _model
                                            .textFieldReplyController.text,
                                        createdAt: getCurrentTimestamp,
                                        postRef: widget.postRef,
                                      );
                                      await PostCommentReplyRecord.createDoc(
                                              FFAppState().postCommentReply!)
                                          .set(postCommentReplyCreateData);
                                      logFirebaseEvent(
                                          'IconButton_clear_text_fields');
                                      setState(() {
                                        _model.textFieldReplyController
                                            ?.clear();
                                      });
                                    } else {
                                      logFirebaseEvent(
                                          'IconButton_validate_form');
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      logFirebaseEvent(
                                          'IconButton_backend_call');

                                      final videoCommentReplyCreateData =
                                          createVideoCommentReplyRecordData(
                                        userRef: currentUserReference,
                                        comment: _model
                                            .textFieldReplyController.text,
                                        createdAt: getCurrentTimestamp,
                                        videoRef: widget.videoRef,
                                      );
                                      await VideoCommentReplyRecord.createDoc(
                                              FFAppState().videoCommentReply!)
                                          .set(videoCommentReplyCreateData);
                                      logFirebaseEvent(
                                          'IconButton_clear_text_fields');
                                      setState(() {
                                        _model.textFieldReplyController
                                            ?.clear();
                                      });
                                    }
                                  } else {
                                    logFirebaseEvent(
                                        'IconButton_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          FFLocalizations.of(context)
                                                      .languageCode ==
                                                  'en'
                                              ? 'You have to log in to comment on this video!'
                                              : 'Bạn phải đăng nhập để bình luận vào video này!',
                                          style: GoogleFonts.getFont(
                                            'Be Vietnam Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 2000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    if ((FFAppState().postCommentReply == null) &&
                        (FFAppState().videoCommentReply == null))
                      Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent2,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _model.textController2,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: FFLocalizations.of(context).getText(
                                    'uhhjbs28' /* Write some comment... */,
                                  ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Be Vietnam Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
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
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor:
                                      FlutterFlowTheme.of(context).accent2,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Be Vietnam Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                maxLines: null,
                                validator: _model.textController2Validator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 20.0,
                                borderWidth: 0.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.send,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'COMMENT_COMPONENT_COMP_send_ICN_ON_TAP');
                                  if (loggedIn) {
                                    if (_model.isEdit) {
                                      logFirebaseEvent(
                                          'IconButton_validate_form');
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      if (widget.videoRef != null) {
                                        logFirebaseEvent(
                                            'IconButton_backend_call');

                                        final videoCommentsUpdateData =
                                            createVideoCommentsRecordData(
                                          comment: _model.textController2.text,
                                        );
                                        await _model.videoCommentRef!
                                            .update(videoCommentsUpdateData);
                                      } else {
                                        logFirebaseEvent(
                                            'IconButton_backend_call');

                                        final postCommentsUpdateData =
                                            createPostCommentsRecordData(
                                          comment: _model.textController2.text,
                                        );
                                        await _model.postCommentRef!
                                            .update(postCommentsUpdateData);
                                      }

                                      logFirebaseEvent(
                                          'IconButton_clear_text_fields');
                                      setState(() {
                                        _model.textController2?.clear();
                                      });
                                      logFirebaseEvent(
                                          'IconButton_update_widget_state');
                                      setState(() {
                                        _model.isEdit = false;
                                      });
                                    } else {
                                      logFirebaseEvent(
                                          'IconButton_validate_form');
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      if (widget.videoRef != null) {
                                        logFirebaseEvent(
                                            'IconButton_backend_call');

                                        final videoCommentsCreateData =
                                            createVideoCommentsRecordData(
                                          userRef: currentUserReference,
                                          createdAt: getCurrentTimestamp,
                                          comment: _model.textController2.text,
                                          videoRef: widget.videoRef,
                                        );
                                        await VideoCommentsRecord.collection
                                            .doc()
                                            .set(videoCommentsCreateData);
                                      } else {
                                        logFirebaseEvent(
                                            'IconButton_backend_call');

                                        final postCommentsCreateData =
                                            createPostCommentsRecordData(
                                          comment: _model.textController2.text,
                                          userRef: currentUserReference,
                                          createdAt: getCurrentTimestamp,
                                          postRef: widget.postRef,
                                        );
                                        await PostCommentsRecord.collection
                                            .doc()
                                            .set(postCommentsCreateData);
                                      }

                                      logFirebaseEvent(
                                          'IconButton_clear_text_fields');
                                      setState(() {
                                        _model.textController2?.clear();
                                      });
                                    }
                                  } else {
                                    logFirebaseEvent(
                                        'IconButton_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          FFLocalizations.of(context)
                                                      .languageCode ==
                                                  'en'
                                              ? 'You have to log in to comment on this video!'
                                              : 'Bạn phải đăng nhập để bình luận vào video này!',
                                          style: GoogleFonts.getFont(
                                            'Be Vietnam Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 2000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
