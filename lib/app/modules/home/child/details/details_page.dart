import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/modules/home/models/pokeball_model.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';
import 'package:pokemon/utils/texts.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key, PokemonModel? this.pokemon}) : super(key: key);

  final PokemonModel? pokemon;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PokemonModel? pokemon = widget.pokemon;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(16)),
              margin: EdgeInsets.only(bottom: 16),
              width: size.width,
              height: size.height * 0.3,
              child: Image.network(pokemon!.image),
            ),
            Row(
              children: [
                Text(
                  pokemon.name,
                  style: tsHeading2,
                ),
                Text(
                  " - N° ${pokemon.id.toString()}",
                  style: tsHeading2,
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
