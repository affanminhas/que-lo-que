import '/business_user_screens/business_chat_view/business_chat_view_widget.dart';
import '/business_user_screens/business_create_activity_view/business_create_activity_view_widget.dart';
import '/business_user_screens/business_create_advertise_view/business_create_advertise_view_widget.dart';
import '/business_user_screens/business_home_view/business_home_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_screens/user_find_friend_view/user_find_friend_view_widget.dart';
import 'business_dashboard_widget.dart' show BusinessDashboardWidget;
import 'package:flutter/material.dart';

class BusinessDashboardModel extends FlutterFlowModel<BusinessDashboardWidget> {
  ///  Local state fields for this page.

  int selectedIndex = 0;

  ///  State fields for stateful widgets in this page.

  // Model for businessHomeView component.
  late BusinessHomeViewModel businessHomeViewModel;
  // Model for businessChatView component.
  late BusinessChatViewModel businessChatViewModel;
  // Model for userFindFriendView component.
  late UserFindFriendViewModel userFindFriendViewModel;
  // Model for businessCreateActivityView component.
  late BusinessCreateActivityViewModel businessCreateActivityViewModel;
  // Model for businessCreateAdvertiseView component.
  late BusinessCreateAdvertiseViewModel businessCreateAdvertiseViewModel;

  @override
  void initState(BuildContext context) {
    businessHomeViewModel = createModel(context, () => BusinessHomeViewModel());
    businessChatViewModel = createModel(context, () => BusinessChatViewModel());
    userFindFriendViewModel =
        createModel(context, () => UserFindFriendViewModel());
    businessCreateActivityViewModel =
        createModel(context, () => BusinessCreateActivityViewModel());
    businessCreateAdvertiseViewModel =
        createModel(context, () => BusinessCreateAdvertiseViewModel());
  }

  @override
  void dispose() {
    businessHomeViewModel.dispose();
    businessChatViewModel.dispose();
    userFindFriendViewModel.dispose();
    businessCreateActivityViewModel.dispose();
    businessCreateAdvertiseViewModel.dispose();
  }
}
