import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comment_reply_model.dart';
export 'comment_reply_model.dart';

class CommentReplyWidget extends StatefulWidget {
  const CommentReplyWidget({
    Key? key,
    this.postCommentDoc,
    this.videoCommentDoc,
  }) : super(key: key);

  final PostCommentsRecord? postCommentDoc;
  final VideoCommentsRecord? videoCommentDoc;

  @override
  _CommentReplyWidgetState createState() => _CommentReplyWidgetState();
}

class _CommentReplyWidgetState extends State<CommentReplyWidget> {
  late CommentReplyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentReplyModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (widget.postCommentDoc != null)
          StreamBuilder<PostCommentsRecord>(
            stream: PostCommentsRecord.getDocument(
                widget.postCommentDoc!.reference),
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
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ToggleIcon(
                          onPressed: () async {
                            final likeByElement = currentUserReference;
                            final likeByUpdate = containerPostCommentsRecord
                                    .likeBy
                                    .contains(likeByElement)
                                ? FieldValue.arrayRemove([likeByElement])
                                : FieldValue.arrayUnion([likeByElement]);
                            await containerPostCommentsRecord.reference.update({
                              'likeBy': likeByUpdate,
                            });
                          },
                          value: containerPostCommentsRecord.likeBy
                              .contains(currentUserReference),
                          onIcon: Icon(
                            Icons.favorite_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 25.0,
                          ),
                          offIcon: Icon(
                            Icons.favorite_border_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 25.0,
                          ),
                        ),
                        Text(
                          formatNumber(
                            widget.postCommentDoc!.likeBy.length,
                            formatType: FormatType.compact,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Be Vietnam Pro',
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                        ToggleIcon(
                          onPressed: () async {
                            setState(
                                () => _model.isShowing = !_model.isShowing!);
                            logFirebaseEvent(
                                'COMMENT_REPLY_ToggleIcon_w7tg7nyx_ON_TOG');
                            logFirebaseEvent('ToggleIcon_update_app_state');
                            FFAppState().update(() {
                              FFAppState().postCommentReply =
                                  widget.postCommentDoc!.reference;
                            });
                          },
                          value: !_model.isShowing!,
                          onIcon: Icon(
                            Icons.sync_alt,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 25.0,
                          ),
                          offIcon: Icon(
                            Icons.sync_alt,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 25.0,
                          ),
                        ),
                        StreamBuilder<List<PostCommentReplyRecord>>(
                          stream: queryPostCommentReplyRecord(
                            parent: widget.postCommentDoc!.reference,
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
                            List<PostCommentReplyRecord>
                                textPostCommentReplyRecordList = snapshot.data!;
                            return Text(
                              formatNumber(
                                textPostCommentReplyRecordList.length,
                                formatType: FormatType.compact,
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
                            );
                          },
                        ),
                      ],
                    ),
                    if (_model.isShowing ?? true)
                      StreamBuilder<List<PostCommentReplyRecord>>(
                        stream: queryPostCommentReplyRecord(
                          parent: widget.postCommentDoc!.reference,
                          queryBuilder: (postCommentReplyRecord) =>
                              postCommentReplyRecord.orderBy('createdAt'),
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
                          List<PostCommentReplyRecord>
                              listViewPostCommentReplyRecordList =
                              snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount:
                                listViewPostCommentReplyRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewPostCommentReplyRecord =
                                  listViewPostCommentReplyRecordList[
                                      listViewIndex];
                              return StreamBuilder<UsersRecord>(
                                stream: UsersRecord.getDocument(
                                    listViewPostCommentReplyRecord.userRef!),
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
                                  final containerUsersRecord = snapshot.data!;
                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Row(
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 8.0,
                                                                8.0, 8.0),
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
                                                                          FontWeight
                                                                              .bold,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                              Text(
                                                                listViewPostCommentReplyRecord
                                                                    .comment,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Be Vietnam Pro',
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                              dateTimeFormat(
                                                                'relative',
                                                                listViewPostCommentReplyRecord
                                                                    .createdAt!,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                            if (listViewPostCommentReplyRecord
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
                                                                          'COMMENT_REPLY_COMP_Text_n28u9qu7_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Text_alert_dialog');
                                                                      var confirmDialogResponse = await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
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
                                                                        logFirebaseEvent(
                                                                            'Text_backend_call');
                                                                        await listViewPostCommentReplyRecord
                                                                            .reference
                                                                            .delete();
                                                                      }
                                                                    },
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'cozx4m4x' /* Delete */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Be Vietnam Pro',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ToggleIcon(
                                                      onPressed: () async {
                                                        final likeByElement =
                                                            currentUserReference;
                                                        final likeByUpdate =
                                                            listViewPostCommentReplyRecord
                                                                    .likeBy
                                                                    .contains(
                                                                        likeByElement)
                                                                ? FieldValue
                                                                    .arrayRemove([
                                                                    likeByElement
                                                                  ])
                                                                : FieldValue
                                                                    .arrayUnion([
                                                                    likeByElement
                                                                  ]);
                                                        await listViewPostCommentReplyRecord
                                                            .reference
                                                            .update({
                                                          'likeBy':
                                                              likeByUpdate,
                                                        });
                                                      },
                                                      value: listViewPostCommentReplyRecord
                                                          .likeBy
                                                          .contains(
                                                              currentUserReference),
                                                      onIcon: Icon(
                                                        Icons.favorite_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 25.0,
                                                      ),
                                                      offIcon: Icon(
                                                        Icons
                                                            .favorite_border_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 25.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      formatNumber(
                                                        listViewPostCommentReplyRecord
                                                            .likeBy.length,
                                                        formatType:
                                                            FormatType.compact,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Be Vietnam Pro',
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                  ],
                ),
              );
            },
          ),
        if (widget.videoCommentDoc != null)
          StreamBuilder<VideoCommentsRecord>(
            stream: VideoCommentsRecord.getDocument(
                widget.videoCommentDoc!.reference),
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
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ToggleIcon(
                          onPressed: () async {
                            final likedByElement = currentUserReference;
                            final likedByUpdate = containerVideoCommentsRecord
                                    .likedBy
                                    .contains(likedByElement)
                                ? FieldValue.arrayRemove([likedByElement])
                                : FieldValue.arrayUnion([likedByElement]);
                            await containerVideoCommentsRecord.reference
                                .update({
                              'likedBy': likedByUpdate,
                            });
                          },
                          value: containerVideoCommentsRecord.likedBy
                              .contains(currentUserReference),
                          onIcon: Icon(
                            Icons.favorite_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 25.0,
                          ),
                          offIcon: Icon(
                            Icons.favorite_border_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 25.0,
                          ),
                        ),
                        Text(
                          formatNumber(
                            widget.videoCommentDoc!.likedBy.length,
                            formatType: FormatType.compact,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Be Vietnam Pro',
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                        ToggleIcon(
                          onPressed: () async {
                            setState(
                                () => _model.isShowing = !_model.isShowing!);
                            logFirebaseEvent(
                                'COMMENT_REPLY_ToggleIcon_wgrxkfga_ON_TOG');
                            logFirebaseEvent('ToggleIcon_update_app_state');
                            FFAppState().update(() {
                              FFAppState().videoCommentReply =
                                  widget.videoCommentDoc!.reference;
                            });
                          },
                          value: !_model.isShowing!,
                          onIcon: Icon(
                            Icons.sync_alt,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 25.0,
                          ),
                          offIcon: Icon(
                            Icons.sync_alt,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 25.0,
                          ),
                        ),
                        StreamBuilder<List<VideoCommentReplyRecord>>(
                          stream: queryVideoCommentReplyRecord(
                            parent: widget.videoCommentDoc!.reference,
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
                            List<VideoCommentReplyRecord>
                                textVideoCommentReplyRecordList =
                                snapshot.data!;
                            return Text(
                              formatNumber(
                                textVideoCommentReplyRecordList.length,
                                formatType: FormatType.compact,
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
                            );
                          },
                        ),
                      ],
                    ),
                    if (_model.isShowing ?? true)
                      StreamBuilder<List<VideoCommentReplyRecord>>(
                        stream: queryVideoCommentReplyRecord(
                          parent: widget.videoCommentDoc!.reference,
                          queryBuilder: (videoCommentReplyRecord) =>
                              videoCommentReplyRecord.orderBy('createdAt'),
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
                          List<VideoCommentReplyRecord>
                              listViewVideoCommentReplyRecordList =
                              snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount:
                                listViewVideoCommentReplyRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewVideoCommentReplyRecord =
                                  listViewVideoCommentReplyRecordList[
                                      listViewIndex];
                              return StreamBuilder<UsersRecord>(
                                stream: UsersRecord.getDocument(
                                    listViewVideoCommentReplyRecord.userRef!),
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
                                  final containerUsersRecord = snapshot.data!;
                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Row(
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 8.0,
                                                                8.0, 8.0),
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
                                                                containerUsersRecord.displayName !=
                                                                            null &&
                                                                        containerUsersRecord.displayName !=
                                                                            ''
                                                                    ? containerUsersRecord
                                                                        .displayName
                                                                    : (FFLocalizations.of(context).languageCode ==
                                                                            'en'
                                                                        ? 'Anonymous'
                                                                        : 'Ẩn danh'),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Be Vietnam Pro',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                              SelectionArea(
                                                                  child: Text(
                                                                listViewVideoCommentReplyRecord
                                                                    .comment,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Be Vietnam Pro',
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              )),
                                                            ],
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                              dateTimeFormat(
                                                                'relative',
                                                                listViewVideoCommentReplyRecord
                                                                    .createdAt!,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                            if (listViewVideoCommentReplyRecord
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
                                                                          'COMMENT_REPLY_COMP_Text_bupfx6zz_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Text_alert_dialog');
                                                                      var confirmDialogResponse = await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
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
                                                                        logFirebaseEvent(
                                                                            'Text_backend_call');
                                                                        await listViewVideoCommentReplyRecord
                                                                            .reference
                                                                            .delete();
                                                                      }
                                                                    },
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'tht17cno' /* Delete */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Be Vietnam Pro',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ToggleIcon(
                                                      onPressed: () async {
                                                        final likeByElement =
                                                            currentUserReference;
                                                        final likeByUpdate =
                                                            listViewVideoCommentReplyRecord
                                                                    .likeBy
                                                                    .contains(
                                                                        likeByElement)
                                                                ? FieldValue
                                                                    .arrayRemove([
                                                                    likeByElement
                                                                  ])
                                                                : FieldValue
                                                                    .arrayUnion([
                                                                    likeByElement
                                                                  ]);
                                                        await listViewVideoCommentReplyRecord
                                                            .reference
                                                            .update({
                                                          'likeBy':
                                                              likeByUpdate,
                                                        });
                                                      },
                                                      value: listViewVideoCommentReplyRecord
                                                          .likeBy
                                                          .contains(
                                                              currentUserReference),
                                                      onIcon: Icon(
                                                        Icons.favorite_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 25.0,
                                                      ),
                                                      offIcon: Icon(
                                                        Icons
                                                            .favorite_border_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 25.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      formatNumber(
                                                        listViewVideoCommentReplyRecord
                                                            .likeBy.length,
                                                        formatType:
                                                            FormatType.compact,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Be Vietnam Pro',
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                  ],
                ),
              );
            },
          ),
      ],
    );
  }
}
