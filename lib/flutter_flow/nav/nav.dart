import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/backend/schema/enums/enums.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

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
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? const AuthCheckViewWidget()
          : const WelcomeVideoViewWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? const AuthCheckViewWidget()
              : const WelcomeVideoViewWidget(),
        ),
        FFRoute(
          name: 'WelcomePage',
          path: '/welcomePage',
          builder: (context, params) => const WelcomePageWidget(),
        ),
        FFRoute(
          name: 'individualchatprofil',
          path: '/individualchatprofil',
          builder: (context, params) => const IndividualchatprofilWidget(),
        ),
        FFRoute(
          name: 'auth_2_Create',
          path: '/auth2Create',
          builder: (context, params) => const Auth2CreateWidget(),
        ),
        FFRoute(
          name: 'auth_2_Login',
          path: '/auth2Login',
          builder: (context, params) => const Auth2LoginWidget(),
        ),
        FFRoute(
          name: 'auth_2_ForgotPassword',
          path: '/auth2ForgotPassword',
          builder: (context, params) => const Auth2ForgotPasswordWidget(),
        ),
        FFRoute(
          name: 'auth_2_createProfile',
          path: '/auth2CreateProfile',
          builder: (context, params) => const Auth2CreateProfileWidget(),
        ),
        FFRoute(
          name: 'auth_2_Profile',
          path: '/auth2Profile',
          builder: (context, params) => const Auth2ProfileWidget(),
        ),
        FFRoute(
          name: 'auth_2_EditProfile',
          path: '/auth2EditProfile',
          builder: (context, params) => const Auth2EditProfileWidget(),
        ),
        FFRoute(
          name: 'signupuserpluscompany',
          path: '/signupuserpluscompany',
          builder: (context, params) => const SignupuserpluscompanyWidget(),
        ),
        FFRoute(
          name: 'createprofiluser',
          path: '/createprofiluser',
          builder: (context, params) => const CreateprofiluserWidget(),
        ),
        FFRoute(
          name: 'intrologovideo',
          path: '/intrologovideo',
          builder: (context, params) => const IntrologovideoWidget(),
        ),
        FFRoute(
          name: 'welcomeuserprofil',
          path: '/welcomeuserprofil',
          builder: (context, params) => const WelcomeuserprofilWidget(),
        ),
        FFRoute(
          name: 'createbusinessprofil',
          path: '/createbusinessprofil',
          builder: (context, params) => const CreatebusinessprofilWidget(),
        ),
        FFRoute(
          name: 'userfindfriends',
          path: '/userfindfriends',
          builder: (context, params) => const UserfindfriendsWidget(),
        ),
        FFRoute(
          name: 'welcomeuserprofil3',
          path: '/welcomeuserprofil3',
          builder: (context, params) => const Welcomeuserprofil3Widget(),
        ),
        FFRoute(
          name: 'useractivitysearchpage',
          path: '/useractivitysearchpage',
          builder: (context, params) => const UseractivitysearchpageWidget(),
        ),
        FFRoute(
          name: 'useractivitysearchpage2',
          path: '/useractivitysearchpage2',
          builder: (context, params) => const Useractivitysearchpage2Widget(),
        ),
        FFRoute(
          name: 'usercreateactivitypage',
          path: '/usercreateactivitypage',
          builder: (context, params) => const UsercreateactivitypageWidget(),
        ),
        FFRoute(
          name: 'userchatpage',
          path: '/userchatpage',
          builder: (context, params) => const UserchatpageWidget(),
        ),
        FFRoute(
          name: 'usercreateadvertisepage',
          path: '/usercreateadvertisepage',
          builder: (context, params) => const UsercreateadvertisepageWidget(),
        ),
        FFRoute(
          name: 'usecreateactivitycongratspage',
          path: '/usecreateactivitycongratspage',
          builder: (context, params) => const UsecreateactivitycongratspageWidget(),
        ),
        FFRoute(
          name: 'userpaymentpromotepage',
          path: '/userpaymentpromotepage',
          builder: (context, params) => const UserpaymentpromotepageWidget(),
        ),
        FFRoute(
          name: 'usercreatepromotethankspage',
          path: '/usercreatepromotethankspage',
          builder: (context, params) => const UsercreatepromotethankspageWidget(),
        ),
        FFRoute(
          name: 'Welcomebusinessuser',
          path: '/welcomebusinessuser',
          builder: (context, params) => const WelcomebusinessuserWidget(),
        ),
        FFRoute(
          name: 'Welcomebusinesspage2',
          path: '/welcomebusinesspage2',
          builder: (context, params) => const Welcomebusinesspage2Widget(),
        ),
        FFRoute(
          name: 'creatabusinessactivitypage',
          path: '/creatabusinessactivitypage',
          builder: (context, params) => const CreatabusinessactivitypageWidget(),
        ),
        FFRoute(
          name: 'businesschatpage',
          path: '/businesschatpage',
          builder: (context, params) => const BusinesschatpageWidget(),
        ),
        FFRoute(
          name: 'userfindfriendsCopy',
          path: '/userfindfriendsCopy',
          builder: (context, params) => const UserfindfriendsCopyWidget(),
        ),
        FFRoute(
          name: 'usercreateadvertisepageCopy',
          path: '/usercreateadvertisepageCopy',
          builder: (context, params) => const UsercreateadvertisepageCopyWidget(),
        ),
        FFRoute(
          name: 'usercreatepromotethankspageCopy',
          path: '/usercreatepromotethankspageCopy',
          builder: (context, params) => const UsercreatepromotethankspageCopyWidget(),
        ),
        FFRoute(
          name: 'usecreateactivitycongratspageCopy',
          path: '/usecreateactivitycongratspageCopy',
          builder: (context, params) =>
              const UsecreateactivitycongratspageCopyWidget(),
        ),
        FFRoute(
          name: 'Settingsbusinesspage',
          path: '/settingsbusinesspage',
          builder: (context, params) => const SettingsbusinesspageWidget(),
        ),
        FFRoute(
          name: 'usersettingspage',
          path: '/usersettingspage',
          builder: (context, params) => const UsersettingspageWidget(),
        ),
        FFRoute(
          name: 'userDashboard',
          path: '/userDashboard',
          builder: (context, params) => const UserDashboardWidget(),
        ),
        FFRoute(
          name: 'businessDashboard',
          path: '/businessDashboard',
          builder: (context, params) => const BusinessDashboardWidget(),
        ),
        FFRoute(
          name: 'businessActivityCongrats',
          path: '/businessActivityCongrats',
          builder: (context, params) => const BusinessActivityCongratsWidget(),
        ),
        FFRoute(
          name: 'businessPromoteThankPage',
          path: '/businessPromoteThankPage',
          builder: (context, params) => const BusinessPromoteThankPageWidget(),
        ),
        FFRoute(
          name: 'businessaymentpromotepage',
          path: '/businessaymentpromotepage',
          builder: (context, params) => const BusinessaymentpromotepageWidget(),
        ),
        FFRoute(
          name: 'WelcomeVideoView',
          path: '/welcomeVideoView',
          builder: (context, params) => const WelcomeVideoViewWidget(),
        ),
        FFRoute(
          name: 'createAccountView',
          path: '/createAccountView',
          builder: (context, params) => CreateAccountViewWidget(
            role: params.getParam<UserRole>(
              'role',
              ParamType.Enum,
            ),
          ),
        ),
        FFRoute(
          name: 'loginView',
          path: '/loginView',
          builder: (context, params) => const LoginViewWidget(),
        ),
        FFRoute(
          name: 'signupSelectionView',
          path: '/signupSelectionView',
          builder: (context, params) => SignupSelectionViewWidget(
            isFromGoogleLogin: params.getParam(
              'isFromGoogleLogin',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'AuthCheckView',
          path: '/authCheckView',
          builder: (context, params) => const AuthCheckViewWidget(),
        ),
        FFRoute(
          name: 'ChatDetailView',
          path: '/chatDetailView',
          asyncParams: {
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => ChatDetailViewWidget(
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'chat_2_main',
          path: '/chat2Main',
          builder: (context, params) => const Chat2MainWidget(),
        ),
        FFRoute(
          name: 'ChatInviteUsers',
          path: '/chatInviteUsers',
          asyncParams: {
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
            'chats': getDocList(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => ChatInviteUsersWidget(
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
            chats: params.getParam<ChatsRecord>(
              'chats',
              ParamType.Document,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: 'image_Details',
          path: '/imageDetails',
          asyncParams: {
            'chatMessage':
                getDoc(['chat_messages'], ChatMessagesRecord.fromSnapshot),
          },
          builder: (context, params) => ImageDetailsWidget(
            chatMessage: params.getParam(
              'chatMessage',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'ChangePassword',
          path: '/changePassword',
          builder: (context, params) => const ChangePasswordWidget(),
        ),
        FFRoute(
          name: 'FriendsView',
          path: '/friendsView',
          builder: (context, params) => const FriendsViewWidget(),
        ),
        FFRoute(
          name: 'BlockUsersView',
          path: '/blockUsersView',
          builder: (context, params) => const BlockUsersViewWidget(),
        ),
        FFRoute(
          name: 'ContactSupport',
          path: '/contactSupport',
          builder: (context, params) => const ContactSupportWidget(),
        ),
        FFRoute(
          name: 'EditUserProfile',
          path: '/editUserProfile',
          builder: (context, params) => const EditUserProfileWidget(),
        ),
        FFRoute(
          name: 'termsOfUse',
          path: '/termsOfUse',
          builder: (context, params) => const TermsOfUseWidget(),
        ),
        FFRoute(
          name: 'createprofiluserCopy',
          path: '/createprofiluserCopy',
          builder: (context, params) => const CreateprofiluserCopyWidget(),
        )
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
            return '/welcomeVideoView';
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
                  color: FlutterFlowTheme.of(context).primaryText,
                  child: Center(
                    child: Image.asset(
                      'assets/images/png.png',
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : page;

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

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
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
