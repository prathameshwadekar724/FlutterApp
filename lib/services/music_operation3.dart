import 'package:musicapp/models/music.dart';

class MusicOperation3{
  MusicOperation3._();
  static List<Music> getMusic(){
    return <Music>[
      Music('Ae Dil hai Mushkil', 'assets/img_4.png', 'Ae Dil Hai Mushkil','adhm.mp3'),
      Music('Tum Hi ho', 'assets/img_5.png', 'Aashiqui 2','song.mp3'),
      Music('Tum Hi Aana', 'assets/img_6.png', 'Marjaavaan','tha.mp3'),
    ];
  }
}