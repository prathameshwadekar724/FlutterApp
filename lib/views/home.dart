import 'package:flutter/material.dart';
import 'package:musicapp/models/categories.dart';
import 'package:musicapp/models/music.dart';
import 'package:musicapp/services/category_options.dart';
import 'package:musicapp/services/music_operation.dart';
import 'package:musicapp/services/music_operation2.dart';
import 'package:musicapp/services/music_operation3.dart';

class Home extends StatelessWidget {
  final Function _miniplayer;
  const Home(this._miniplayer, {super.key});

  Widget createCategory(Categories category,BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade400,
      child: Row(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.2, // Responsive height
            width: MediaQuery.of(context).size.width * 0.2, // Responsive width
            child: Image.asset(category.imageURl, fit: BoxFit.cover),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                category.name,
                style: const TextStyle(color: Colors.white,fontSize: 13),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
  List<Widget> createList(BuildContext context) {
    List<Categories> categoryList = CategoryOptions.getCategories();
    return categoryList.map((Categories category) => createCategory(category,context)).toList();
  }

  Widget createMusic(Music music) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
            width: 150,
            child: InkWell(
              onTap: () {
                _miniplayer(music, stop: true);
              },
              child: Image.asset(
                music.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            music.name,
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            music.desc,
            style: const TextStyle(color: Colors.white),
            overflow: TextOverflow.ellipsis, // Handle overflow
          ),
        ],
      ),
    );
  }

  Widget createMusicList(String label) {
    List<Music> musicList = MusicOperation.getMusic();
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return createMusic(musicList[index]);
              },
              itemCount: musicList.length,
            ),
          ),
        ],
      ),
    );
  }
  Widget createMusicList2(String label) {
    List<Music> musicList = MusicOperation2.getMusic();
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return createMusic(musicList[index]);
              },
              itemCount: musicList.length,
            ),
          ),
        ],
      ),
    );
  }
  Widget createMusicList3(String label) {
    List<Music> musicList = MusicOperation3.getMusic();
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return createMusic(musicList[index]);
              },
              itemCount: musicList.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget createGrid(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 280,
      child: GridView.count(
        childAspectRatio: 5 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: createList(context),
      ),
    );
  }

  Widget createAppBar(String message) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(
        message,
        style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(Icons.settings, color: Colors.white),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueGrey.shade300, Colors.black],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.1, 0.3],
            ),
          ),
          child: Column(
            children: [
              createAppBar('Good Morning'),
              const SizedBox(height: 5),
              createGrid(context),
              createMusicList('Made For You'),
              createMusicList2('Marathi Hits'),
              createMusicList3('Hindi Hits'),
            ],
          ),
        ),
      ),
    );
  }
}
