import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'track_page_model.dart';
export 'track_page_model.dart';

class TrackPageWidget extends StatefulWidget {
  const TrackPageWidget({Key? key}) : super(key: key);

  @override
  _TrackPageWidgetState createState() => _TrackPageWidgetState();
}

class _TrackPageWidgetState extends State<TrackPageWidget> {
  late TrackPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrackPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'trackPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('TRACK_PAGE_PAGE_trackPage_ON_INIT_STATE');
      if (!loggedIn) {
        logFirebaseEvent('trackPage_navigate_to');

        context.goNamed('loginPage');
      }
    });

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

    return Title(
        title: 'Kidney247',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '1qp1cmex' /* Track */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Be Vietnam Pro',
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .displaySmallFamily),
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 6.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '7msgdc6f' /* 📝 */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 16.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'g11rm2f8' /* Explore each category below to... */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Be Vietnam Pro',
                                          fontSize: 16.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily),
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1.0,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 15.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'qs84ux6u' /* Daily Nutrient Intake */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Be Vietnam Pro',
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .headlineSmallFamily),
                                  ),
                            ),
                            Container(
                              width: 30.0,
                              height: 30.0,
                              child: custom_widgets.TooltipWidget(
                                width: 30.0,
                                height: 30.0,
                                message: FFLocalizations.of(context).getText(
                                  'cu3lgbvr' /* This is tooltip! */,
                                ),
                                icon: Icon(
                                  Icons.info_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 23.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'TRACK_PAGE_PAGE_ListTile_pr5xe6z0_ON_TAP');
                            logFirebaseEvent('ListTile_navigate_to');

                            context.pushNamed(
                              'trackNutrientPage',
                              queryParameters: {
                                'pageTitle': serializeParam(
                                  FFLocalizations.of(context).getText(
                                    'j5u5tgsr' /* Nutrient Tracking */,
                                  ),
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.analytics_rounded,
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            title: Text(
                              FFLocalizations.of(context).getText(
                                'o65l2jau' /* Nutrient Tracking */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Be Vietnam Pro',
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleMediumFamily),
                                  ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 20.0,
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            dense: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'TRACK_PAGE_PAGE_ListTile_116byxyj_ON_TAP');
                            logFirebaseEvent('ListTile_navigate_to');

                            context.pushNamed(
                              'trackFluidPage',
                              queryParameters: {
                                'pageTitle': serializeParam(
                                  FFLocalizations.of(context).getText(
                                    'fgpoj9vf' /* Fluid Intake */,
                                  ),
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.glassWhiskey,
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            title: Text(
                              FFLocalizations.of(context).getText(
                                'li42g1vs' /* Fluid Intake */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Be Vietnam Pro',
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleMediumFamily),
                                  ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 20.0,
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            dense: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: FlutterFlowTheme.of(context).primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'TRACK_PAGE_PAGE_ListTile_5fqvc49d_ON_TAP');
                              logFirebaseEvent('ListTile_navigate_to');

                              context.pushNamed('logMealPage');
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.add_circle,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              title: Text(
                                FFLocalizations.of(context).getText(
                                  'tmo8gvaq' /* Add a Meal */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Be Vietnam Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily),
                                    ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: FlutterFlowTheme.of(context).alternate,
                                size: 20.0,
                              ),
                              tileColor: FlutterFlowTheme.of(context).primary,
                              dense: false,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1.0,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'x42fy118' /* Lab Test Results  */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Be Vietnam Pro',
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineSmallFamily),
                                ),
                          ),
                          Container(
                            width: 30.0,
                            height: 30.0,
                            child: custom_widgets.TooltipWidget(
                              width: 30.0,
                              height: 30.0,
                              message: FFLocalizations.of(context).getText(
                                '4pejn85a' /* This is tooltip! */,
                              ),
                              icon: Icon(
                                Icons.info_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 23.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 15.0, 0.0, 20.0),
                        child: StreamBuilder<List<LabTestPhotoRecord>>(
                          stream: queryLabTestPhotoRecord(
                            queryBuilder: (labTestPhotoRecord) =>
                                labTestPhotoRecord.where('user_ref',
                                    isEqualTo: currentUserReference),
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
                            List<LabTestPhotoRecord>
                                containerLabTestPhotoRecordList =
                                snapshot.data!;
                            return Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  final listPhoto =
                                      containerLabTestPhotoRecordList.toList();
                                  if (listPhoto.isEmpty) {
                                    return Center(
                                      child: EmptyListWidget(
                                        name:
                                            FFLocalizations.of(context).getText(
                                          'buntcde8' /* Seems you don’t have any lab t... */,
                                        ),
                                        isDesc: false,
                                      ),
                                    );
                                  }
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(listPhoto.length,
                                          (listPhotoIndex) {
                                        final listPhotoItem =
                                            listPhoto[listPhotoIndex];
                                        return Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Stack(
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
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'TRACK_PAGE_PAGE_Image_cmi978iy_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Image_expand_image');
                                                      await Navigator.push(
                                                        context,
                                                        PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .fade,
                                                          child:
                                                              FlutterFlowExpandedImageView(
                                                            image:
                                                                Image.network(
                                                              listPhotoItem
                                                                  .photoUrl,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                            allowRotation:
                                                                false,
                                                            tag: listPhotoItem
                                                                .photoUrl,
                                                            useHeroAnimation:
                                                                true,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Hero(
                                                      tag: listPhotoItem
                                                          .photoUrl,
                                                      transitionOnUserGestures:
                                                          true,
                                                      child: Image.network(
                                                        listPhotoItem.photoUrl,
                                                        width: 180.0,
                                                        height: 300.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.12, -1.13),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2,
                                                      icon: Icon(
                                                        Icons.delete_rounded,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        size: 20.0,
                                                      ),
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'TRACK_delete_rounded_ICN_ON_TAP');
                                                        logFirebaseEvent(
                                                            'IconButton_delete_data');
                                                        await FirebaseStorage
                                                            .instance
                                                            .refFromURL(
                                                                listPhotoItem
                                                                    .photoUrl)
                                                            .delete();
                                                        logFirebaseEvent(
                                                            'IconButton_backend_call');
                                                        await listPhotoItem
                                                            .reference
                                                            .delete();
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 10.0),
                                                child: Text(
                                                  dateTimeFormat(
                                                    'd/M/y',
                                                    listPhotoItem.createdAt!,
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
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'TRACK_PAGE_PAGE_ListTile_s64f9j9x_ON_TAP');
                            logFirebaseEvent('ListTile_navigate_to');

                            context.pushNamed('uploadPhotoPage');
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.image,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            title: Text(
                              FFLocalizations.of(context).getText(
                                '2xi1l8tk' /* Add a Lab Result Photo */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Be Vietnam Pro',
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleMediumFamily),
                                  ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 20.0,
                            ),
                            tileColor: FlutterFlowTheme.of(context).primary,
                            dense: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1.0,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 15.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'h3bu1bo1' /* Vital Readings */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Be Vietnam Pro',
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .headlineSmallFamily),
                                  ),
                            ),
                            Container(
                              width: 30.0,
                              height: 30.0,
                              child: custom_widgets.TooltipWidget(
                                width: 30.0,
                                height: 30.0,
                                message: FFLocalizations.of(context).getText(
                                  'owq21kp1' /* This is tooltip! */,
                                ),
                                icon: Icon(
                                  Icons.info_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 23.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'TRACK_PAGE_PAGE_ListTile_kauw0tgg_ON_TAP');
                            logFirebaseEvent('ListTile_navigate_to');

                            context.pushNamed(
                              'trackFluidOutput',
                              queryParameters: {
                                'pageTitle': serializeParam(
                                  FFLocalizations.of(context).getText(
                                    '1h094oll' /* Fluid Output */,
                                  ),
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.water,
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            title: Text(
                              FFLocalizations.of(context).getText(
                                'ocbk5fg8' /* Fluid Output */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Be Vietnam Pro',
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleMediumFamily),
                                  ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 20.0,
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            dense: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'TRACK_PAGE_PAGE_ListTile_0e5mjs0z_ON_TAP');
                            logFirebaseEvent('ListTile_navigate_to');

                            context.pushNamed(
                              'trackBloodPressurePage',
                              queryParameters: {
                                'pageTitle': serializeParam(
                                  FFLocalizations.of(context).getText(
                                    '58ox2b7v' /* Blood Pressure */,
                                  ),
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.handHoldingHeart,
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            title: Text(
                              FFLocalizations.of(context).getText(
                                'kmc3v9dw' /* Blood Pressure */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Be Vietnam Pro',
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleMediumFamily),
                                  ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 20.0,
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            dense: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'TRACK_PAGE_PAGE_ListTile_6e25j2q7_ON_TAP');
                            logFirebaseEvent('ListTile_navigate_to');

                            context.pushNamed(
                              'trackBloodGlucosePage',
                              queryParameters: {
                                'pageTitle': serializeParam(
                                  FFLocalizations.of(context).getText(
                                    'apqbpejd' /* Blood Glucose */,
                                  ),
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.briefcaseMedical,
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            title: Text(
                              FFLocalizations.of(context).getText(
                                'wcuv26hh' /* Blood Glucose */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Be Vietnam Pro',
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleMediumFamily),
                                  ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 20.0,
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            dense: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: FlutterFlowTheme.of(context).primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'TRACK_PAGE_PAGE_ListTile_a082a83q_ON_TAP');
                              logFirebaseEvent('ListTile_navigate_to');

                              context.pushNamed('addVitalEntry');
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.add_circle,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              title: Text(
                                FFLocalizations.of(context).getText(
                                  'thj3zcz3' /* Add a Vitals Entry */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Be Vietnam Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily),
                                    ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: FlutterFlowTheme.of(context).alternate,
                                size: 20.0,
                              ),
                              tileColor: FlutterFlowTheme.of(context).primary,
                              dense: false,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1.0,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 15.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'rbe92whr' /* Lab Test Results */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Be Vietnam Pro',
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .headlineSmallFamily),
                                  ),
                            ),
                            Container(
                              width: 30.0,
                              height: 30.0,
                              child: custom_widgets.TooltipWidget(
                                width: 30.0,
                                height: 30.0,
                                message: FFLocalizations.of(context).getText(
                                  'ghev8ccw' /* This is tooltip! */,
                                ),
                                icon: Icon(
                                  Icons.info_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 23.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'TRACK_PAGE_PAGE_ListTile_7audu3ct_ON_TAP');
                            logFirebaseEvent('ListTile_navigate_to');

                            context.pushNamed(
                              'trackBloodGlucoseA1CPage',
                              queryParameters: {
                                'pageTitle': serializeParam(
                                  FFLocalizations.of(context).getText(
                                    'qjrgg185' /* Blood Glucose (A1C) */,
                                  ),
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.percentage,
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            title: Text(
                              FFLocalizations.of(context).getText(
                                'uvyjv2t1' /* Blood Glucose (A1C) */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Be Vietnam Pro',
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleMediumFamily),
                                  ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 20.0,
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            dense: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'TRACK_PAGE_PAGE_ListTile_419byxt2_ON_TAP');
                            logFirebaseEvent('ListTile_navigate_to');

                            context.pushNamed(
                              'trackGRFPage',
                              queryParameters: {
                                'pageTitle': serializeParam(
                                  FFLocalizations.of(context).getText(
                                    '2r7wmohs' /* GRF */,
                                  ),
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.filter_list_rounded,
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            title: Text(
                              FFLocalizations.of(context).getText(
                                'yexwk1tj' /* eGFR */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Be Vietnam Pro',
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleMediumFamily),
                                  ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 20.0,
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            dense: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'TRACK_PAGE_PAGE_ListTile_pz9v5q3l_ON_TAP');
                            logFirebaseEvent('ListTile_navigate_to');

                            context.pushNamed(
                              'trackAlbuminLabPage',
                              queryParameters: {
                                'pageTitle': serializeParam(
                                  FFLocalizations.of(context).getText(
                                    'b173qf4o' /* Albumin */,
                                  ),
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.note_add_rounded,
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            title: Text(
                              FFLocalizations.of(context).getText(
                                'k2wlo3lo' /* Albumin */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Be Vietnam Pro',
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleMediumFamily),
                                  ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 20.0,
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            dense: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'TRACK_PAGE_PAGE_ListTile_r56lf8bc_ON_TAP');
                            logFirebaseEvent('ListTile_navigate_to');

                            context.pushNamed(
                              'trackBUNPage',
                              queryParameters: {
                                'pageTitle': serializeParam(
                                  FFLocalizations.of(context).getText(
                                    '3xj9yops' /* Blood Urea Nitrogen */,
                                  ),
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.laptopMedical,
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            title: Text(
                              FFLocalizations.of(context).getText(
                                'knloy48k' /* Blood Urea Nitrogen */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Be Vietnam Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleMediumFamily),
                                  ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 20.0,
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            dense: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: FlutterFlowTheme.of(context).primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'TRACK_PAGE_PAGE_ListTile_6lxl6v2c_ON_TAP');
                              logFirebaseEvent('ListTile_navigate_to');

                              context.pushNamed('addLabTestResult');
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.add_circle,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              title: Text(
                                FFLocalizations.of(context).getText(
                                  '3mpifkao' /* Add a Lab Result */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Be Vietnam Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily),
                                    ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: FlutterFlowTheme.of(context).alternate,
                                size: 20.0,
                              ),
                              tileColor: FlutterFlowTheme.of(context).primary,
                              dense: false,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
