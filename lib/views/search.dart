import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/models/music.dart';
import 'package:musicapp/services/music_operation.dart';

class Search extends StatelessWidget {
  final AudioPlayer audioPlayer;
  final Function(Music) onPlayMusic;
  Search({super.key, required this.audioPlayer, required this.onPlayMusic});
  final TextEditingController _searchController = TextEditingController();
  final List<Music> _allMusic= MusicOperation.getMusic();
  final ValueNotifier<List<Music>> filteredMusic = ValueNotifier<List<Music>>([]);
  void _filterMusic(String query){
    if (query.isEmpty) {
      filteredMusic.value = [];
    }
    else {
      final result = _allMusic
          .where((music) => music.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      filteredMusic.value = result;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search Music',
                hintStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixIcon: const Icon(Icons.search,color: Colors.grey,),
              ),
              onChanged: (query){
                _filterMusic(query);
              },
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<List<Music>>(
              valueListenable: filteredMusic,
              builder: (context,filteredMusic, _){
                return filteredMusic.isNotEmpty ?
                    ListView.builder(
                      itemCount: filteredMusic.length,
                      itemBuilder: (context,index){
                        final music = filteredMusic[index];
                        return ListTile(
                          leading: Image.asset(music.image,fit: BoxFit.cover,width: 50,height: 50,),
                          title: Text(music.name,style: const TextStyle(color: Colors.white),),
                          onTap: (){
                            onPlayMusic(music);
                          },
                        );
                      },
                    )
                    : const Center(
                  child: Text(
                    'Search Music',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
