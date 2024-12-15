import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'welcome_video_view_model.dart';
export 'welcome_video_view_model.dart';

class WelcomeVideoViewWidget extends StatefulWidget {
  /// This is video screen which will first come when user starts the app
  const WelcomeVideoViewWidget({super.key});

  @override
  State<WelcomeVideoViewWidget> createState() => _WelcomeVideoViewWidgetState();
}

class _WelcomeVideoViewWidgetState extends State<WelcomeVideoViewWidget> {
  late WelcomeVideoViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WelcomeVideoViewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: const Duration(milliseconds: 3000),
        callback: (timer) async {
          if (_model.instantTimer.tick == 2) {
            context.goNamed('loginView');
          }
        },
        startImmediately: true,
      );
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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.black,
          body: FlutterFlowVideoPlayer(
            path:
                'https://firebasestorage.googleapis.com/v0/b/que-lo-que-2-05vr7v.firebasestorage.app/o/AppAssets%2FQue%20Lo%20Que%20-%20Intro%20Video%20-%20Modif%20-%20FCP%20-%20Project%20Final%201%20(1).mp4?alt=media&token=2abd4edc-cd26-47d5-9548-a967c1e2501a',
            videoType: VideoType.network,
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            autoPlay: true,
            looping: false,
            showControls: false,
            allowFullScreen: true,
            allowPlaybackSpeedMenu: false,
          ),
        ),
      ),
    );
  }
}
