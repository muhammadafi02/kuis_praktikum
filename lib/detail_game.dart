import 'package:flutter/material.dart';
import 'game_store.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailGame extends StatefulWidget {
  final GameStore game;

  const DetailGame({Key? key, required this.game}) : super(key: key);

  @override
  State<DetailGame> createState() => _DetailGameState();
}

class _DetailGameState extends State<DetailGame> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.game.name}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: (MediaQuery
                  .of(context)
                  .size
                  .height) / 3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Image.network(widget.game.imageUrls[index]),
                  );
                },
                itemCount: widget.game.imageUrls.length,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Judul(widget.game.name),
                  SizedBox(height: 10,),
                  Deskripsi("Rilis : " + widget.game.releaseDate),
                  SizedBox(height: 10,),
                  Deskripsi("Harga : " + widget.game.price),
                  SizedBox(height: 10,),
                  Deskripsi(widget.game.about),
                  SizedBox(height: 10,),
                  Deskripsi("Rata-Rata Ulasan : " + widget.game.reviewAverage),
                  SizedBox(height: 10,),
                  Deskripsi("Total Ulasan : " + widget.game.reviewCount),
                  SizedBox(height: 10,),
                  Deskripsi("Genre :"),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height)/10,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: widget.game.tags.length,
                      ),
                      itemBuilder: (context,index){
                        return Column(
                          children: [
                            Deskripsi(widget.game.tags[index])
                          ],
                        );
                      },
                      itemCount: widget.game.tags.length,
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        _launchURL(widget.game.linkStore);
                      },
                      child: Text("Halaman Website"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget Judul(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 30),
    );
  }

  Widget Deskripsi(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16),
      textAlign: TextAlign.center,
    );
  }

  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
