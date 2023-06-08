// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:video_player/video_player.dart';

class VideoLoader extends StatefulWidget {
  const VideoLoader({
    Key? key,
    this.width,
    this.height,
    required this.videoUrl,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String videoUrl;

  @override
  _VideoLoaderState createState() => _VideoLoaderState();
}

class _VideoLoaderState extends State<VideoLoader> {
  VideoPlayerController? _controller;
  bool _isPlaying = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl);
    _controller!.initialize().then((_) {
      setState(() {
        _controller!.addListener(_onPlaybackStateChange);
        _controller!.play(); // Start playing the video automatically
      });
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  void _onPlaybackStateChange() {
    if (_controller!.value.isPlaying && !_isPlaying) {
      _isPlaying = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (_controller != null) {
                  _controller!.value.isPlaying
                      ? _controller!.pause()
                      : _controller!.play();
                }
              });
            },
            child: _controller != null
                ? SizedBox.expand(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _controller!.value.size.width,
                        height: _controller!.value.size.height,
                        child: VideoPlayer(_controller!),
                      ),
                    ),
                  )
                : Container(),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    onPressed: () {
                      setState(() {
                        if (_controller != null) {
                          _controller!.value.volume == 0.0
                              ? _controller!.setVolume(1.0)
                              : _controller!.setVolume(0.0);
                        }
                      });
                    },
                    child: Icon(
                      _controller != null && _controller!.value.volume == 0.0
                          ? Icons.volume_off
                          : Icons.volume_up,
                    ),
                  ),
                  SizedBox(height: 16),
                  FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    onPressed: () {
                      setState(() {
                        if (_controller != null) {
                          _controller!.value.isPlaying
                              ? _controller!.pause()
                              : _controller!.play();
                        }
                      });
                    },
                    child: Icon(
                      _controller != null && _controller!.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
