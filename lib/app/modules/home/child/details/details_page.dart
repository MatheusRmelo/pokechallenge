import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/modules/home/child/details/details_controller.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';
import 'package:pokemon/utils/texts.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key, required this.pokemon, this.catchPoke = false})
      : super(key: key);

  final PokemonModel pokemon;
  final bool catchPoke;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final controller = Modular.get<DetailsController>();
  @override
  void initState() {
    super.initState();
    controller.fetchObsCatch(widget.pokemon.doc, widget.pokemon.favorite);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PokemonModel? pokemon = widget.pokemon;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        pokemon.name,
                        style: tsHeading2,
                      ),
                      Text(
                        " - N?? ${pokemon.id.toString()}",
                        style: tsHeading2,
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        controller.favoritePokemon(pokemon);
                      },
                      icon: Icon(
                        controller.favorite
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        color: controller.favorite ? Colors.red : Colors.black,
                        size: 32,
                      ))
                ],
              ),
              widget.catchPoke
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 16, bottom: 8),
                          child: const Text("Observa????es"),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          margin: const EdgeInsets.only(bottom: 16),
                          padding: const EdgeInsets.only(left: 8),
                          height: 100,
                          width: size.width,
                          child: TextFormField(
                            controller: controller.textEditingController,
                            onChanged: (text) {
                              controller.obs = text;
                            },
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Observa????es da captura"),
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                          ),
                        ),
                        controller.success
                            ? Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                child: const Text(
                                  "Sucesso ao salvar observa????o!",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : controller.error
                                ? Container(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    child: const Text(
                                      "Erro ao se comunicar com o servidor",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                : Container(),
                        SizedBox(
                          width: size.width,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green),
                              onPressed: () {
                                controller.saveObs(widget.pokemon.doc);
                              },
                              child: const Text("Editar pok??mon")),
                        ),
                        Container(
                          width: size.width,
                          margin: const EdgeInsets.only(top: 16),
                          child: ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.red),
                              onPressed: _confirmAction,
                              child: const Text("Abandonar pok??mon")),
                        )
                      ],
                    )
                  : Container()
            ],
          ),
        )),
      );
    });
  }

  _confirmAction() {
    bool loading = false;

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
          return AlertDialog(
            actions: [
              loading
                  ? Container()
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.grey),
                      child: const Text('Cancelar',
                          style: TextStyle(
                            fontSize: 12,
                          )),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
              loading
                  ? Container(
                      margin: const EdgeInsets.all(16),
                      child: const CircularProgressIndicator(),
                    )
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      child: const Text(
                        'Abandonar',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      onPressed: () async {
                        setModalState(() {
                          loading = true;
                        });
                        var success =
                            await controller.leavePokemon(widget.pokemon.doc);
                        if (success) {
                          Modular.to.navigate("/home");
                        } else {
                          controller.error = true;
                        }
                        setModalState(() {
                          loading = false;
                        });
                      },
                    ),
            ],
            content: Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                'Abandonar o pok??mon ${widget.pokemon.name} ????',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        });
      },
    );
  }
}
