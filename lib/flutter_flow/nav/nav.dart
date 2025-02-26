import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';


import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

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
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
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
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : LoginWidget(),
          routes: [
            FFRoute(
              name: EditProfileWidget.routeName,
              path: EditProfileWidget.routePath,
              builder: (context, params) => EditProfileWidget(),
            ),
            FFRoute(
              name: ForgotPasswordWidget.routeName,
              path: ForgotPasswordWidget.routePath,
              builder: (context, params) => ForgotPasswordWidget(),
            ),
            FFRoute(
              name: ReportWidget.routeName,
              path: ReportWidget.routePath,
              builder: (context, params) => ReportWidget(),
            ),
            FFRoute(
              name: BusinesinfoWidget.routeName,
              path: BusinesinfoWidget.routePath,
              builder: (context, params) => BusinesinfoWidget(),
            ),
            FFRoute(
              name: MainBusinessWidget.routeName,
              path: MainBusinessWidget.routePath,
              builder: (context, params) => MainBusinessWidget(),
            ),
            FFRoute(
              name: EditBusinesinfoWidget.routeName,
              path: EditBusinesinfoWidget.routePath,
              builder: (context, params) => EditBusinesinfoWidget(
                businessRef: params.getParam(
                  'businessRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['business'],
                ),
                userRef: params.getParam(
                  'userRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: ProfessionPageWidget.routeName,
              path: ProfessionPageWidget.routePath,
              builder: (context, params) => ProfessionPageWidget(),
            ),
            FFRoute(
              name: ProfessionInfoWidget.routeName,
              path: ProfessionInfoWidget.routePath,
              builder: (context, params) => ProfessionInfoWidget(),
            ),
            FFRoute(
              name: EditProfessionInfoWidget.routeName,
              path: EditProfessionInfoWidget.routePath,
              builder: (context, params) => EditProfessionInfoWidget(
                professionInfo: params.getParam(
                  'professionInfo',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['profession'],
                ),
                userRef: params.getParam(
                  'userRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: HomeBloodgroupWidget.routeName,
              path: HomeBloodgroupWidget.routePath,
              builder: (context, params) => HomeBloodgroupWidget(),
            ),
            FFRoute(
              name: SignupWidget.routeName,
              path: SignupWidget.routePath,
              builder: (context, params) => SignupWidget(),
            ),
            FFRoute(
              name: ProfilePageWidget.routeName,
              path: ProfilePageWidget.routePath,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'ProfilePage')
                  : ProfilePageWidget(),
            ),
            FFRoute(
              name: Profile06Widget.routeName,
              path: Profile06Widget.routePath,
              builder: (context, params) => Profile06Widget(),
            ),
            FFRoute(
              name: UsersWidget.routeName,
              path: UsersWidget.routePath,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Users')
                  : UsersWidget(),
            ),
            FFRoute(
              name: SingleBusinessInfoWidget.routeName,
              path: SingleBusinessInfoWidget.routePath,
              asyncParams: {
                'businessDoc':
                    getDoc(['business'], BusinessRecord.fromSnapshot),
                'userRef': getDoc(['users'], UsersRecord.fromSnapshot),
              },
              builder: (context, params) => SingleBusinessInfoWidget(
                businessRef: params.getParam(
                  'businessRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['business'],
                ),
                businessDoc: params.getParam(
                  'businessDoc',
                  ParamType.Document,
                ),
                userRef: params.getParam(
                  'userRef',
                  ParamType.Document,
                ),
                userDoc: params.getParam(
                  'userDoc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: SingleProfessionInfoWidget.routeName,
              path: SingleProfessionInfoWidget.routePath,
              asyncParams: {
                'proDoc': getDoc(['profession'], ProfessionRecord.fromSnapshot),
              },
              builder: (context, params) => SingleProfessionInfoWidget(
                proRef: params.getParam(
                  'proRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['profession'],
                ),
                proDoc: params.getParam(
                  'proDoc',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: MyBusinessListWidget.routeName,
              path: MyBusinessListWidget.routePath,
              builder: (context, params) => MyBusinessListWidget(),
            ),
            FFRoute(
              name: MyProfessionListWidget.routeName,
              path: MyProfessionListWidget.routePath,
              builder: (context, params) => MyProfessionListWidget(),
            ),
            FFRoute(
              name: LoginWidget.routeName,
              path: LoginWidget.routePath,
              builder: (context, params) => LoginWidget(),
            ),
            FFRoute(
              name: WelcomeScreenWidget.routeName,
              path: WelcomeScreenWidget.routePath,
              builder: (context, params) => WelcomeScreenWidget(),
            ),
            FFRoute(
              name: MemberPageWidget.routeName,
              path: MemberPageWidget.routePath,
              asyncParams: {
                'userDoc': getDoc(['users'], UsersRecord.fromSnapshot),
              },
              builder: (context, params) => MemberPageWidget(
                userRef: params.getParam(
                  'userRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
                userDoc: params.getParam(
                  'userDoc',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: MainScreenWidget.routeName,
              path: MainScreenWidget.routePath,
              builder: (context, params) => MainScreenWidget(),
            ),
            FFRoute(
              name: Profile17OtherUserWidget.routeName,
              path: Profile17OtherUserWidget.routePath,
              builder: (context, params) => Profile17OtherUserWidget(),
            ),
            FFRoute(
              name: SummonslistWidget.routeName,
              path: SummonslistWidget.routePath,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Summonslist')
                  : SummonslistWidget(),
            ),
            FFRoute(
              name: MinuteslistWidget.routeName,
              path: MinuteslistWidget.routePath,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Minuteslist')
                  : MinuteslistWidget(),
            ),
            FFRoute(
              name: MasonieducationWidget.routeName,
              path: MasonieducationWidget.routePath,
              builder: (context, params) => MasonieducationWidget(),
            ),
            FFRoute(
              name: AboutLodgeBharathiWidget.routeName,
              path: AboutLodgeBharathiWidget.routePath,
              builder: (context, params) => AboutLodgeBharathiWidget(),
            ),
            FFRoute(
              name: ListofPastmastersWidget.routeName,
              path: ListofPastmastersWidget.routePath,
              builder: (context, params) => ListofPastmastersWidget(),
            ),
            FFRoute(
              name: BylawsWidget.routeName,
              path: BylawsWidget.routePath,
              builder: (context, params) => BylawsWidget(),
            ),
            FFRoute(
              name: SingleBlogPageWidget.routeName,
              path: SingleBlogPageWidget.routePath,
              asyncParams: {
                'blogref': getDoc(['blogs_masonic_education'],
                    BlogsMasonicEducationRecord.fromSnapshot),
              },
              builder: (context, params) => SingleBlogPageWidget(
                blogs: params.getParam(
                  'blogs',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['blogs_masonic_education'],
                ),
                blogref: params.getParam(
                  'blogref',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: Settings02Widget.routeName,
              path: Settings02Widget.routePath,
              builder: (context, params) => Settings02Widget(),
            ),
            FFRoute(
              name: EditSidedegreesWidget.routeName,
              path: EditSidedegreesWidget.routePath,
              builder: (context, params) => EditSidedegreesWidget(
                chapter: params.getParam(
                  'chapter',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['chapter'],
                ),
                mark: params.getParam(
                  'mark',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['mark'],
                ),
                ram: params.getParam(
                  'ram',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['RAM'],
                ),
                conclave: params.getParam(
                  'conclave',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['conclave'],
                ),
              ),
            ),
            FFRoute(
              name: CreatechapterWidget.routeName,
              path: CreatechapterWidget.routePath,
              asyncParams: {
                'chapter': getDoc(['chapter'], ChapterRecord.fromSnapshot),
              },
              builder: (context, params) => CreatechapterWidget(
                chapterRef: params.getParam(
                  'chapterRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['chapter'],
                ),
                userRef: params.getParam(
                  'userRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
                chapter: params.getParam(
                  'chapter',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: ChapterProfileWidget.routeName,
              path: ChapterProfileWidget.routePath,
              asyncParams: {
                'chapterr': getDoc(['chapter'], ChapterRecord.fromSnapshot),
              },
              builder: (context, params) => ChapterProfileWidget(
                chapterRef: params.getParam(
                  'chapterRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['chapter'],
                ),
                chapterr: params.getParam(
                  'chapterr',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: ProfileRAMWidget.routeName,
              path: ProfileRAMWidget.routePath,
              asyncParams: {
                'ramDocument': getDoc(['RAM'], RamRecord.fromSnapshot),
              },
              builder: (context, params) => ProfileRAMWidget(
                ramRef: params.getParam(
                  'ramRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['RAM'],
                ),
                ramDocument: params.getParam(
                  'ramDocument',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: ProfileConclaveWidget.routeName,
              path: ProfileConclaveWidget.routePath,
              asyncParams: {
                'profConclave':
                    getDoc(['conclave'], ConclaveRecord.fromSnapshot),
              },
              builder: (context, params) => ProfileConclaveWidget(
                conclaveRef: params.getParam(
                  'conclaveRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['conclave'],
                ),
                profConclave: params.getParam(
                  'profConclave',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: ProfileMarkWidget.routeName,
              path: ProfileMarkWidget.routePath,
              asyncParams: {
                'markDoc': getDoc(['mark'], MarkRecord.fromSnapshot),
              },
              builder: (context, params) => ProfileMarkWidget(
                markRef: params.getParam(
                  'markRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['mark'],
                ),
                markDoc: params.getParam(
                  'markDoc',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: CreateRAMWidget.routeName,
              path: CreateRAMWidget.routePath,
              asyncParams: {
                'ramDocument': getDoc(['RAM'], RamRecord.fromSnapshot),
              },
              builder: (context, params) => CreateRAMWidget(
                ramRef: params.getParam(
                  'ramRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['RAM'],
                ),
                userRef: params.getParam(
                  'userRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
                ramDocument: params.getParam(
                  'ramDocument',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: CreateconclaveWidget.routeName,
              path: CreateconclaveWidget.routePath,
              asyncParams: {
                'conclaveDocument':
                    getDoc(['conclave'], ConclaveRecord.fromSnapshot),
              },
              builder: (context, params) => CreateconclaveWidget(
                conclaveRef: params.getParam(
                  'conclaveRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['conclave'],
                ),
                userRef: params.getParam(
                  'userRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
                conclaveDocument: params.getParam(
                  'conclaveDocument',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: CreateMarkWidget.routeName,
              path: CreateMarkWidget.routePath,
              asyncParams: {
                'markDocument': getDoc(['mark'], MarkRecord.fromSnapshot),
              },
              builder: (context, params) => CreateMarkWidget(
                markRef: params.getParam(
                  'markRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['mark'],
                ),
                userRef: params.getParam(
                  'userRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
                markDocument: params.getParam(
                  'markDocument',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: RamListWidget.routeName,
              path: RamListWidget.routePath,
              asyncParams: {
                'user': getDoc(['users'], UsersRecord.fromSnapshot),
              },
              builder: (context, params) => RamListWidget(
                user: params.getParam(
                  'user',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: EditchapterWidget.routeName,
              path: EditchapterWidget.routePath,
              asyncParams: {
                'chapter': getDoc(['chapter'], ChapterRecord.fromSnapshot),
              },
              builder: (context, params) => EditchapterWidget(
                chapterRef: params.getParam(
                  'chapterRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['chapter'],
                ),
                userRef: params.getParam(
                  'userRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
                chapter: params.getParam(
                  'chapter',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: EditRAMWidget.routeName,
              path: EditRAMWidget.routePath,
              asyncParams: {
                'ramDocument': getDoc(['RAM'], RamRecord.fromSnapshot),
              },
              builder: (context, params) => EditRAMWidget(
                ramRef: params.getParam(
                  'ramRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['RAM'],
                ),
                userRef: params.getParam(
                  'userRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
                ramDocument: params.getParam(
                  'ramDocument',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: EditconclaveWidget.routeName,
              path: EditconclaveWidget.routePath,
              asyncParams: {
                'conclaveDocument':
                    getDoc(['conclave'], ConclaveRecord.fromSnapshot),
              },
              builder: (context, params) => EditconclaveWidget(
                conclaveRef: params.getParam(
                  'conclaveRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['conclave'],
                ),
                userRef: params.getParam(
                  'userRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
                conclaveDocument: params.getParam(
                  'conclaveDocument',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: EditmarkWidget.routeName,
              path: EditmarkWidget.routePath,
              asyncParams: {
                'markDocument': getDoc(['mark'], MarkRecord.fromSnapshot),
              },
              builder: (context, params) => EditmarkWidget(
                markRef: params.getParam(
                  'markRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['mark'],
                ),
                userRef: params.getParam(
                  'userRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
                markDocument: params.getParam(
                  'markDocument',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: HomeWidget.routeName,
              path: HomeWidget.routePath,
              builder: (context, params) => HomeWidget(),
            ),
            FFRoute(
              name: List06UserSearchWidget.routeName,
              path: List06UserSearchWidget.routePath,
              builder: (context, params) => List06UserSearchWidget(),
            ),
            FFRoute(
              name: Home2Widget.routeName,
              path: Home2Widget.routePath,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Home2')
                  : Home2Widget(),
            ),
            FFRoute(
              name: AllSideDegreesWidget.routeName,
              path: AllSideDegreesWidget.routePath,
              builder: (context, params) => AllSideDegreesWidget(),
            ),
            FFRoute(
              name: ChapterlistWidget.routeName,
              path: ChapterlistWidget.routePath,
              asyncParams: {
                'user': getDoc(['users'], UsersRecord.fromSnapshot),
              },
              builder: (context, params) => ChapterlistWidget(
                user: params.getParam(
                  'user',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: ConclaveListWidget.routeName,
              path: ConclaveListWidget.routePath,
              asyncParams: {
                'user': getDoc(['users'], UsersRecord.fromSnapshot),
              },
              builder: (context, params) => ConclaveListWidget(
                user: params.getParam(
                  'user',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: MarkListWidget.routeName,
              path: MarkListWidget.routePath,
              asyncParams: {
                'userRef': getDoc(['users'], UsersRecord.fromSnapshot),
              },
              builder: (context, params) => MarkListWidget(
                userRef: params.getParam(
                  'userRef',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: GalleryWidget.routeName,
              path: GalleryWidget.routePath,
              builder: (context, params) => GalleryWidget(),
            ),
            FFRoute(
              name: List14StickyHeaderListWidget.routeName,
              path: List14StickyHeaderListWidget.routePath,
              builder: (context, params) => List14StickyHeaderListWidget(),
            ),
            FFRoute(
              name: CreateSummonsWidget.routeName,
              path: CreateSummonsWidget.routePath,
              builder: (context, params) => CreateSummonsWidget(),
            ),
            FFRoute(
              name: SingleBlogPageCopyWidget.routeName,
              path: SingleBlogPageCopyWidget.routePath,
              asyncParams: {
                'blogref': getDoc(['blogs_masonic_education'],
                    BlogsMasonicEducationRecord.fromSnapshot),
              },
              builder: (context, params) => SingleBlogPageCopyWidget(
                blogs: params.getParam(
                  'blogs',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['blogs_masonic_education'],
                ),
                blogref: params.getParam(
                  'blogref',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: SummonslistCopyWidget.routeName,
              path: SummonslistCopyWidget.routePath,
              builder: (context, params) => SummonslistCopyWidget(),
            ),
            FFRoute(
              name: MinuteslistCopyWidget.routeName,
              path: MinuteslistCopyWidget.routePath,
              builder: (context, params) => MinuteslistCopyWidget(),
            ),
            FFRoute(
              name: AboutWidget.routeName,
              path: AboutWidget.routePath,
              builder: (context, params) => AboutWidget(),
            ),
            FFRoute(
              name: ListofOfficersWidget.routeName,
              path: ListofOfficersWidget.routePath,
              builder: (context, params) => ListofOfficersWidget(),
            ),
            FFRoute(
              name: List01TransactionsWidget.routeName,
              path: List01TransactionsWidget.routePath,
              builder: (context, params) => List01TransactionsWidget(),
            ),
            FFRoute(
              name: AboutFreemasonryWidget.routeName,
              path: AboutFreemasonryWidget.routePath,
              builder: (context, params) => AboutFreemasonryWidget(),
            ),
            FFRoute(
              name: GrandLodgeofIndiaWidget.routeName,
              path: GrandLodgeofIndiaWidget.routePath,
              builder: (context, params) => GrandLodgeofIndiaWidget(),
            ),
            FFRoute(
              name: RegionalGrandLodgeofSouthernIndiaWidget.routeName,
              path: RegionalGrandLodgeofSouthernIndiaWidget.routePath,
              builder: (context, params) =>
                  RegionalGrandLodgeofSouthernIndiaWidget(),
            ),
            FFRoute(
              name: Details01ProjectTrackerWidget.routeName,
              path: Details01ProjectTrackerWidget.routePath,
              builder: (context, params) => Details01ProjectTrackerWidget(),
            ),
            FFRoute(
              name: Details11EventTicketWidget.routeName,
              path: Details11EventTicketWidget.routePath,
              builder: (context, params) => Details11EventTicketWidget(),
            ),
            FFRoute(
              name: HelpWidget.routeName,
              path: HelpWidget.routePath,
              builder: (context, params) => HelpWidget(),
            ),
            FFRoute(
              name: Profile07Widget.routeName,
              path: Profile07Widget.routePath,
              builder: (context, params) => Profile07Widget(),
            ),
            FFRoute(
              name: ProfilePageCopyWidget.routeName,
              path: ProfilePageCopyWidget.routePath,
              builder: (context, params) => ProfilePageCopyWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
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
    ..addAll(uri.queryParameters)
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
      (state.allParams.length == 1 &&
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
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
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
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
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
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
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
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
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

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
