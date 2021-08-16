import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/modules/home/child/discovery/discovery_controller.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';
import 'package:pokemon/app/modules/home/widgets/pokemon_card.dart';
import 'package:pokemon/utils/texts.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({Key? key}) : super(key: key);

  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  final controller = Modular.get<DiscoveryController>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Observer(builder: (context) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Modular.to.pop();
            },
          ),
        ),
        body: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Pesquise um pokémon",
                style: tsHeading2,
              ),
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset.fromDirection(1, 1),
                      spreadRadius: 0),
                ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
                margin: EdgeInsets.all(16),
                child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(16),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Pesquise pelo nome ou número',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        suffixIcon: Icon(
                          Icons.search,
                          size: 32,
                        )),
                    onChanged: (text) {
                      controller.search = text;
                    }),
              ),
              controller.loading
                  ? Container(
                      margin: EdgeInsets.only(top: 64),
                      child: CircularProgressIndicator(),
                    )
                  : controller.initialSearch
                      ? Container(
                          child: Text("Pesquise o pokémon encontrado"),
                        )
                      : controller.pokemons.length == 0
                          ? Container(
                              child: Text("Pokémon não encontrado"),
                            )
                          : Expanded(
                              child: Container(
                              padding: const EdgeInsets.all(16),
                              child: ListView.builder(
                                itemCount: controller.pokemons.length,
                                itemBuilder: (context, index) {
                                  PokemonModel pokemon =
                                      controller.pokemons[index];
                                  return pokeCard(
                                      nextRouter: "catch",
                                      index: index,
                                      pokemon: pokemon,
                                      fullHeight: size.height,
                                      fullWidth: size.width,
                                      setFavorite: () {},
                                      showFavorite: false);
                                },
                              ),
                            ))
            ],
          ),
        ),
      );
    });
  }
}
