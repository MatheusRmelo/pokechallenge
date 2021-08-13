import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/modules/home/child/details/details_view.dart';
import 'package:pokemon/app/modules/home/models/pokeball_model.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';
import 'package:pokemon/app/modules/home/repository/firestore_repository.dart';
import 'package:pokemon/app/modules/main/main_controller.dart';
import 'package:pokemon/utils/texts.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key, PokemonModel? this.pokemon}) : super(key: key);

  final PokemonModel? pokemon;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  MainController controller = Modular.get<MainController>();

  FirestoreRepository repository = Modular.get<FirestoreRepository>();

  String doc = "";
  String obs = "";
  PokeballModel pokeball = PokeballModel("pokeball", 100);
  String status = "";
  bool catchPoke = false;

  void initState() {
    super.initState();
    controller.discoveryPokemon(widget.pokemon!);
  }

  void getDiscoveryPokemon() async {
    await repository.discoveryPokemon(widget.pokemon);
  }

  void goCatch() async {
    Random random = new Random();
    int randomNumber = random.nextInt(pokeball.rate);
    if (widget.pokemon!.baseExperience <= randomNumber) {
      var result = await repository.saveCatch(widget.pokemon, pokeball.name);
      if (result != "") {
        setState(() {
          doc = result;
          catchPoke = true;
          status = "Parabéns! Você capturou o ${widget.pokemon!.name}";
        });
      } else {
        setState(() {
          status = "Falha ao salvar o catch!";
        });
      }
    } else {
      setState(() {
        catchPoke = false;
        status = "Sua ${pokeball.name} quebrou :(";
      });
    }
  }

  void setObs(String text) {
    setState(() {
      obs = text;
    });
  }

  void setPokeball(String name, int rate) {
    setState(() {
      pokeball = PokeballModel(name, rate);
    });
  }

  void saveObs() async {
    var result = await repository.saveObs(doc, obs);
    if (result) {
      Modular.to.navigate("/home");
    }
  }

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
