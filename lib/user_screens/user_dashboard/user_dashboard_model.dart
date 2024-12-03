import '/flutter_flow/flutter_flow_util.dart';
import '/user_screens/user_chat_view/user_chat_view_widget.dart';
import '/user_screens/user_create_activity_view/user_create_activity_view_widget.dart';
import '/user_screens/user_create_advertise_view/user_create_advertise_view_widget.dart';
import '/user_screens/user_find_friend_view/user_find_friend_view_widget.dart';
import '/user_screens/user_home_view/user_home_view_widget.dart';
import 'user_dashboard_widget.dart' show UserDashboardWidget;
import 'package:flutter/material.dart';

class UserDashboardModel extends FlutterFlowModel<UserDashboardWidget> {
  ///  Local state fields for this page.

  int selectedIndex = 0;

  ///  State fields for stateful widgets in this page.

  // Model for userHomeView component.
  late UserHomeViewModel userHomeViewModel;
  // Model for userChatView component.
  late UserChatViewModel userChatViewModel;
  // Model for userFindFriendView component.
  late UserFindFriendViewModel userFindFriendViewModel;
  // Model for userCreateActivityView component.
  late UserCreateActivityViewModel userCreateActivityViewModel;
  // Model for userCreateAdvertiseView component.
  late UserCreateAdvertiseViewModel userCreateAdvertiseViewModel;

  @override
  void initState(BuildContext context) {
    userHomeViewModel = createModel(context, () => UserHomeViewModel());
    userChatViewModel = createModel(context, () => UserChatViewModel());
    userFindFriendViewModel =
        createModel(context, () => UserFindFriendViewModel());
    userCreateActivityViewModel =
        createModel(context, () => UserCreateActivityViewModel());
    userCreateAdvertiseViewModel =
        createModel(context, () => UserCreateAdvertiseViewModel());
  }

  @override
  void dispose() {
    userHomeViewModel.dispose();
    userChatViewModel.dispose();
    userFindFriendViewModel.dispose();
    userCreateActivityViewModel.dispose();
    userCreateAdvertiseViewModel.dispose();
  }
}
