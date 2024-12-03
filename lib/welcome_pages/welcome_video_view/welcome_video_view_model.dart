import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'welcome_video_view_widget.dart' show WelcomeVideoViewWidget;
import 'package:flutter/material.dart';

class WelcomeVideoViewModel extends FlutterFlowModel<WelcomeVideoViewWidget> {
  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
