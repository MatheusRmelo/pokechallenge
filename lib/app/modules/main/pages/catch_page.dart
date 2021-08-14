import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/modules/home/child/catch/catch_view.dart';
import 'package:pokemon/app/modules/home/child/details/details_view.dart';
import 'package:pokemon/app/modules/home/models/pokeball_model.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';
import 'package:pokemon/app/modules/home/repository/firestore_repository.dart';
import 'package:pokemon/app/modules/main/main_controller.dart';
import 'package:pokemon/utils/texts.dart';

class CatchPage extends StatefulWidget {
  const CatchPage({Key? key, PokemonModel? this.pokemon}) : super(key: key);

  final PokemonModel? pokemon;

  @override
  _CatchPageState createState() => _CatchPageState();
}

class _CatchPageState extends State<CatchPage> {
  MainController controller = Modular.get<MainController>();
  FirestoreRepository repository = Modular.get<FirestoreRepository>();

  String doc = "";
  String obs = "";
  PokeballModel pokeball = PokeballModel("pokeball", 100);
  String status = "";
  bool catchPoke = false;

  @override
  void initState() {
    super.initState();
    print("IS HERE");
    controller.discoveryPokemon(widget.pokemon!);
  }

  void getDiscoveryPokemon() async {
    controller.discoveryPokemon(widget.pokemon!);
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
            Container(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pokemon.name,
                    style: tsHeading2,
                  ),
                  Text(
                    "Chance de captura ${pokemon.baseExperience >= 200 ? "díficil" : pokemon.baseExperience >= 100 && pokemon.baseExperience < 200 ? "média" : "fácil"}",
                  )
                ],
              ),
            ),
            catchPoke
                ? Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 32, bottom: 16),
                        child: Image.asset(
                          "assets/${pokeball.name}_catch.png",
                          width: 64,
                        ),
                      ),
                      Text(status),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        margin: EdgeInsets.only(top: 16, bottom: 16),
                        padding: EdgeInsets.only(left: 8),
                        height: 100,
                        child: TextFormField(
                          onChanged: (text) {
                            setObs(text);
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Observações da captura"),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                        ),
                      ),
                      Container(
                        width: size.width * 0.6,
                        child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.green),
                            onPressed: () {
                              saveObs();
                            },
                            child: Text("Continuar")),
                      )
                    ],
                  )
                : Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: Text("Escolha uma pokébola"),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setPokeball("pokeball", 100);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: pokeball.name == "pokeball"
                                        ? Border.all(color: Colors.black)
                                        : null),
                                padding: EdgeInsets.all(8),
                                child: Image.asset(
                                  "assets/pokeball.png",
                                  width: 64,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setPokeball("greatball", 200);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: pokeball.name == "greatball"
                                        ? Border.all(color: Colors.black)
                                        : null),
                                padding: EdgeInsets.all(8),
                                child: Image.asset(
                                  "assets/greatball.png",
                                  width: 64,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setPokeball("ultraball", 300);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: pokeball.name == "ultraball"
                                        ? Border.all(color: Colors.black)
                                        : null),
                                padding: EdgeInsets.all(8),
                                child: Image.asset(
                                  "assets/ultraball.png",
                                  width: 64,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 200,
                        margin: EdgeInsets.only(top: 16),
                        child: ElevatedButton(
                            onPressed: () {
                              goCatch();
                            },
                            child: Text(
                                "Jogar ${pokeball.name} x${(pokeball.rate / 100).toStringAsFixed(0)}")),
                      ),
                      Text(status)
                    ],
                  ),
          ],
        ),
      )),
    );
  }
}
