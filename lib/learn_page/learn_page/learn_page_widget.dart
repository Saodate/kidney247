import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home_page/components/comment_component/comment_component_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'learn_page_model.dart';
export 'learn_page_model.dart';

class LearnPageWidget extends StatefulWidget {
  const LearnPageWidget({Key? key}) : super(key: key);

  @override
  _LearnPageWidgetState createState() => _LearnPageWidgetState();
}

class _LearnPageWidgetState extends State<LearnPageWidget> {
  late LearnPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  int get pageViewCurrentIndex => _model.pageViewController != null &&
          _model.pageViewController!.hasClients &&
          _model.pageViewController!.page != null
      ? _model.pageViewController!.page!.round()
      : 0;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LearnPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'learnPage'});
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
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: StreamBuilder<List<VideosRecord>>(
                stream: queryVideosRecord(
                  queryBuilder: (videosRecord) => videosRecord
                      .where('isLive', isEqualTo: true)
                      .where('language',
                          isEqualTo: FFLocalizations.of(context).languageCode)
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
                  List<VideosRecord> pageViewVideosRecordList = snapshot.data!;
                  return Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 1.0,
                    child: PageView.builder(
                      controller: _model.pageViewController ??= PageController(
                          initialPage:
                              min(0, pageViewVideosRecordList.length - 1)),
                      scrollDirection: Axis.vertical,
                      itemCount: pageViewVideosRecordList.length,
                      itemBuilder: (context, pageViewIndex) {
                        final pageViewVideosRecord =
                            pageViewVideosRecordList[pageViewIndex];
                        return Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF1A1F24),
                              ),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: custom_widgets.VideoLoader(
                                  width: double.infinity,
                                  height: double.infinity,
                                  videoUrl: pageViewVideosRecord.videoUrl,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, 0.5),
                              child: StreamBuilder<List<VideoCommentsRecord>>(
                                stream: queryVideoCommentsRecord(
                                  queryBuilder: (videoCommentsRecord) =>
                                      videoCommentsRecord.where('video_ref',
                                          isEqualTo:
                                              pageViewVideosRecord.reference),
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
                                  List<VideoCommentsRecord>
                                      containerVideoCommentsRecordList =
                                      snapshot.data!;
                                  return Container(
                                    width: 80.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x33000000),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2.0, 2.0, 2.0, 2.0),
                                            child: Container(
                                              width: 50.0,
                                              height: 50.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                'assets/images/Kidney247logo-whitebackground.png',
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 10.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              ToggleIcon(
                                                onPressed: () async {
                                                  final likesByElement =
                                                      currentUserReference;
                                                  final likesByUpdate =
                                                      pageViewVideosRecord
                                                              .likesBy
                                                              .contains(
                                                                  likesByElement)
                                                          ? FieldValue
                                                              .arrayRemove([
                                                              likesByElement
                                                            ])
                                                          : FieldValue
                                                              .arrayUnion([
                                                              likesByElement
                                                            ]);
                                                  final videosUpdateData = {
                                                    'likes_by': likesByUpdate,
                                                  };
                                                  await pageViewVideosRecord
                                                      .reference
                                                      .update(videosUpdateData);
                                                  logFirebaseEvent(
                                                      'LEARN_ToggleIcon_44db670t_ON_TOGGLE');
                                                  if (!loggedIn) {
                                                    logFirebaseEvent(
                                                        'ToggleIcon_show_snack_bar');
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          FFLocalizations.of(
                                                                          context)
                                                                      .languageCode ==
                                                                  'en'
                                                              ? 'You have to log in to like this video!'
                                                              : 'Bạn phải đăng nhập để thích video này!',
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Be Vietnam Pro',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                },
                                                value: pageViewVideosRecord
                                                    .likesBy
                                                    .contains(
                                                        currentUserReference),
                                                onIcon: Icon(
                                                  Icons.favorite,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 30.0,
                                                ),
                                                offIcon: Icon(
                                                  Icons.favorite,
                                                  color: Colors.white,
                                                  size: 30.0,
                                                ),
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  formatNumber(
                                                    pageViewVideosRecord
                                                        .likesBy.length,
                                                    formatType:
                                                        FormatType.compact,
                                                  ),
                                                  '0',
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Be Vietnam Pro',
                                                          color: Colors.white,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 10.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'LEARN_PAGE_PAGE_Icon_6u53csoy_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Icon_bottom_sheet');
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () => FocusScope
                                                                .of(context)
                                                            .requestFocus(
                                                                _unfocusNode),
                                                        child: Padding(
                                                          padding:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .viewInsets,
                                                          child:
                                                              CommentComponentWidget(
                                                            videoRef:
                                                                pageViewVideosRecord
                                                                    .reference,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));
                                                },
                                                child: FaIcon(
                                                  FontAwesomeIcons
                                                      .solidCommentDots,
                                                  color: Colors.white,
                                                  size: 30.0,
                                                ),
                                              ),
                                              StreamBuilder<
                                                  List<
                                                      VideoCommentReplyRecord>>(
                                                stream:
                                                    queryVideoCommentReplyRecord(
                                                  queryBuilder: (videoCommentReplyRecord) =>
                                                      videoCommentReplyRecord.where(
                                                          'videoRef',
                                                          isEqualTo:
                                                              pageViewVideosRecord
                                                                  .reference),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        child: SpinKitCircle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .teal,
                                                          size: 40.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<VideoCommentReplyRecord>
                                                      textVideoCommentReplyRecordList =
                                                      snapshot.data!;
                                                  return Text(
                                                    (containerVideoCommentsRecordList
                                                                .length +
                                                            textVideoCommentReplyRecordList
                                                                .length)
                                                        .toString(),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Be Vietnam Pro',
                                                          color: Colors.white,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Builder(
                                              builder: (context) => InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'LEARN_PAGE_PAGE_Icon_25di408h_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Icon_share');
                                                  await Share.share(
                                                    'https://app.kidney247.com/share/${pageViewVideosRecord.reference.id}?',
                                                    sharePositionOrigin:
                                                        getWidgetBoundingBox(
                                                            context),
                                                  );
                                                },
                                                child: FaIcon(
                                                  FontAwesomeIcons.share,
                                                  color: Colors.white,
                                                  size: 30.0,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '28kbxv8n' /* Share */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Be Vietnam Pro',
                                                        color: Colors.white,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Color(0x00010101), Colors.black],
                                    stops: [0.0, 1.0],
                                    begin: AlignmentDirectional(0.0, -1.0),
                                    end: AlignmentDirectional(0, 1.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Text(
                                          pageViewVideosRecord.title,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Be Vietnam Pro',
                                                color: Colors.white,
                                                fontSize: 16.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: Text(
                                          pageViewVideosRecord.description,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Be Vietnam Pro',
                                                color: Colors.white,
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
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
