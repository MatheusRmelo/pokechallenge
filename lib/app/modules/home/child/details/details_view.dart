import 'package:flutter/material.dart';
import 'package:pokemon/app/modules/home/models/pokeball_model.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';
import 'package:pokemon/utils/texts.dart';

class DetailsView extends StatelessWidget {
  const DetailsView(
      {Key? key,
      this.pokemon,
      this.catchPoke = false,
      this.pokeball,
      this.status = "",
      this.setObs,
      this.saveObs,
      this.setPokeball,
      this.goCatch})
      : super(key: key);

  final PokemonModel? pokemon;
  final bool catchPoke;
  final PokeballModel? pokeball;
  final String status;
  final Function? setObs;
  final Function? saveObs;
  final Function? setPokeball;
  final Function? goCatch;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  pokemon!.name,
                  style: tsHeading2,
                ),
                Text(
                  " - N° ${pokemon!.id.toString()}",
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
