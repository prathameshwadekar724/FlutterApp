import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/models/music.dart';
import 'package:musicapp/views/home.dart';
import 'package:musicapp/views/library.dart';
import 'package:musicapp/views/search.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  var tabs = [];
  int currentTabIndex = 0;
  bool isPlaying = false;
  Music? music;
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;

  void _updatePosition(Duration position) {
    setState(() {
      _currentPosition = position;
    });
  }

  void _updateDuration(Duration duration) {
    setState(() {
      _totalDuration = duration;
    });
  }

  Widget miniplayer(Music? music, {bool stop = false}) {
    this.music = music;
    if (music == null) {
      return const SizedBox();
    }
    if (stop) {
      isPlaying = false;
      _audioPlayer.stop();
    }
    setState(() {});

    Size deviceSize = MediaQuery.of(context).size;

    _audioPlayer.onDurationChanged.listen(_updateDuration);
    _audioPlayer.onPositionChanged.listen(_updatePosition);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      color: Colors.blueGrey,
      width: deviceSize.width,
      height: 90,
      child: Row(
        children: [
          Image(image: AssetImage(music.image),fit: BoxFit.cover),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          music.name,
                          style: const TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                      // Add padding or spacing if needed between the name and slider
                    ],
                  ),
                ),
                // Slider and duration texts
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  child: Column(
                    children: [
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 5.0, // Adjust the track height
                          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0), // Adjust the thumb size
                          overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0), // Adjust the overlay size
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: 30,
                          child: Slider(
                            value: _currentPosition.inSeconds.toDouble(),
                            min: 0,
                            max: _totalDuration.inSeconds.toDouble(),
                            onChanged: (value) {
                              setState(() {
                                _currentPosition = Duration(seconds: value.toInt());
                              });
                              _audioPlayer.seek(_currentPosition);
                            },
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_formatDuration(_currentPosition)),
                          Text(_formatDuration(_totalDuration)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          IconButton(
            onPressed: () async {
              setState(() {
                isPlaying = !isPlaying;
              });
              if (isPlaying) {
                await _audioPlayer.play(AssetSource(music.audioUrl));
              } else {
                await _audioPlayer.pause();
              }
            },
            icon: isPlaying
                ? const Icon(Icons.pause, color: Colors.white)
                : const Icon(Icons.play_arrow, color: Colors.white),
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    tabs = [Home(miniplayer), Search(audioPlayer: _audioPlayer,onPlayMusic: miniplayer,), const Library()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentTabIndex],
      backgroundColor: Colors.black,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          miniplayer(music),
          BottomNavigationBar(
            currentIndex: currentTabIndex,
            onTap: (currentIndex) {
              setState(() {
                currentTabIndex = currentIndex;
              });
            },
            selectedLabelStyle: const TextStyle(color: Colors.white),
            selectedItemColor: Colors.white,
            backgroundColor: Colors.black45,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.white), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search, color: Colors.white),
                  label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.library_add, color: Colors.white),
                  label: "Library"),
            ],
          ),
        ],
      ),
    );
  }
}


