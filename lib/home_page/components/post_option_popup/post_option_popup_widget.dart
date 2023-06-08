import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home_page/components/create_new_post_component/create_new_post_component_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'post_option_popup_model.dart';
export 'post_option_popup_model.dart';

class PostOptionPopupWidget extends StatefulWidget {
  const PostOptionPopupWidget({
    Key? key,
    required this.postRef,
  }) : super(key: key);

  final DocumentReference? postRef;

  @override
  _PostOptionPopupWidgetState createState() => _PostOptionPopupWidgetState();
}

class _PostOptionPopupWidgetState extends State<PostOptionPopupWidget> {
  late PostOptionPopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostOptionPopupModel());

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
      height: 100.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('POST_OPTION_POPUP_ListTile_8xivgadk_ON_T');
              logFirebaseEvent('ListTile_bottom_sheet');
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: CreateNewPostComponentWidget(
                        postRef: widget.postRef,
                      ),
                    ),
                  );
                },
              ).then((value) => setState(() {}));
            },
            child: ListTile(
              leading: FaIcon(
                FontAwesomeIcons.solidEdit,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 20.0,
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  '90i8oiim' /* Edit */,
                ),
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Be Vietnam Pro',
                      fontSize: 16.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).headlineSmallFamily),
                    ),
              ),
              tileColor: FlutterFlowTheme.of(context).secondaryBackground,
              dense: false,
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('POST_OPTION_POPUP_ListTile_6z1sgshy_ON_T');
              logFirebaseEvent('ListTile_backend_call');
              await widget.postRef!.delete();
            },
            child: ListTile(
              leading: Icon(
                Icons.delete_forever,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 20.0,
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'sm4skv6k' /* Delete */,
                ),
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Be Vietnam Pro',
                      fontSize: 16.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).headlineSmallFamily),
                    ),
              ),
              tileColor: FlutterFlowTheme.of(context).secondaryBackground,
              dense: false,
            ),
          ),
        ],
      ),
    );
  }
}
