import 'package:flutter/material.dart';
import 'package:pokemon/app/modules/home/models/pokeball_model.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';
import 'package:pokemon/utils/texts.dart';

class CatchView extends StatelessWidget {
  const CatchView(
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
            catchPoke
                ? Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 32, bottom: 16),
                        child: Image.asset(
                          "assets/${pokeball!.name}_catch.png",
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
                            setObs!(text);
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
                              saveObs!();
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
                                setPokeball!("pokeball", 100);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: pokeball!.name == "pokeball"
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
                                setPokeball!("greatball", 200);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: pokeball!.name == "greatball"
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
                                setPokeball!("ultraball", 300);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: pokeball!.name == "ultraball"
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
                              goCatch!();
                            },
                            child: Text(
                                "Jogar ${pokeball!.name} x${(pokeball!.rate / 100).toStringAsFixed(0)}")),
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
