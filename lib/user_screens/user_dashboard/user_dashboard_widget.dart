import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_screens/user_chat_view/user_chat_view_widget.dart';
import '/user_screens/user_create_activity_view/user_create_activity_view_widget.dart';
import '/user_screens/user_create_advertise_view/user_create_advertise_view_widget.dart';
import '/user_screens/user_find_friend_view/user_find_friend_view_widget.dart';
import '/user_screens/user_home_view/user_home_view_widget.dart';
import 'package:flutter/material.dart';
import 'user_dashboard_model.dart';
export 'user_dashboard_model.dart';

class UserDashboardWidget extends StatefulWidget {
  /// This is the screen where user will land after signup or login
  const UserDashboardWidget({super.key});

  @override
  State<UserDashboardWidget> createState() => _UserDashboardWidgetState();
}

class _UserDashboardWidgetState extends State<UserDashboardWidget> {
  late UserDashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserDashboardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              if (_model.selectedIndex == 0)
                wrapWithModel(
                  model: _model.userHomeViewModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const UserHomeViewWidget(),
                ),
              if (_model.selectedIndex == 1)
                wrapWithModel(
                  model: _model.userChatViewModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const UserChatViewWidget(),
                ),
              if (_model.selectedIndex == 2)
                wrapWithModel(
                  model: _model.userFindFriendViewModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const UserFindFriendViewWidget(),
                ),
              if (_model.selectedIndex == 3)
                wrapWithModel(
                  model: _model.userCreateActivityViewModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const UserCreateActivityViewWidget(),
                ),
              if (_model.selectedIndex == 4)
                wrapWithModel(
                  model: _model.userCreateAdvertiseViewModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const UserCreateAdvertiseViewWidget(),
                ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                  child: Container(
                    width: double.infinity,
                    height: 272.0,
                    constraints: const BoxConstraints(
                      maxHeight: 60.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: FlutterFlowTheme.of(context).secondary,
                          offset: const Offset(
                            0.0,
                            2.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(16.0),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        width: 0.0,
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.selectedIndex = 0;
                              safeSetState(() {});
                            },
                            child: Icon(
                              Icons.home_sharp,
                              color: _model.selectedIndex == 0
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.selectedIndex = 1;
                              safeSetState(() {});
                            },
                            child: Icon(
                              Icons.chat,
                              color: _model.selectedIndex == 1
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.selectedIndex = 2;
                              safeSetState(() {});
                            },
                            child: Icon(
                              Icons.person_search,
                              color: _model.selectedIndex == 2
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.selectedIndex = 3;
                              safeSetState(() {});
                            },
                            child: Icon(
                              Icons.local_activity,
                              color: _model.selectedIndex == 3
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.selectedIndex = 4;
                              safeSetState(() {});
                            },
                            child: Icon(
                              Icons.campaign,
                              color: _model.selectedIndex == 4
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
