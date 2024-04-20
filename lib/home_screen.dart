import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_pokedex/pokemon_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pokeApi =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  List? pokedex = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (mounted) {
      fetchPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(children: [
      Positioned(
          top: -50,
          right: -50,
          child: Image.asset(
            'images/pokeball.png',
            width: 200,
            fit: BoxFit.fitWidth,
          )),
      const Positioned(
          top: 80,
          left: 20,
          child: Text(
            "Pokedex",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          )),
      Positioned(
        top: 150,
        bottom: 0,
        width: width,
        child: Column(
          children: [
            pokedex != null
                ? Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.4,
                      ),
                      itemCount: pokedex!.length,
                      itemBuilder: (context, index) {
                        var type = pokedex![index]['type'][0];
                        return InkWell(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: type == 'Grass'
                                      ? Colors.greenAccent
                                      : type == 'Fire'
                                          ? Colors.redAccent
                                          : type == "Water"
                                              ? Colors.blueAccent
                                              : type == "Electric"
                                                  ? Colors.yellowAccent
                                                  : type == "Rock"
                                                      ? const Color.fromARGB(
                                                          255, 132, 99, 51)
                                                      : type == "Ground"
                                                          ? const Color.fromRGBO(
                                                              221, 171, 54, 1)
                                                          : type == "Psychic"
                                                              ? Colors.pink
                                                              : type ==
                                                                      "Fighting"
                                                                  ? Colors
                                                                      .orangeAccent
                                                                  : type ==
                                                                          "Bug"
                                                                      ? Colors
                                                                          .lightGreenAccent
                                                                      : type ==
                                                                              "Ghost"
                                                                          ? Colors
                                                                              .deepPurple
                                                                          : type == "Normal"
                                                                              ? Colors.grey
                                                                              : type == "Poison"
                                                                                  ? Colors.purple
                                                                                  : type == "Ice"
                                                                                      ? Colors.lightBlueAccent
                                                                                      : const Color.fromARGB(255, 86, 98, 156),
                                  borderRadius: const BorderRadius.all(Radius.circular(20))),
                              child: Stack(children: [
                                Positioned(
                                  bottom: -10,
                                  right: -10,
                                  child: Image.asset(
                                    'images/pokeball.png',
                                    height: 100,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                Positioned(
                                    top: 20,
                                    left: 20,
                                    child: Text(
                                      pokedex![index]['name'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white),
                                    )),
                                Positioned(
                                    top: 50,
                                    left: 20,
                                    child: Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.black26,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0,
                                                right: 8.0,
                                                top: 4,
                                                bottom: 4),
                                            child: Text(
                                              type.toString(),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            )))),
                                Positioned(
                                    bottom: 5,
                                    right: 5,
                                    child: Hero(
                                      tag: index,
                                      child: CachedNetworkImage(
                                          imageUrl: pokedex![index]['img'],
                                          height: 100,
                                          fit: BoxFit.fitHeight),
                                    )),
                              ]),
                            ),
                          ),
                          onTap: () {
                            //TODO Navigate to new detail screen
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => PokemonDetailScreen(
                                          pokemonDetail: pokedex![index],
                                          color: type == 'Grass'
                                              ? Colors.greenAccent
                                              : type == 'Fire'
                                                  ? Colors.redAccent
                                                  : type == "Water"
                                                      ? Colors.blueAccent
                                                      : type == "Electric"
                                                          ? Colors.yellowAccent
                                                          : type == "Rock"
                                                              ? Colors.brown
                                                              : type == "Ground"
                                                                  ? const Color
                                                                      .fromRGBO(
                                                                          221,
                                                                          171,
                                                                          54,
                                                                          1)
                                                                  : type ==
                                                                          "Psychic"
                                                                      ? Colors
                                                                          .pink
                                                                      : type ==
                                                                              "Fighting"
                                                                          ? Colors
                                                                              .orangeAccent
                                                                          : type == "Bug"
                                                                              ? Colors.lightGreenAccent
                                                                              : type == "Ghost"
                                                                                  ? Colors.deepPurple
                                                                                  : type == "Normal"
                                                                                      ? Colors.grey
                                                                                      : type == "Poison"
                                                                                          ? Colors.purple
                                                                                          : type == "Ice"
                                                                                              ? Colors.lightBlueAccent
                                                                                              : const Color.fromARGB(255, 86, 98, 156),
                                          heroTag: index,
                                        )));
                          },
                        );
                      },
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  )
          ],
        ),
      ),
    ]));
  }

  void fetchPokemonData() {
    var url = Uri.http("raw.githubusercontent.com",
        "/Biuni/PokemonGO-Pokedex/master/pokedex.json");

    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodedJsonData = jsonDecode(value.body);
        pokedex = decodedJsonData['pokemon'];
        setState(() {});
      }
    });
  }
}
