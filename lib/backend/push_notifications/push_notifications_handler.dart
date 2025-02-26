import 'dart:async';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


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

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          child: Center(
            child: Image.asset(
              'assets/images/Logos.png',
              width: 200.0,
              height: 200.0,
              fit: BoxFit.contain,
            ),
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
  'editProfile': ParameterData.none(),
  'ForgotPassword': ParameterData.none(),
  'Report': ParameterData.none(),
  'Businesinfo': ParameterData.none(),
  'MainBusiness': ParameterData.none(),
  'EditBusinesinfo': (data) async => ParameterData(
        allParams: {
          'businessRef': getParameter<DocumentReference>(data, 'businessRef'),
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
        },
      ),
  'ProfessionPage': ParameterData.none(),
  'ProfessionInfo': ParameterData.none(),
  'EditProfessionInfo': (data) async => ParameterData(
        allParams: {
          'professionInfo':
              getParameter<DocumentReference>(data, 'professionInfo'),
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
        },
      ),
  'Home_bloodgroup': ParameterData.none(),
  'Signup': ParameterData.none(),
  'ProfilePage': ParameterData.none(),
  'Profile06': ParameterData.none(),
  'Users': ParameterData.none(),
  'SingleBusinessInfo': (data) async => ParameterData(
        allParams: {
          'businessRef': getParameter<DocumentReference>(data, 'businessRef'),
          'businessDoc': await getDocumentParameter<BusinessRecord>(
              data, 'businessDoc', BusinessRecord.fromSnapshot),
          'userRef': await getDocumentParameter<UsersRecord>(
              data, 'userRef', UsersRecord.fromSnapshot),
          'userDoc': getParameter<DocumentReference>(data, 'userDoc'),
        },
      ),
  'SingleProfessionInfo': (data) async => ParameterData(
        allParams: {
          'proRef': getParameter<DocumentReference>(data, 'proRef'),
          'proDoc': await getDocumentParameter<ProfessionRecord>(
              data, 'proDoc', ProfessionRecord.fromSnapshot),
        },
      ),
  'MyBusinessList': ParameterData.none(),
  'MyProfessionList': ParameterData.none(),
  'Login': ParameterData.none(),
  'WelcomeScreen': ParameterData.none(),
  'MemberPage': (data) async => ParameterData(
        allParams: {
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
          'userDoc': await getDocumentParameter<UsersRecord>(
              data, 'userDoc', UsersRecord.fromSnapshot),
        },
      ),
  'MainScreen': ParameterData.none(),
  'Profile17OtherUser': ParameterData.none(),
  'Summonslist': ParameterData.none(),
  'Minuteslist': ParameterData.none(),
  'Masonieducation': ParameterData.none(),
  'AboutLodgeBharathi': ParameterData.none(),
  'ListofPastmasters': ParameterData.none(),
  'bylaws': ParameterData.none(),
  'SingleBlogPage': (data) async => ParameterData(
        allParams: {
          'blogs': getParameter<DocumentReference>(data, 'blogs'),
          'blogref': await getDocumentParameter<BlogsMasonicEducationRecord>(
              data, 'blogref', BlogsMasonicEducationRecord.fromSnapshot),
        },
      ),
  'Settings02': ParameterData.none(),
  'editSidedegrees': (data) async => ParameterData(
        allParams: {
          'chapter': getParameter<DocumentReference>(data, 'chapter'),
          'mark': getParameter<DocumentReference>(data, 'mark'),
          'ram': getParameter<DocumentReference>(data, 'ram'),
          'conclave': getParameter<DocumentReference>(data, 'conclave'),
        },
      ),
  'createchapter': (data) async => ParameterData(
        allParams: {
          'chapterRef': getParameter<DocumentReference>(data, 'chapterRef'),
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
          'chapter': await getDocumentParameter<ChapterRecord>(
              data, 'chapter', ChapterRecord.fromSnapshot),
        },
      ),
  'chapterProfile': (data) async => ParameterData(
        allParams: {
          'chapterRef': getParameter<DocumentReference>(data, 'chapterRef'),
          'chapterr': await getDocumentParameter<ChapterRecord>(
              data, 'chapterr', ChapterRecord.fromSnapshot),
        },
      ),
  'profileRAM': (data) async => ParameterData(
        allParams: {
          'ramRef': getParameter<DocumentReference>(data, 'ramRef'),
          'ramDocument': await getDocumentParameter<RamRecord>(
              data, 'ramDocument', RamRecord.fromSnapshot),
        },
      ),
  'profileConclave': (data) async => ParameterData(
        allParams: {
          'conclaveRef': getParameter<DocumentReference>(data, 'conclaveRef'),
          'profConclave': await getDocumentParameter<ConclaveRecord>(
              data, 'profConclave', ConclaveRecord.fromSnapshot),
        },
      ),
  'profileMark': (data) async => ParameterData(
        allParams: {
          'markRef': getParameter<DocumentReference>(data, 'markRef'),
          'markDoc': await getDocumentParameter<MarkRecord>(
              data, 'markDoc', MarkRecord.fromSnapshot),
        },
      ),
  'createRAM': (data) async => ParameterData(
        allParams: {
          'ramRef': getParameter<DocumentReference>(data, 'ramRef'),
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
          'ramDocument': await getDocumentParameter<RamRecord>(
              data, 'ramDocument', RamRecord.fromSnapshot),
        },
      ),
  'createconclave': (data) async => ParameterData(
        allParams: {
          'conclaveRef': getParameter<DocumentReference>(data, 'conclaveRef'),
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
          'conclaveDocument': await getDocumentParameter<ConclaveRecord>(
              data, 'conclaveDocument', ConclaveRecord.fromSnapshot),
        },
      ),
  'createMark': (data) async => ParameterData(
        allParams: {
          'markRef': getParameter<DocumentReference>(data, 'markRef'),
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
          'markDocument': await getDocumentParameter<MarkRecord>(
              data, 'markDocument', MarkRecord.fromSnapshot),
        },
      ),
  'ramList': (data) async => ParameterData(
        allParams: {
          'user': await getDocumentParameter<UsersRecord>(
              data, 'user', UsersRecord.fromSnapshot),
        },
      ),
  'editchapter': (data) async => ParameterData(
        allParams: {
          'chapterRef': getParameter<DocumentReference>(data, 'chapterRef'),
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
          'chapter': await getDocumentParameter<ChapterRecord>(
              data, 'chapter', ChapterRecord.fromSnapshot),
        },
      ),
  'editRAM': (data) async => ParameterData(
        allParams: {
          'ramRef': getParameter<DocumentReference>(data, 'ramRef'),
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
          'ramDocument': await getDocumentParameter<RamRecord>(
              data, 'ramDocument', RamRecord.fromSnapshot),
        },
      ),
  'editconclave': (data) async => ParameterData(
        allParams: {
          'conclaveRef': getParameter<DocumentReference>(data, 'conclaveRef'),
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
          'conclaveDocument': await getDocumentParameter<ConclaveRecord>(
              data, 'conclaveDocument', ConclaveRecord.fromSnapshot),
        },
      ),
  'editmark': (data) async => ParameterData(
        allParams: {
          'markRef': getParameter<DocumentReference>(data, 'markRef'),
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
          'markDocument': await getDocumentParameter<MarkRecord>(
              data, 'markDocument', MarkRecord.fromSnapshot),
        },
      ),
  'Home': ParameterData.none(),
  'List06UserSearch': ParameterData.none(),
  'Home2': ParameterData.none(),
  'AllSideDegrees': ParameterData.none(),
  'chapterlist': (data) async => ParameterData(
        allParams: {
          'user': await getDocumentParameter<UsersRecord>(
              data, 'user', UsersRecord.fromSnapshot),
        },
      ),
  'ConclaveList': (data) async => ParameterData(
        allParams: {
          'user': await getDocumentParameter<UsersRecord>(
              data, 'user', UsersRecord.fromSnapshot),
        },
      ),
  'markList': (data) async => ParameterData(
        allParams: {
          'userRef': await getDocumentParameter<UsersRecord>(
              data, 'userRef', UsersRecord.fromSnapshot),
        },
      ),
  'Gallery': ParameterData.none(),
  'List14StickyHeaderList': ParameterData.none(),
  'createSummons': ParameterData.none(),
  'SingleBlogPageCopy': (data) async => ParameterData(
        allParams: {
          'blogs': getParameter<DocumentReference>(data, 'blogs'),
          'blogref': await getDocumentParameter<BlogsMasonicEducationRecord>(
              data, 'blogref', BlogsMasonicEducationRecord.fromSnapshot),
        },
      ),
  'SummonslistCopy': ParameterData.none(),
  'MinuteslistCopy': ParameterData.none(),
  'about': ParameterData.none(),
  'ListofOfficers': ParameterData.none(),
  'List01Transactions': ParameterData.none(),
  'AboutFreemasonry': ParameterData.none(),
  'GrandLodgeofIndia': ParameterData.none(),
  'RegionalGrandLodgeofSouthernIndia': ParameterData.none(),
  'Details01ProjectTracker': ParameterData.none(),
  'Details11EventTicket': ParameterData.none(),
  'Help': ParameterData.none(),
  'Profile07': ParameterData.none(),
  'ProfilePageCopy': ParameterData.none(),
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
