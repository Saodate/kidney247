import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/search_post_widget.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_page/components/comment_component/comment_component_widget.dart';
import '/home_page/components/create_new_post_component/create_new_post_component_widget.dart';
import '/home_page/components/empty_list/empty_list_widget.dart';
import '/home_page/components/post_option_popup/post_option_popup_widget.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'community_page_model.dart';
export 'community_page_model.dart';

class CommunityPageWidget extends StatefulWidget {
  const CommunityPageWidget({Key? key}) : super(key: key);

  @override
  _CommunityPageWidgetState createState() => _CommunityPageWidgetState();
}

class _CommunityPageWidgetState extends State<CommunityPageWidget> {
  late CommunityPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'communityPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('COMMUNITY_communityPage_ON_INIT_STATE');
      if (!loggedIn) {
        logFirebaseEvent('communityPage_navigate_to');

        context.goNamed('loginPage');
      }
    });

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
        title: 'Community',
        color: FlutterFlowTheme.of(context).primary,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primary,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              title: Text(
                FFLocalizations.of(context).getText(
                  'hfpddkll' /* Kidney247 Community */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Be Vietnam Pro',
                      color: Colors.white,
                      fontSize: 20.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).headlineMediumFamily),
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: DefaultTabController(
                    length: 3,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment(0.0, 0),
                          child: TabBar(
                            labelColor: Colors.white,
                            unselectedLabelColor: Color(0xB3FFFFFF),
                            labelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Be Vietnam Pro',
                                  fontSize: 14.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                            indicatorColor:
                                FlutterFlowTheme.of(context).primary,
                            indicatorWeight: 3.0,
                            tabs: [
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  'j2nanf93' /* Forum post */,
                                ),
                              ),
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  'fqvy044x' /* Group chat */,
                                ),
                              ),
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  'pi1phr9j' /* Private chat */,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 100.0,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 20.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'COMMUNITY_CREATE_NEW_POST_BTN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Button_bottom_sheet');
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
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
                                                              padding: MediaQuery
                                                                      .of(context)
                                                                  .viewInsets,
                                                              child: Container(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.8,
                                                                child:
                                                                    CreateNewPostComponentWidget(),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'yw7s4x0d' /* Create new post */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 70.0,
                                                      height: 50.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Be Vietnam Pro',
                                                                color: Colors
                                                                    .white,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Builder(
                                                builder: (context) =>
                                                    FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderRadius: 10.0,
                                                  borderWidth: 2.0,
                                                  buttonSize: 40.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  icon: Icon(
                                                    Icons.search,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 20.0,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'COMMUNITY_PAGE_PAGE_search_ICN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'IconButton_alert_dialog');
                                                    await showAlignedDialog(
                                                      context: context,
                                                      isGlobal: true,
                                                      avoidOverflow: false,
                                                      targetAnchor:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      followerAnchor:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      builder: (dialogContext) {
                                                        return Material(
                                                          color: Colors
                                                              .transparent,
                                                          child:
                                                              GestureDetector(
                                                            onTap: () => FocusScope
                                                                    .of(context)
                                                                .requestFocus(
                                                                    _unfocusNode),
                                                            child:
                                                                SearchPostWidget(),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 15.0),
                                          child:
                                              StreamBuilder<List<PostsRecord>>(
                                            stream: _model.postCache(
                                              requestFn: () => queryPostsRecord(
                                                queryBuilder: (postsRecord) =>
                                                    postsRecord.orderBy(
                                                        'createdAt',
                                                        descending: true),
                                              ),
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
                                              List<PostsRecord>
                                                  listViewPostsRecordList =
                                                  snapshot.data!;
                                              if (listViewPostsRecordList
                                                  .isEmpty) {
                                                return EmptyListWidget(
                                                  name: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'eks6yhzk' /* No post yet! */,
                                                  ),
                                                );
                                              }
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    listViewPostsRecordList
                                                        .length,
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewPostsRecord =
                                                      listViewPostsRecordList[
                                                          listViewIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 10.0),
                                                    child: StreamBuilder<
                                                        UsersRecord>(
                                                      stream: UsersRecord
                                                          .getDocument(
                                                              listViewPostsRecord
                                                                  .userRef!),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 40.0,
                                                              height: 40.0,
                                                              child:
                                                                  SpinKitCircle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .teal,
                                                                size: 40.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final containerPostsUsersRecord =
                                                            snapshot.data!;
                                                        return Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent4,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        10.0,
                                                                        10.0,
                                                                        10.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
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
                                                                              logFirebaseEvent('COMMUNITY_CircleImage_4u8bk7n4_ON_TAP');
                                                                              logFirebaseEvent('CircleImage_navigate_to');

                                                                              context.pushNamed(
                                                                                'userProfile',
                                                                                queryParameters: {
                                                                                  'userRef': serializeParam(
                                                                                    listViewPostsRecord.userRef,
                                                                                    ParamType.DocumentReference,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 40.0,
                                                                              height: 40.0,
                                                                              clipBehavior: Clip.antiAlias,
                                                                              decoration: BoxDecoration(
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: Image.network(
                                                                                valueOrDefault<String>(
                                                                                  containerPostsUsersRecord.photoUrl,
                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/kidney-s1k692/assets/kb3k8basj6js/105356-kidney-loading.gif',
                                                                                ),
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
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      containerPostsUsersRecord.displayName,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Be Vietnam Pro',
                                                                                            fontSize: 16.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'va7b0jmq' /* Join  */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Be Vietnam Pro',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 14.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      dateTimeFormat(
                                                                                        'relative',
                                                                                        containerPostsUsersRecord.createdTime!,
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Be Vietnam Pro',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 14.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      if (listViewPostsRecord
                                                                              .userRef ==
                                                                          currentUserReference)
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
                                                                            logFirebaseEvent('COMMUNITY_PAGE_PAGE_Icon_pc4wkd7c_ON_TAP');
                                                                            logFirebaseEvent('Icon_bottom_sheet');
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.of(context).viewInsets,
                                                                                    child: Container(
                                                                                      height: 100.0,
                                                                                      child: PostOptionPopupWidget(
                                                                                        postRef: listViewPostsRecord.reference,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.more_vert_sharp,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                5.0),
                                                                            child:
                                                                                Text(
                                                                              listViewPostsRecord.content,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    fontSize: 14.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        if (listViewPostsRecord.image !=
                                                                            '')
                                                                          Expanded(
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                logFirebaseEvent('COMMUNITY_Image_gvzpnoh7_ON_TAP');
                                                                                logFirebaseEvent('Image_expand_image');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    child: FlutterFlowExpandedImageView(
                                                                                      image: Image.network(
                                                                                        listViewPostsRecord.image,
                                                                                        fit: BoxFit.contain,
                                                                                      ),
                                                                                      allowRotation: true,
                                                                                      tag: listViewPostsRecord.image,
                                                                                      useHeroAnimation: true,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Hero(
                                                                                tag: listViewPostsRecord.image,
                                                                                transitionOnUserGestures: true,
                                                                                child: Image.network(
                                                                                  listViewPostsRecord.image,
                                                                                  width: 500.0,
                                                                                  height: 200.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                StreamBuilder<
                                                                    List<
                                                                        PostCommentsRecord>>(
                                                                  stream:
                                                                      queryPostCommentsRecord(
                                                                    queryBuilder: (postCommentsRecord) => postCommentsRecord.where(
                                                                        'postRef',
                                                                        isEqualTo:
                                                                            listViewPostsRecord.reference),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              40.0,
                                                                          height:
                                                                              40.0,
                                                                          child:
                                                                              SpinKitCircle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).teal,
                                                                            size:
                                                                                40.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<PostCommentsRecord>
                                                                        containerPostCommentsRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    return Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                ToggleIcon(
                                                                                  onPressed: () async {
                                                                                    final likedByElement = currentUserReference;
                                                                                    final likedByUpdate = listViewPostsRecord.likedBy.contains(likedByElement) ? FieldValue.arrayRemove([likedByElement]) : FieldValue.arrayUnion([likedByElement]);
                                                                                    final postsUpdateData = {
                                                                                      'likedBy': likedByUpdate,
                                                                                    };
                                                                                    await listViewPostsRecord.reference.update(postsUpdateData);
                                                                                  },
                                                                                  value: listViewPostsRecord.likedBy.contains(currentUserReference),
                                                                                  onIcon: Icon(
                                                                                    Icons.favorite_rounded,
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    size: 25.0,
                                                                                  ),
                                                                                  offIcon: Icon(
                                                                                    Icons.favorite_border_outlined,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 25.0,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  formatNumber(
                                                                                    listViewPostsRecord.likedBy.length,
                                                                                    formatType: FormatType.compact,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Be Vietnam Pro',
                                                                                        fontSize: 12.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('COMMUNITY_PAGE_PAGE_Icon_z5t5o1gp_ON_TAP');
                                                                                      logFirebaseEvent('Icon_bottom_sheet');
                                                                                      await showModalBottomSheet(
                                                                                        isScrollControlled: true,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        enableDrag: false,
                                                                                        context: context,
                                                                                        builder: (context) {
                                                                                          return GestureDetector(
                                                                                            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                            child: Padding(
                                                                                              padding: MediaQuery.of(context).viewInsets,
                                                                                              child: Container(
                                                                                                height: 710.0,
                                                                                                child: CommentComponentWidget(
                                                                                                  postRef: listViewPostsRecord.reference,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => setState(() {}));
                                                                                    },
                                                                                    child: FaIcon(
                                                                                      FontAwesomeIcons.commentAlt,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      size: 20.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                  child: StreamBuilder<List<PostCommentReplyRecord>>(
                                                                                    stream: queryPostCommentReplyRecord(
                                                                                      queryBuilder: (postCommentReplyRecord) => postCommentReplyRecord.where('postRef', isEqualTo: listViewPostsRecord.reference),
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
                                                                                      List<PostCommentReplyRecord> textPostCommentReplyRecordList = snapshot.data!;
                                                                                      return Text(
                                                                                        (containerPostCommentsRecordList.length + textPostCommentReplyRecordList.length).toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Be Vietnam Pro',
                                                                                              fontSize: 12.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Text(
                                                                              dateTimeFormat(
                                                                                'relative',
                                                                                listViewPostsRecord.createdAt!,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 14.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
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
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 100.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            40.0, 30.0, 40.0, 30.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'COMMUNITY_CREATE_NEW_GROUP_BTN_ON_TAP');
                                            logFirebaseEvent(
                                                'Button_navigate_to');

                                            context
                                                .pushNamed('createGroupchat');
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'sxm7tohc' /* Create new group */,
                                          ),
                                          options: FFButtonOptions(
                                            width: 70.0,
                                            height: 20.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          'Be Vietnam Pro',
                                                      color: Colors.white,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily),
                                                    ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        if (FFLocalizations.of(context)
                                                .languageCode !=
                                            'en')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 24.0),
                                            child: Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              child: StreamBuilder<ChatsRecord>(
                                                stream: ChatsRecord.getDocument(
                                                    FFAppState().groupChatRef!),
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
                                                  final listTileViChatsRecord =
                                                      snapshot.data!;
                                                  return InkWell(
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
                                                          'COMMUNITY_PAGE_PAGE_ListTileVi_ON_TAP');
                                                      logFirebaseEvent(
                                                          'ListTileVi_group_chat_action');
                                                      _model.groupChat =
                                                          await FFChatManager
                                                              .instance
                                                              .addGroupMembers(
                                                        listTileViChatsRecord,
                                                        [currentUserReference!],
                                                      );
                                                      logFirebaseEvent(
                                                          'ListTileVi_navigate_to');

                                                      context.pushNamed(
                                                        'ChatPage',
                                                        queryParameters: {
                                                          'chatRef':
                                                              serializeParam(
                                                            FFAppState()
                                                                .groupChatRef,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                      );

                                                      setState(() {});
                                                    },
                                                    child: ListTile(
                                                      leading: Icon(
                                                        Icons
                                                            .mark_chat_unread_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        size: 20.0,
                                                      ),
                                                      title: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'uactlxuw' /* Chronic kidney disease */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLargeFamily,
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      18.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleLargeFamily),
                                                                  lineHeight:
                                                                      1.0,
                                                                ),
                                                      ),
                                                      subtitle: Text(
                                                        listTileViChatsRecord
                                                                .lastMessageSeenBy
                                                                .contains(
                                                                    currentUserReference)
                                                            ? ' '
                                                            : (FFLocalizations.of(
                                                                            context)
                                                                        .languageCode ==
                                                                    'en'
                                                                ? 'New message 🆕'
                                                                : 'Có tin nhắn mới 🆕'),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  color: Colors
                                                                      .white,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily),
                                                                ),
                                                      ),
                                                      trailing: Icon(
                                                        Icons
                                                            .keyboard_arrow_right_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 20.0,
                                                      ),
                                                      tileColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      dense: false,
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  10.0,
                                                                  10.0,
                                                                  10.0),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        if (FFLocalizations.of(context)
                                                .languageCode ==
                                            'en')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 24.0, 24.0, 24.0),
                                            child: Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              child: StreamBuilder<ChatsRecord>(
                                                stream: ChatsRecord.getDocument(
                                                    FFAppState()
                                                        .groupChatEnRef1!),
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
                                                  final listTileEnChatsRecord =
                                                      snapshot.data!;
                                                  return InkWell(
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
                                                          'COMMUNITY_PAGE_PAGE_ListTileEn_ON_TAP');
                                                      logFirebaseEvent(
                                                          'ListTileEn_group_chat_action');
                                                      _model.groupChatEn1 =
                                                          await FFChatManager
                                                              .instance
                                                              .addGroupMembers(
                                                        listTileEnChatsRecord,
                                                        [currentUserReference!],
                                                      );
                                                      logFirebaseEvent(
                                                          'ListTileEn_navigate_to');

                                                      context.pushNamed(
                                                        'ChatPage',
                                                        queryParameters: {
                                                          'chatRef':
                                                              serializeParam(
                                                            FFAppState()
                                                                .groupChatEnRef1,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                      );

                                                      setState(() {});
                                                    },
                                                    child: ListTile(
                                                      leading: Icon(
                                                        Icons.chat_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        size: 30.0,
                                                      ),
                                                      title: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'yty89zcx' /* Chronic kidney disease */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLargeFamily,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleLargeFamily),
                                                                  lineHeight:
                                                                      1.0,
                                                                ),
                                                      ),
                                                      subtitle: Text(
                                                        listTileEnChatsRecord
                                                                .lastMessageSeenBy
                                                                .contains(
                                                                    currentUserReference)
                                                            ? ' '
                                                            : (FFLocalizations.of(
                                                                            context)
                                                                        .languageCode ==
                                                                    'en'
                                                                ? 'New message 🆕'
                                                                : 'Có tin nhắn mới 🆕'),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                      ),
                                                      trailing: Icon(
                                                        Icons
                                                            .keyboard_arrow_right_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 30.0,
                                                      ),
                                                      tileColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      dense: false,
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  10.0,
                                                                  10.0,
                                                                  10.0),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        if (FFLocalizations.of(context)
                                                .languageCode !=
                                            'en')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 24.0, 24.0, 24.0),
                                            child: Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              child: StreamBuilder<ChatsRecord>(
                                                stream: ChatsRecord.getDocument(
                                                    FFAppState()
                                                        .groupChat2Ref!),
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
                                                  final listTileViChatsRecord =
                                                      snapshot.data!;
                                                  return InkWell(
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
                                                          'COMMUNITY_PAGE_PAGE_ListTileVi_ON_TAP');
                                                      logFirebaseEvent(
                                                          'ListTileVi_group_chat_action');
                                                      _model.groupChat2 =
                                                          await FFChatManager
                                                              .instance
                                                              .addGroupMembers(
                                                        listTileViChatsRecord,
                                                        [currentUserReference!],
                                                      );
                                                      logFirebaseEvent(
                                                          'ListTileVi_navigate_to');

                                                      context.pushNamed(
                                                        'ChatPage',
                                                        queryParameters: {
                                                          'chatRef':
                                                              serializeParam(
                                                            FFAppState()
                                                                .groupChat2Ref,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                      );

                                                      setState(() {});
                                                    },
                                                    child: ListTile(
                                                      leading: Icon(
                                                        Icons.chat_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        size: 20.0,
                                                      ),
                                                      title: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'lds0wzyy' /* Hemodialysis */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLargeFamily,
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      18.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleLargeFamily),
                                                                ),
                                                      ),
                                                      subtitle: Text(
                                                        listTileViChatsRecord
                                                                .lastMessageSeenBy
                                                                .contains(
                                                                    currentUserReference)
                                                            ? ' '
                                                            : (FFLocalizations.of(
                                                                            context)
                                                                        .languageCode ==
                                                                    'en'
                                                                ? 'New message 🆕'
                                                                : 'Có tin nhắn mới 🆕'),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  color: Colors
                                                                      .white,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily),
                                                                ),
                                                      ),
                                                      trailing: Icon(
                                                        Icons
                                                            .keyboard_arrow_right_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 20.0,
                                                      ),
                                                      tileColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .teal,
                                                      dense: false,
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  10.0,
                                                                  10.0,
                                                                  10.0),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        if (FFLocalizations.of(context)
                                                .languageCode ==
                                            'en')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 24.0, 24.0, 24.0),
                                            child: Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              child: StreamBuilder<ChatsRecord>(
                                                stream: ChatsRecord.getDocument(
                                                    FFAppState()
                                                        .groupChatEnRef2!),
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
                                                  final listTileEnChatsRecord =
                                                      snapshot.data!;
                                                  return InkWell(
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
                                                          'COMMUNITY_PAGE_PAGE_ListTileEn_ON_TAP');
                                                      logFirebaseEvent(
                                                          'ListTileEn_group_chat_action');
                                                      _model.groupChatEn2 =
                                                          await FFChatManager
                                                              .instance
                                                              .addGroupMembers(
                                                        listTileEnChatsRecord,
                                                        [currentUserReference!],
                                                      );
                                                      logFirebaseEvent(
                                                          'ListTileEn_navigate_to');

                                                      context.pushNamed(
                                                        'ChatPage',
                                                        queryParameters: {
                                                          'chatRef':
                                                              serializeParam(
                                                            FFAppState()
                                                                .groupChatEnRef2,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                      );

                                                      setState(() {});
                                                    },
                                                    child: ListTile(
                                                      leading: Icon(
                                                        Icons.chat_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        size: 30.0,
                                                      ),
                                                      title: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'shtm8gvs' /* Hemodialysis */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge,
                                                      ),
                                                      subtitle: Text(
                                                        listTileEnChatsRecord
                                                                .lastMessageSeenBy
                                                                .contains(
                                                                    currentUserReference)
                                                            ? ' '
                                                            : (FFLocalizations.of(
                                                                            context)
                                                                        .languageCode ==
                                                                    'en'
                                                                ? 'New message 🆕'
                                                                : 'Có tin nhắn mới 🆕'),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                      ),
                                                      trailing: Icon(
                                                        Icons
                                                            .keyboard_arrow_right_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 30.0,
                                                      ),
                                                      tileColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .teal,
                                                      dense: false,
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  10.0,
                                                                  10.0,
                                                                  10.0),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    Expanded(
                                      child: StreamBuilder<List<ChatsRecord>>(
                                        stream: queryChatsRecord(
                                          queryBuilder: (chatsRecord) =>
                                              chatsRecord
                                                  .where(
                                                      'isSystemGroup',
                                                      isEqualTo: false)
                                                  .where(
                                                      'users',
                                                      arrayContains:
                                                          currentUserReference)
                                                  .orderBy('last_message_time',
                                                      descending: true),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 40.0,
                                                height: 40.0,
                                                child: SpinKitCircle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .teal,
                                                  size: 40.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<ChatsRecord>
                                              listViewChatsRecordList =
                                              snapshot.data!;
                                          if (listViewChatsRecordList.isEmpty) {
                                            return EmptyListWidget(
                                              name: FFLocalizations.of(context)
                                                  .getText(
                                                'y2og2aby' /* No group chat yet! */,
                                              ),
                                              isDesc: false,
                                            );
                                          }
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewChatsRecordList.length,
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewChatsRecord =
                                                  listViewChatsRecordList[
                                                      listViewIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'COMMUNITY_Container_5aw8jvxf_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Container_navigate_to');

                                                  context.pushNamed(
                                                    'ChatPage',
                                                    queryParameters: {
                                                      'chatRef': serializeParam(
                                                        listViewChatsRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                      'isGroupChat':
                                                          serializeParam(
                                                        true,
                                                        ParamType.bool,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Card(
                                                              clipBehavior: Clip
                                                                  .antiAliasWithSaveLayer,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              elevation: 2.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            2.0,
                                                                            2.0,
                                                                            2.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'COMMUNITY_PAGE_PAGE_userAvatar_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'userAvatar_navigate_to');

                                                                    context.pushNamed(
                                                                        'profilePage');
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        listViewChatsRecord
                                                                            .groupChatImage,
                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/kidney-s1k692/assets/kb3k8basj6js/105356-kidney-loading.gif',
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Stack(
                                                                    children: [
                                                                      if (listViewChatsRecord
                                                                          .lastMessageSeenBy
                                                                          .contains(
                                                                              currentUserReference))
                                                                        Text(
                                                                          listViewChatsRecord
                                                                              .groupChatName,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Be Vietnam Pro',
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      if (!listViewChatsRecord
                                                                          .lastMessageSeenBy
                                                                          .contains(
                                                                              currentUserReference))
                                                                        Text(
                                                                          listViewChatsRecord
                                                                              .groupChatName,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Be Vietnam Pro',
                                                                                fontWeight: FontWeight.bold,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                  Stack(
                                                                    children: [
                                                                      if (listViewChatsRecord
                                                                          .lastMessageSeenBy
                                                                          .contains(
                                                                              currentUserReference))
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            StreamBuilder<UsersRecord>(
                                                                              stream: UsersRecord.getDocument(listViewChatsRecord.lastMessageSentBy!),
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
                                                                                final textUsersRecord = snapshot.data!;
                                                                                return Text(
                                                                                  FFLocalizations.of(context).languageCode == 'en' ? (listViewChatsRecord.lastMessageSentBy == currentUserReference ? 'You: ' : '${textUsersRecord.displayName}: ') : (listViewChatsRecord.lastMessageSentBy == currentUserReference ? 'Bạn:' : '${textUsersRecord.displayName}:'),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Be Vietnam Pro',
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                );
                                                                              },
                                                                            ),
                                                                            Text(
                                                                              listViewChatsRecord.lastMessage.maybeHandleOverflow(
                                                                                maxChars: 40,
                                                                                replacement: '…',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      if (!listViewChatsRecord
                                                                          .lastMessageSeenBy
                                                                          .contains(
                                                                              currentUserReference))
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            StreamBuilder<UsersRecord>(
                                                                              stream: UsersRecord.getDocument(listViewChatsRecord.lastMessageSentBy!),
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
                                                                                final textUsersRecord = snapshot.data!;
                                                                                return Text(
                                                                                  FFLocalizations.of(context).languageCode == 'en' ? (listViewChatsRecord.lastMessageSentBy == currentUserReference ? 'You: ' : '${textUsersRecord.displayName}: ') : (listViewChatsRecord.lastMessageSentBy == currentUserReference ? 'Bạn:' : '${textUsersRecord.displayName}:'),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Be Vietnam Pro',
                                                                                        fontWeight: FontWeight.bold,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                );
                                                                              },
                                                                            ),
                                                                            Text(
                                                                              listViewChatsRecord.lastMessage.maybeHandleOverflow(
                                                                                maxChars: 40,
                                                                                replacement: '…',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Be Vietnam Pro',
                                                                                    fontWeight: FontWeight.bold,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Stack(
                                                          children: [
                                                            if (listViewChatsRecord
                                                                .lastMessageSeenBy
                                                                .contains(
                                                                    currentUserReference))
                                                              Text(
                                                                dateTimeFormat(
                                                                  'relative',
                                                                  listViewChatsRecord
                                                                      .lastMessageTime!,
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
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                            if (!listViewChatsRecord
                                                                .lastMessageSeenBy
                                                                .contains(
                                                                    currentUserReference))
                                                              Text(
                                                                dateTimeFormat(
                                                                  'relative',
                                                                  listViewChatsRecord
                                                                      .lastMessageTime!,
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
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: StreamBuilder<List<ChatsRecord>>(
                                    stream: queryChatsRecord(
                                      queryBuilder: (chatsRecord) => chatsRecord
                                          .where('users',
                                              arrayContains:
                                                  currentUserReference)
                                          .where('isPrivate', isEqualTo: true)
                                          .orderBy('last_message_time',
                                              descending: true),
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
                                      List<ChatsRecord>
                                          listViewChatsRecordList =
                                          snapshot.data!;
                                      if (listViewChatsRecordList.isEmpty) {
                                        return EmptyListWidget(
                                          name: FFLocalizations.of(context)
                                              .getText(
                                            'j19ffhjx' /* Find an user and click 'Chat' ... */,
                                          ),
                                          isDesc: false,
                                        );
                                      }
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewChatsRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewChatsRecord =
                                              listViewChatsRecordList[
                                                  listViewIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 12.0),
                                            child: StreamBuilder<UsersRecord>(
                                              stream: UsersRecord.getDocument(
                                                  listViewChatsRecord.users
                                                      .where((e) =>
                                                          e !=
                                                          currentUserReference)
                                                      .toList()
                                                      .first),
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
                                                final containerUsersRecord =
                                                    snapshot.data!;
                                                return InkWell(
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
                                                        'COMMUNITY_Container_nh1nil1y_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Container_navigate_to');

                                                    context.pushNamed(
                                                      'ChatPage',
                                                      queryParameters: {
                                                        'chatRef':
                                                            serializeParam(
                                                          listViewChatsRecord
                                                              .reference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                        'chatUser':
                                                            serializeParam(
                                                          containerUsersRecord,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'chatUser':
                                                            containerUsersRecord,
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Card(
                                                                clipBehavior: Clip
                                                                    .antiAliasWithSaveLayer,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                elevation: 2.0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          2.0,
                                                                          2.0,
                                                                          2.0),
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
                                                                          'COMMUNITY_PAGE_PAGE_userAvatar_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'userAvatar_navigate_to');

                                                                      context.pushNamed(
                                                                          'profilePage');
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          containerUsersRecord
                                                                              .photoUrl,
                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/kidney-s1k692/assets/kb3k8basj6js/105356-kidney-loading.gif',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Stack(
                                                                      children: [
                                                                        if (listViewChatsRecord
                                                                            .users
                                                                            .contains(currentUserReference))
                                                                          Text(
                                                                            containerUsersRecord.displayName,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Be Vietnam Pro',
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        if (!listViewChatsRecord
                                                                            .users
                                                                            .contains(currentUserReference))
                                                                          Text(
                                                                            containerUsersRecord.displayName,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Be Vietnam Pro',
                                                                                  fontWeight: FontWeight.bold,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                    Stack(
                                                                      children: [
                                                                        if (listViewChatsRecord
                                                                            .users
                                                                            .contains(currentUserReference))
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).languageCode == 'en' ? (listViewChatsRecord.lastMessageSentBy == currentUserReference ? 'You: ' : '${containerUsersRecord.displayName}: ') : (listViewChatsRecord.lastMessageSentBy == currentUserReference ? 'Bạn:' : '${containerUsersRecord.displayName}:'),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                listViewChatsRecord.lastMessage.maybeHandleOverflow(
                                                                                  maxChars: 40,
                                                                                  replacement: '…',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        if (!listViewChatsRecord
                                                                            .users
                                                                            .contains(currentUserReference))
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).languageCode == 'en' ? (listViewChatsRecord.lastMessageSentBy == currentUserReference ? 'You: ' : '${containerUsersRecord.displayName}: ') : (listViewChatsRecord.lastMessageSentBy == currentUserReference ? 'Bạn:' : '${containerUsersRecord.displayName}:'),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      fontWeight: FontWeight.bold,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                listViewChatsRecord.lastMessage.maybeHandleOverflow(
                                                                                  maxChars: 40,
                                                                                  replacement: '…',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Be Vietnam Pro',
                                                                                      fontWeight: FontWeight.bold,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Stack(
                                                            children: [
                                                              if (listViewChatsRecord
                                                                  .users
                                                                  .contains(
                                                                      currentUserReference))
                                                                Text(
                                                                  dateTimeFormat(
                                                                    'relative',
                                                                    listViewChatsRecord
                                                                        .lastMessageTime!,
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
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              if (!listViewChatsRecord
                                                                  .users
                                                                  .contains(
                                                                      currentUserReference))
                                                                Text(
                                                                  dateTimeFormat(
                                                                    'relative',
                                                                    listViewChatsRecord
                                                                        .lastMessageTime!,
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
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
