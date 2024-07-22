import 'package:musicapp/models/music.dart';
class MusicOperation2{
  MusicOperation2._();
  static List<Music> getMusic(){
    return <Music>[
      Music('Man Udhan Varyache', 'assets/img_3.png', 'Ag Bai Arrechya','muv.mp3'),
      Music('Saj Hyo Tuza', 'assets/img_7.png', 'Baban', 'sjt.mp3'),
      Music('Datle Reshmi', 'assets/img_9.png', 'TimePas', 'dr.mp3'),
      Music('Harvli Pakhare', 'assets/img_10.png', 'Balak Palak', 'hp.mp3'),
      Music('Man Dhaga Dhga', 'assets/img_12.png', 'Dagdi Chawl', 'mddrmp3.mp3'),
      Music('Mala Ved Lagle', 'assets/img_9.png', 'TimePass', 'mvpmp3.mp3'),
      Music('Kadhi Tu', 'assets/img_11.png', 'Mumbai Pune Mumbai', 'kt.mp3'),
      Music('Tola Tola', 'assets/img_8.png', 'Tu Hi Re', 'tt.mp3'),
    ];
  }
}