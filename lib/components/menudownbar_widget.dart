import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'menudownbar_model.dart';
export 'menudownbar_model.dart';

class MenudownbarWidget extends StatefulWidget {
  const MenudownbarWidget({super.key});

  @override
  State<MenudownbarWidget> createState() => _MenudownbarWidgetState();
}

class _MenudownbarWidgetState extends State<MenudownbarWidget> {
  late MenudownbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenudownbarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            Icons.person,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24.0,
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed('userchatpage');
            },
            child: Icon(
              Icons.chat,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed('userfindfriends');
            },
            child: Icon(
              Icons.search_sharp,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed('usercreateactivitypage');
            },
            child: Icon(
              Icons.local_activity,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed('usercreateadvertisepage');
            },
            child: Icon(
              Icons.campaign,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
