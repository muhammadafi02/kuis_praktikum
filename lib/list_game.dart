import 'package:flutter/material.dart';
import 'package:kuispraktikum/game_store.dart';
import 'package:kuispraktikum/detail_game.dart';

class listgame extends StatefulWidget {
  const listgame({Key? key}) : super(key: key);

  @override
  State<listgame> createState() => _listgameState();
}

class _listgameState extends State<listgame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
                "List Game")),
      ),
      body: ListView.builder(itemBuilder: (context,index) {
        final GameStore game = gameList[index];
        return Card(
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return DetailGame(game: game);
              }
              )
              );
            },
            child: Container(
              height: (MediaQuery.of(context).size.height)/4,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Image.network(game.imageUrls[0], fit: BoxFit.cover, width: MediaQuery.of(context).size.width,color: Colors.black45, colorBlendMode: BlendMode.darken,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Cover(game.name),
                      Cover(game.price),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
        itemCount: gameList.length,
      )
    );
  }

  Widget Cover(String text){
    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Colors.white,
        fontSize: 30,
      ),
    );
  }
}
