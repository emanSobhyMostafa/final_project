import 'dart:io';

import 'package:final_project/config/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meedu_player/meedu_player.dart';

class MyVideoPlayer extends StatefulWidget {
  final String path;

  const MyVideoPlayer({Key key, this.path}) : super(key: key);
  @override
  _MyVideoPlayerState createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  final _meeduPlayerController = MeeduPlayerController(
    colorTheme: primary,
    controlsStyle: ControlsStyle.primary,
    pipEnabled: false,
    screenManager: ScreenManager(forceLandScapeInFullscreen: false),
  );

  @override
  void initState() {
    _meeduPlayerController.setDataSource(
      DataSource(type: DataSourceType.network, source: widget.path),
      autoplay: true,
      looping: true,
    );

    super.initState();
  }

  @override
  void dispose() {
    _meeduPlayerController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .25,
      width: size.width,
      // padding: EdgeInsets.symmetric(vertical: 200),
      child: MeeduVideoPlayer(
        controller: _meeduPlayerController,
      ),
    );
  }
}
