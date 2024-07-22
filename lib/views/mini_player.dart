import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MiniPlayer extends StatelessWidget {
  final AudioPlayer audioPlayer;
  final String trackName;
  final String trackImage;
  final VoidCallback onPlayPause;
  final bool isPlaying;

  MiniPlayer({
    required this.audioPlayer,
    required this.trackName,
    required this.trackImage,
    required this.onPlayPause,
    required this.isPlaying,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.8),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      height: 60.0,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              trackImage,
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Text(
              trackName,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
          IconButton(
            icon: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
            ),
            onPressed: onPlayPause,
          ),
        ],
      ),
    );
  }
}
