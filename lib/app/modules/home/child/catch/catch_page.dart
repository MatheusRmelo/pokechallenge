import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/modules/home/child/catch/catch_controller.dart';
import 'package:pokemon/app/modules/home/models/pokeball_model.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';
import 'package:pokemon/utils/texts.dart';

class CatchPage extends StatefulWidget {
  const CatchPage({Key? key, required this.pokemon}) : super(key: key);

  final PokemonModel pokemon;

  @override
  _CatchPageState createState() => _CatchPageState();
}

class _CatchPageState extends State<CatchPage> {
  final controller = Modular.get<CatchController>();

  @override
  void initState() {
    super.initState();
    controller.discoveryPokemon(widget.pokemon);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PokemonModel pokemon = widget.pokemon;

    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(16)),
                margin: const EdgeInsets.only(bottom: 16),
                width: size.width,
                height: size.height * 0.3,
                child: Image.network(pokemon.image),
              ),
              SizedBox(
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
              controller.catchPoke
                  ? Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 32, bottom: 16),
                          child: Image.asset(
                            "assets/${controller.pokeball.name}_catch.png",
                            width: 64,
                          ),
                        ),
                        Text(controller.status),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          margin: const EdgeInsets.only(top: 16, bottom: 16),
                          padding: const EdgeInsets.only(left: 8),
                          height: 100,
                          child: TextFormField(
                            onChanged: (text) {
                              controller.obs = text;
                            },
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Observações da captura"),
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.6,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green),
                              onPressed: controller.saveObs,
                              child: const Text("Continuar")),
                        )
                      ],
                    )
                  : Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: const Text("Escolha uma pokébola"),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.pokeball =
                                      PokeballModel("pokeball", 100);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border:
                                          controller.pokeball.name == "pokeball"
                                              ? Border.all(color: Colors.black)
                                              : null),
                                  padding: const EdgeInsets.all(8),
                                  child: Image.asset(
                                    "assets/pokeball.png",
                                    width: 64,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.pokeball =
                                      PokeballModel("greatball", 200);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: controller.pokeball.name ==
                                              "greatball"
                                          ? Border.all(color: Colors.black)
                                          : null),
                                  padding: const EdgeInsets.all(8),
                                  child: Image.asset(
                                    "assets/greatball.png",
                                    width: 64,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.pokeball =
                                      PokeballModel("ultraball", 300);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: controller.pokeball.name ==
                                              "ultraball"
                                          ? Border.all(color: Colors.black)
                                          : null),
                                  padding: const EdgeInsets.all(8),
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
                          margin: const EdgeInsets.only(top: 16),
                          child: ElevatedButton(
                              onPressed: () {
                                controller.goCatch(pokemon);
                              },
                              child: Text(
                                  "Jogar ${controller.pokeball.name} x${(controller.pokeball.rate / 100).toStringAsFixed(0)}")),
                        ),
                        Text(controller.status),
                        controller.ballsBrokes > 0
                            ? Text(
                                "Você já jogou ${controller.ballsBrokes} ${controller.pokeball.name}")
                            : Container()
                      ],
                    ),
            ],
          ),
        )),
      );
    });
  }
}
