import '/business_user_screens/business_chat_view/business_chat_view_widget.dart';
import '/business_user_screens/business_create_activity_view/business_create_activity_view_widget.dart';
import '/business_user_screens/business_create_advertise_view/business_create_advertise_view_widget.dart';
import '/business_user_screens/business_home_view/business_home_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_screens/user_find_friend_view/user_find_friend_view_widget.dart';
import 'package:flutter/material.dart';
import 'business_dashboard_model.dart';
export 'business_dashboard_model.dart';

class BusinessDashboardWidget extends StatefulWidget {
  const BusinessDashboardWidget({super.key});

  @override
  State<BusinessDashboardWidget> createState() =>
      _BusinessDashboardWidgetState();
}

class _BusinessDashboardWidgetState extends State<BusinessDashboardWidget> {
  late BusinessDashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BusinessDashboardModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              if (_model.selectedIndex == 0)
                wrapWithModel(
                  model: _model.businessHomeViewModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const BusinessHomeViewWidget(),
                ),
              if (_model.selectedIndex == 1)
                wrapWithModel(
                  model: _model.businessChatViewModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const BusinessChatViewWidget(),
                ),
              if (_model.selectedIndex == 2)
                wrapWithModel(
                  model: _model.userFindFriendViewModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const UserFindFriendViewWidget(),
                ),
              if (_model.selectedIndex == 3)
                wrapWithModel(
                  model: _model.businessCreateActivityViewModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const BusinessCreateActivityViewWidget(),
                ),
              if (_model.selectedIndex == 4)
                wrapWithModel(
                  model: _model.businessCreateAdvertiseViewModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const BusinessCreateAdvertiseViewWidget(),
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
