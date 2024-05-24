import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatefulWidget {
  final pokemonDetail;
  final Color? color;
  final Object? heroTag;

  const PokemonDetailScreen(
      {super.key, this.pokemonDetail, this.color, this.heroTag});
  @override
  _PokemonDetailScreenState createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 40,
            left: 1,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
              iconSize: 30,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
              top: 90,
              left: 20,
              child: Text(
                widget.pokemonDetail['name'],
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              )),
          Positioned(
              top: 140,
              left: 20,
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.black26),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.pokemonDetail['type'].join(', '),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )),
          Positioned(
            top: height * 0.23,
            right: -40,
            child: Image.asset(
              'images/pokeball.png',
              height: 200,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.6,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: width * 0.3,
                                child: const Text(
                                  'Name',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 16),
                                )),
                            Expanded(
                              child: Text(
                                widget.pokemonDetail['name'],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: width * 0.3,
                                child: const Text(
                                  'Height',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 16),
                                )),
                            Expanded(
                              child: Text(
                                widget.pokemonDetail['height'],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: width * 0.3,
                                child: const Text(
                                  'Weight',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 16),
                                )),
                            Expanded(
                              child: Text(
                                widget.pokemonDetail['weight'],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: width * 0.3,
                                child: const Text(
                                  'Spawn Time',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 16),
                                )),
                            Expanded(
                              child: Text(
                                widget.pokemonDetail['spawn_time'],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: width * 0.3,
                                child: const Text(
                                  'Weakness',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 16),
                                )),
                            Expanded(
                              child: Text(
                                widget.pokemonDetail['weaknesses'].join(", "),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: width * 0.3,
                                child: const Text(
                                  'Pre Evolution',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 16),
                                )),
                            widget.pokemonDetail['prev_evolution'] != null
                                ? SizedBox(
                                    height: 20,
                                    width: width * 0.55,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: widget
                                          .pokemonDetail['prev_evolution']
                                          .length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Text(
                                            widget.pokemonDetail[
                                                    'prev_evolution'][index]
                                                ['name'],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : const Text(
                                    'Just Hatched',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: width * 0.3,
                                child: const Text(
                                  'Evolution',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 16),
                                )),
                            widget.pokemonDetail['next_evolution'] != null
                                ? SizedBox(
                                    height: 20,
                                    width: width * 0.55,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: widget
                                          .pokemonDetail['next_evolution']
                                          .length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Text(
                                            widget.pokemonDetail[
                                                    'next_evolution'][index]
                                                ['name'],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : const Text(
                                    'Maxed Out',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: (height * 0.19),
            left: (width / 2) - 100,
            child: Hero(
              tag: widget.heroTag!,
              child: CachedNetworkImage(
                imageUrl: widget.pokemonDetail['img'],
                height: 150,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
