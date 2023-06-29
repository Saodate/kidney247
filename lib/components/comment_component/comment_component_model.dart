import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/comment_reply_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CommentComponentModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  bool isEdit = false;

  DocumentReference? videoCommentRef;

  DocumentReference? postCommentRef;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldReply widget.
  TextEditingController? textFieldReplyController;
  String? Function(BuildContext, String?)? textFieldReplyControllerValidator;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  /// Query cache managers for this widget.

  final _userCommentCacheManager = StreamRequestManager<UsersRecord>();
  Stream<UsersRecord> userCommentCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<UsersRecord> Function() requestFn,
  }) =>
      _userCommentCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserCommentCacheCache() => _userCommentCacheManager.clear();
  void clearUserCommentCacheCacheKey(String? uniqueKey) =>
      _userCommentCacheManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textFieldReplyController?.dispose();
    textController2?.dispose();

    /// Dispose query cache managers for this widget.

    clearUserCommentCacheCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
