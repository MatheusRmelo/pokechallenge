import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/modules/home/child/catch/catch_view.dart';
import 'package:pokemon/app/modules/home/child/details/details_view.dart';
import 'package:pokemon/app/modules/home/models/pokeball_model.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';
import 'package:pokemon/app/modules/home/repository/firestore_repository.dart';

class CatchController extends StatefulWidget {
  const CatchController({Key? key, PokemonModel? this.pokemon})
      : super(key: key);

  final PokemonModel? pokemon;

  @override
  _CatchControllerState createState() => _CatchControllerState();
}

class _CatchControllerState extends State<CatchController> {
  FirestoreRepository repository = Modular.get<FirestoreRepository>();

  String doc = "";
  String obs = "";
  PokeballModel pokeball = PokeballModel("pokeball", 100);
  String status = "";
  bool catchPoke = false;

  @override
  void initState() {
    super.initState();
    getDiscoveryPokemon();
  }

  void getDiscoveryPokemon() async {
    await repository.discoveryPokemon(widget.pokemon);
  }

  @override
  Widget build(BuildContext context) {
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

    return CatchView(
      catchPoke: catchPoke,
      goCatch: goCatch,
      pokeball: pokeball,
      pokemon: widget.pokemon,
      saveObs: saveObs,
      setObs: setObs,
      setPokeball: setPokeball,
      status: status,
    );
  }
}
