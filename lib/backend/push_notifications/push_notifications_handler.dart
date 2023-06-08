import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/android-chrome-512x512.png',
            fit: BoxFit.fitWidth,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'loginPage': ParameterData.none(),
  'completeProfile': ParameterData.none(),
  'homePage': ParameterData.none(),
  'profilePage': (data) async => ParameterData(
        allParams: {
          'userProfile': getParameter<DocumentReference>(data, 'userProfile'),
        },
      ),
  'editProfile': (data) async => ParameterData(
        allParams: {
          'userProfile': getParameter<DocumentReference>(data, 'userProfile'),
        },
      ),
  'carePage': ParameterData.none(),
  'chatGPT': ParameterData.none(),
  'learnPage': ParameterData.none(),
  'setTargetPage': (data) async => ParameterData(
        allParams: {
          'isEdited': getParameter<bool>(data, 'isEdited'),
        },
      ),
  'logMealPage': (data) async => ParameterData(
        allParams: {
          'isCompleted': getParameter<bool>(data, 'isCompleted'),
        },
      ),
  'trackPage': ParameterData.none(),
  'addLabTestResult': ParameterData.none(),
  'addFluidsPage': ParameterData.none(),
  'addVitalEntry': ParameterData.none(),
  'trackNutrientPage': (data) async => ParameterData(
        allParams: {
          'pageTitle': getParameter<String>(data, 'pageTitle'),
        },
      ),
  'trackFluidPage': (data) async => ParameterData(
        allParams: {
          'pageTitle': getParameter<String>(data, 'pageTitle'),
        },
      ),
  'trackFluidOutput': (data) async => ParameterData(
        allParams: {
          'pageTitle': getParameter<String>(data, 'pageTitle'),
        },
      ),
  'trackBloodPressurePage': (data) async => ParameterData(
        allParams: {
          'pageTitle': getParameter<String>(data, 'pageTitle'),
        },
      ),
  'trackBloodGlucoseA1CPage': (data) async => ParameterData(
        allParams: {
          'pageTitle': getParameter<String>(data, 'pageTitle'),
        },
      ),
  'trackGRFPage': (data) async => ParameterData(
        allParams: {
          'pageTitle': getParameter<String>(data, 'pageTitle'),
        },
      ),
  'trackAlbuminLabPage': (data) async => ParameterData(
        allParams: {
          'pageTitle': getParameter<String>(data, 'pageTitle'),
        },
      ),
  'trackBUNPage': (data) async => ParameterData(
        allParams: {
          'pageTitle': getParameter<String>(data, 'pageTitle'),
        },
      ),
  'uploadPhotoPage': ParameterData.none(),
  'changeLanguagePage': ParameterData.none(),
  'trackBloodGlucosePage': (data) async => ParameterData(
        allParams: {
          'pageTitle': getParameter<String>(data, 'pageTitle'),
        },
      ),
  'forgotPassword': ParameterData.none(),
  'addCareTeam': (data) async => ParameterData(
        allParams: {
          'isCompleteProfile': getParameter<bool>(data, 'isCompleteProfile'),
          'fromHomePage': getParameter<bool>(data, 'fromHomePage'),
        },
      ),
  'listCareTeam': ParameterData.none(),
  'privacyPolicy': ParameterData.none(),
  'Onboard': ParameterData.none(),
  'userAccount': ParameterData.none(),
  'upcomingAppointment': (data) async => ParameterData(
        allParams: {
          'pageTitle': getParameter<String>(data, 'pageTitle'),
        },
      ),
  'addMedication': (data) async => ParameterData(
        allParams: {
          'isCompleted': getParameter<bool>(data, 'isCompleted'),
        },
      ),
  'doneProfile': ParameterData.none(),
  'listMedicationRemind': (data) async => ParameterData(
        allParams: {
          'pageTitle': getParameter<String>(data, 'pageTitle'),
        },
      ),
  'userProfile': (data) async => ParameterData(
        allParams: {
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
        },
      ),
  'communityPage': ParameterData.none(),
  'createGroupchat': ParameterData.none(),
  'ChatPage': (data) async => ParameterData(
        allParams: {
          'chatUser': await getDocumentParameter<UsersRecord>(
              data, 'chatUser', UsersRecord.fromSnapshot),
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
          'isGroupChat': getParameter<bool>(data, 'isGroupChat'),
        },
      ),
  'share': (data) async {
    final allParams = {
      'videoRef': getParameter<DocumentReference>(data, 'videoRef'),
    };
    return ParameterData(
      requiredParams: {
        'videoRef': serializeParam(
          allParams['videoRef'],
          ParamType.DocumentReference,
        ),
      },
      allParams: allParams,
    );
  },
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
