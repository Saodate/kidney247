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
import '/flutter_flow/request_manager.dart';

import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class CommunityPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Group Chat Action] action in ListTileVi widget.
  ChatsRecord? groupChat;
  // Stores action output result for [Group Chat Action] action in ListTileEn widget.
  ChatsRecord? groupChatEn1;
  // Stores action output result for [Group Chat Action] action in ListTileVi widget.
  ChatsRecord? groupChat2;
  // Stores action output result for [Group Chat Action] action in ListTileEn widget.
  ChatsRecord? groupChatEn2;

  /// Query cache managers for this widget.

  final _postCacheManager = StreamRequestManager<List<PostsRecord>>();
  Stream<List<PostsRecord>> postCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<PostsRecord>> Function() requestFn,
  }) =>
      _postCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPostCacheCache() => _postCacheManager.clear();
  void clearPostCacheCacheKey(String? uniqueKey) =>
      _postCacheManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    /// Dispose query cache managers for this widget.

    clearPostCacheCache();
  }

  /// Additional helper methods are added here.

}
