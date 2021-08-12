import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/modules/home/models/pokeball_model.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';
import 'package:pokemon/utils/texts.dart';

class DetailsPokemonWidget extends StatefulWidget {
  const DetailsPokemonWidget({Key? key, PokemonModel? this.pokemon})
      : super(key: key);

  final PokemonModel? pokemon;

  @override
  _DetailsPokemonWidgetState createState() => _DetailsPokemonWidgetState();
}

class _DetailsPokemonWidgetState extends State<DetailsPokemonWidget> {
  PokeballModel pokeball = PokeballModel("pokeball", 100);
  String status = "";
  bool catchPoke = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void goCatch() {
      Random random = new Random();
      int randomNumber = random.nextInt(pokeball.rate);
      setState(() {
        catchPoke = widget.pokemon!.baseExperience <= randomNumber;
        if (widget.pokemon!.baseExperience <= randomNumber) {
          status = "Parabéns! Você capturou o ${widget.pokemon!.name}";
        } else {
          status = "Sua ${pokeball.name} quebrou :(";
        }
      });
    }

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
              child: Image.network(widget.pokemon!.image),
            ),
            Row(
              children: [
                Text(
                  widget.pokemon!.name,
                  style: tsHeading2,
                ),
                Text(
                  " - N° ${widget.pokemon!.id.toString()}",
                  style: tsHeading2,
                )
              ],
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
                              Modular.to.navigate("/home");
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
                                setState(() {
                                  pokeball = PokeballModel("pokeball", 100);
                                });
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
                                setState(() {
                                  pokeball = PokeballModel("greatball", 200);
                                });
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
                                setState(() {
                                  pokeball = PokeballModel("ultraball", 300);
                                });
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
