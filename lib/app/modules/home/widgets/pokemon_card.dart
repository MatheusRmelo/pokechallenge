import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';

Widget pokeCard(
    {int index = 0,
    String nextRouter = "details",
    required PokemonModel pokemon,
    double fullWidth = 60,
    double fullHeight = 60,
    bool catchPoke = false,
    bool showFavorite = true,
    required Function setFavorite}) {
  return GestureDetector(
    onTap: () {
      Modular.to.pushNamed(nextRouter,
          arguments: {'pokemon': pokemon, 'catchPoke': catchPoke});
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.blue[50],
      ),
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.network(
                pokemon.image,
                width: 100,
                height: 64,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("N° ${pokemon.id.toString()}"),
                  Text(pokemon.name)
                ],
              )
            ],
          ),
          showFavorite
              ? IconButton(
                  onPressed: () {
                    setFavorite(pokemon);
                  },
                  icon: Icon(
                    pokemon.favorite ? Icons.favorite : Icons.favorite_outline,
                    color: pokemon.favorite ? Colors.red : Colors.black,
                  ))
              : Container()
        ],
      ),
    ),
  );
}
