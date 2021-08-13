import 'package:flutter/material.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';
import 'package:pokemon/app/modules/home/widgets/poke_card.dart';
import 'package:pokemon/utils/texts.dart';

class DiscoveryView extends StatelessWidget {
  const DiscoveryView(
      {Key? key,
      this.goBack,
      this.setSearch,
      this.pokemons,
      this.loading = false})
      : super(key: key);

  final Function? goBack;
  final Function? setSearch;
  final List<PokemonModel>? pokemons;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            goBack!();
          },
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Pesquise um pokémon",
              style: tsHeading2,
            ),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset.fromDirection(1, 1),
                    spreadRadius: 0),
              ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
              margin: EdgeInsets.all(16),
              child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: 'Pesquise pelo nome ou número',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      suffixIcon: Icon(
                        Icons.search,
                        size: 32,
                      )),
                  onChanged: (text) {
                    setSearch!(text);
                  }),
            ),
            pokemons == null
                ? Container(
                    child: Text("Pesquise o pokémon encontrado"),
                  )
                : pokemons!.length == 0
                    ? Container(
                        child: Text("Pokémon não encontrado"),
                      )
                    : loading
                        ? Container(
                            margin: EdgeInsets.only(top: 64),
                            child: CircularProgressIndicator(),
                          )
                        : Expanded(
                            child: Container(
                            padding: const EdgeInsets.all(16),
                            child: ListView.builder(
                              itemCount: pokemons!.length,
                              itemBuilder: (context, index) {
                                PokemonModel pokemon = pokemons![index];
                                return pokeCard(
                                    nextRouter: "catch",
                                    index: index,
                                    pokemon: pokemon,
                                    fullHeight: size.height,
                                    fullWidth: size.width);
                              },
                            ),
                          ))
          ],
        ),
      ),
    );
  }
}
