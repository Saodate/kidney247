import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_page/components/comment_component/comment_component_widget.dart';
import '/home_page/components/empty_list/empty_list_widget.dart';
import '/home_page/components/post_option_popup/post_option_popup_widget.dart';
import '/flutter_flow/request_manager.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserProfileModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<DocumentReference> listUser = [];
  void addToListUser(DocumentReference item) => listUser.add(item);
  void removeFromListUser(DocumentReference item) => listUser.remove(item);
  void removeAtIndexFromListUser(int index) => listUser.removeAt(index);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? chat;
  // Stores action output result for [Group Chat Action] action in Button widget.
  ChatsRecord? groupChat;

  /// Query cache managers for this widget.

  final _userPostProfileManager = StreamRequestManager<List<PostsRecord>>();
  Stream<List<PostsRecord>> userPostProfile({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<PostsRecord>> Function() requestFn,
  }) =>
      _userPostProfileManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserPostProfileCache() => _userPostProfileManager.clear();
  void clearUserPostProfileCacheKey(String? uniqueKey) =>
      _userPostProfileManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    /// Dispose query cache managers for this widget.

    clearUserPostProfileCache();
  }

  /// Additional helper methods are added here.

}
