import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';

Widget pokeCard(
    {int index = 0,
    PokemonModel? pokemon,
    double fullWidth = 60,
    double fullHeight = 60}) {
  return GestureDetector(
    onTap: () async {
      Modular.to.pushNamed("details", arguments: pokemon);
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.red,
      ),
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Image.network(
            pokemon!.image,
            width: 100,
            height: 64,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("N° ${pokemon.id.toString()}"), Text(pokemon.name)],
          )
        ],
      ),
    ),
  );
}
