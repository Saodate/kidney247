import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '../flutter_flow_theme.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '../../auth/base_auth_user_provider.dart';
import '../../backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : LoginPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : LoginPageWidget(),
          routes: [
            FFRoute(
              name: 'loginPage',
              path: 'loginPage',
              builder: (context, params) => LoginPageWidget(),
            ),
            FFRoute(
              name: 'completeProfile',
              path: 'completeProfile',
              requireAuth: true,
              builder: (context, params) => CompleteProfileWidget(),
            ),
            FFRoute(
              name: 'homePage',
              path: 'home',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'homePage')
                  : HomePageWidget(),
            ),
            FFRoute(
              name: 'profilePage',
              path: 'profilePage',
              requireAuth: true,
              builder: (context, params) => ProfilePageWidget(
                userProfile: params.getParam('userProfile',
                    ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'editProfile',
              path: 'editProfile',
              requireAuth: true,
              builder: (context, params) => EditProfileWidget(
                userProfile: params.getParam('userProfile',
                    ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'carePage',
              path: 'carePage',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'carePage')
                  : CarePageWidget(),
            ),
            FFRoute(
              name: 'chatGPT',
              path: 'AskKidneyAI',
              requireAuth: true,
              builder: (context, params) => ChatGPTWidget(),
            ),
            FFRoute(
              name: 'learnPage',
              path: 'learn',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'learnPage')
                  : NavBarPage(
                      initialPage: 'learnPage',
                      page: LearnPageWidget(),
                    ),
            ),
            FFRoute(
              name: 'setTargetPage',
              path: 'setTargetPage',
              requireAuth: true,
              builder: (context, params) => SetTargetPageWidget(
                isEdited: params.getParam('isEdited', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'logMealPage',
              path: 'logMeal',
              requireAuth: true,
              builder: (context, params) => LogMealPageWidget(
                isCompleted: params.getParam('isCompleted', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'trackPage',
              path: 'trackPage',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'trackPage')
                  : TrackPageWidget(),
            ),
            FFRoute(
              name: 'addLabTestResult',
              path: 'addLabTest',
              requireAuth: true,
              builder: (context, params) => AddLabTestResultWidget(),
            ),
            FFRoute(
              name: 'addFluidsPage',
              path: 'addFluids',
              requireAuth: true,
              builder: (context, params) => AddFluidsPageWidget(),
            ),
            FFRoute(
              name: 'addVitalEntry',
              path: 'addVitalEntry',
              requireAuth: true,
              builder: (context, params) => AddVitalEntryWidget(),
            ),
            FFRoute(
              name: 'trackNutrientPage',
              path: 'trackNutrientPage',
              requireAuth: true,
              builder: (context, params) => TrackNutrientPageWidget(
                pageTitle: params.getParam('pageTitle', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'trackFluidPage',
              path: 'trackFluidPage',
              requireAuth: true,
              builder: (context, params) => TrackFluidPageWidget(
                pageTitle: params.getParam('pageTitle', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'trackFluidOutput',
              path: 'trackFluidOutput',
              requireAuth: true,
              builder: (context, params) => TrackFluidOutputWidget(
                pageTitle: params.getParam('pageTitle', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'trackBloodPressurePage',
              path: 'trackBloodPessureEntryPage',
              requireAuth: true,
              builder: (context, params) => TrackBloodPressurePageWidget(
                pageTitle: params.getParam('pageTitle', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'trackBloodGlucoseA1CPage',
              path: 'trackBloodGlucoseA1CEntryPage',
              requireAuth: true,
              builder: (context, params) => TrackBloodGlucoseA1CPageWidget(
                pageTitle: params.getParam('pageTitle', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'trackGRFPage',
              path: 'trackGRFPage',
              requireAuth: true,
              builder: (context, params) => TrackGRFPageWidget(
                pageTitle: params.getParam('pageTitle', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'trackAlbuminLabPage',
              path: 'trackAlbuminLab',
              requireAuth: true,
              builder: (context, params) => TrackAlbuminLabPageWidget(
                pageTitle: params.getParam('pageTitle', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'trackBUNPage',
              path: 'trackBUNPage',
              requireAuth: true,
              builder: (context, params) => TrackBUNPageWidget(
                pageTitle: params.getParam('pageTitle', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'uploadPhotoPage',
              path: 'uploadPhotoPage',
              requireAuth: true,
              builder: (context, params) => UploadPhotoPageWidget(),
            ),
            FFRoute(
              name: 'changeLanguagePage',
              path: 'changeLanguagePage',
              requireAuth: true,
              builder: (context, params) => ChangeLanguagePageWidget(),
            ),
            FFRoute(
              name: 'trackBloodGlucosePage',
              path: 'trackBloodGlucoseEntryPage',
              requireAuth: true,
              builder: (context, params) => TrackBloodGlucosePageWidget(
                pageTitle: params.getParam('pageTitle', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'forgotPassword',
              path: 'forgotPassword',
              builder: (context, params) => ForgotPasswordWidget(),
            ),
            FFRoute(
              name: 'addCareTeam',
              path: 'addCareTeam',
              requireAuth: true,
              builder: (context, params) => AddCareTeamWidget(
                isCompleteProfile:
                    params.getParam('isCompleteProfile', ParamType.bool),
                fromHomePage: params.getParam('fromHomePage', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'listCareTeam',
              path: 'listCareTeam',
              requireAuth: true,
              builder: (context, params) => ListCareTeamWidget(),
            ),
            FFRoute(
              name: 'privacyPolicy',
              path: 'privacy-policy',
              requireAuth: true,
              builder: (context, params) => PrivacyPolicyWidget(),
            ),
            FFRoute(
              name: 'Onboard',
              path: 'onboard',
              requireAuth: true,
              builder: (context, params) => OnboardWidget(),
            ),
            FFRoute(
              name: 'userAccount',
              path: 'userAccount',
              requireAuth: true,
              builder: (context, params) => UserAccountWidget(),
            ),
            FFRoute(
              name: 'upcomingAppointment',
              path: 'upcomingAppointment',
              requireAuth: true,
              builder: (context, params) => UpcomingAppointmentWidget(
                pageTitle: params.getParam('pageTitle', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'addMedication',
              path: 'addMedication',
              requireAuth: true,
              builder: (context, params) => AddMedicationWidget(
                isCompleted: params.getParam('isCompleted', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'doneProfile',
              path: 'doneProfile',
              requireAuth: true,
              builder: (context, params) => DoneProfileWidget(),
            ),
            FFRoute(
              name: 'listMedicationRemind',
              path: 'listMedicationRemind',
              requireAuth: true,
              builder: (context, params) => ListMedicationRemindWidget(
                pageTitle: params.getParam('pageTitle', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'userProfile',
              path: 'userProfile',
              requireAuth: true,
              builder: (context, params) => UserProfileWidget(
                userRef: params.getParam(
                    'userRef', ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'communityPage',
              path: 'community',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'communityPage')
                  : CommunityPageWidget(),
            ),
            FFRoute(
              name: 'createGroupchat',
              path: 'createGroupchat',
              requireAuth: true,
              builder: (context, params) => CreateGroupchatWidget(),
            ),
            FFRoute(
              name: 'ChatPage',
              path: 'ChatPage',
              requireAuth: true,
              asyncParams: {
                'chatUser': getDoc(['users'], UsersRecord.fromSnapshot),
              },
              builder: (context, params) => ChatPageWidget(
                chatUser: params.getParam('chatUser', ParamType.Document),
                chatRef: params.getParam(
                    'chatRef', ParamType.DocumentReference, false, ['chats']),
                isGroupChat: params.getParam('isGroupChat', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'share',
              path: 'share/:videoRef',
              builder: (context, params) => ShareWidget(
                videoRef: params.getParam(
                    'videoRef', ParamType.DocumentReference, false, ['videos']),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/loginPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/android-chrome-512x512.png',
                    fit: BoxFit.fitWidth,
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
