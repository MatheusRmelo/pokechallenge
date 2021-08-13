import 'package:flutter/material.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';
import 'package:pokemon/app/modules/home/widgets/poke_card.dart';
import 'package:pokemon/utils/texts.dart';

class HomeView extends StatelessWidget {
  const HomeView(
      {Key? key,
      this.logout,
      this.addPokemon,
      this.loading = true,
      this.pokedex,
      this.pokemons,
      this.favorites,
      this.setFavorite})
      : super(key: key);

  final Function? logout;
  final Function? addPokemon;
  final Function? setFavorite;

  final bool loading;
  final List<PokemonModel>? pokedex;
  final List<PokemonModel>? pokemons;
  final List<PokemonModel>? favorites;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    logout!();
                  },
                  icon: Icon(Icons.logout))
            ],
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Image.asset(
                    "assets/pokedex.png",
                    width: 32,
                    height: 32,
                  ),
                  text: "Pokédex",
                ),
                Tab(
                  icon: Image.asset(
                    "assets/gocatch.png",
                    width: 32,
                    height: 32,
                  ),
                  text: "Capturados",
                ),
                Tab(
                  icon: Image.asset(
                    "assets/heart.png",
                    width: 32,
                    height: 32,
                  ),
                  text: "Favoritos",
                )
              ],
            ),
          ),
          body: loading
              ? const CircularProgressIndicator()
              : TabBarView(
                  children: [
                    _pokedexWidget(),
                    _pokemonWidget(),
                    _favoriteWidget(),
                  ],
                ),
          floatingActionButton: pokedex!.isNotEmpty
              ? FloatingActionButton(
                  backgroundColor: Colors.red[400],
                  child: Icon(Icons.add),
                  onPressed: () {
                    addPokemon!();
                  },
                )
              : Container(),
        ));
  }

  Widget _pokedexWidget() {
    return Container(
      padding: EdgeInsets.all(16),
      child: pokedex!.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Nenhum pokémon avistado ainda!",
                    style: tsHeading2,
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    width: 64,
                    height: 64,
                    margin: const EdgeInsets.only(top: 24),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.red[400]),
                    child: IconButton(
                        onPressed: () {
                          addPokemon!();
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 32,
                        )),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemCount: pokedex!.length,
              itemBuilder: (context, index) {
                Size size = MediaQuery.of(context).size;

                return pokeCard(
                    fullWidth: size.width,
                    fullHeight: size.height,
                    index: index,
                    pokemon: pokedex![index],
                    setFavorite: (value) {
                      setFavorite!(value);
                    });
              }),
    );
  }

  Widget _pokemonWidget() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: pokemons!.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Nenhum pokémon avistado ainda!",
                    style: tsHeading2,
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    width: 64,
                    height: 64,
                    margin: const EdgeInsets.only(top: 24),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.red[400]),
                    child: IconButton(
                        onPressed: () {
                          addPokemon!();
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 32,
                        )),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemCount: pokemons!.length,
              itemBuilder: (context, index) {
                Size size = MediaQuery.of(context).size;

                return pokeCard(
                    fullWidth: size.width,
                    fullHeight: size.height,
                    index: index,
                    pokemon: pokemons![index],
                    setFavorite: (value) {
                      setFavorite!(value);
                    });
              }),
    );
  }

  Widget _favoriteWidget() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: favorites!.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Nenhum pokémon favoritado ainda!",
                    style: tsHeading2,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: favorites!.length,
              itemBuilder: (context, index) {
                Size size = MediaQuery.of(context).size;

                return pokeCard(
                    fullWidth: size.width,
                    fullHeight: size.height,
                    index: index,
                    pokemon: favorites![index],
                    setFavorite: (value) {
                      setFavorite!(value);
                    });
              }),
    );
  }
}
