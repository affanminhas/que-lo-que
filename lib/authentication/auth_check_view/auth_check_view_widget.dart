import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'auth_check_view_model.dart';
export 'auth_check_view_model.dart';

class AuthCheckViewWidget extends StatefulWidget {
  const AuthCheckViewWidget({super.key});

  @override
  State<AuthCheckViewWidget> createState() => _AuthCheckViewWidgetState();
}

class _AuthCheckViewWidgetState extends State<AuthCheckViewWidget> {
  late AuthCheckViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthCheckViewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userData = await queryUsersRecordOnce(
        queryBuilder: (usersRecord) => usersRecord.where(
          'email',
          isEqualTo: currentUserEmail,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (valueOrDefault(currentUserDocument?.role, '') != '') {
        if (_model.userData?.role == UserRole.IndividualUser.name) {
          if (currentUserDocument?.individualUserRef != null) {
            context.goNamed('userDashboard');
          } else {
            context.goNamed('createprofiluser');
          }

          return;
        } else {
          if (currentUserDocument?.businessOwnerRef != null) {
            context.goNamed('businessDashboard');
          } else {
            context.goNamed('createbusinessprofil');
          }
        }
      } else {
        context.goNamed(
          'signupSelectionView',
          queryParameters: {
            'isFromGoogleLogin': serializeParam(
              true,
              ParamType.bool,
            ),
          }.withoutNulls,
        );
      }
    });

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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '2ulinylv' /* Loading .... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 18.0,
                          letterSpacing: 0.0,
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
