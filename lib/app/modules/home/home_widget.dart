import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/modules/home/widgets/input_search.dart';
import 'package:pokemon/app/modules/home/widgets/pokemon_card.dart';
import 'package:pokemon/app/modules/home/home_controller.dart';
import 'package:pokemon/utils/texts.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final controller = Modular.get<HomeController>();

  void initState() {
    super.initState();
    controller.getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Observer(builder: (context) {
      return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: controller.logout, icon: Icon(Icons.logout))
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
            body: controller.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : TabBarView(
                    children: [
                      _pokedexWidget(),
                      _pokemonWidget(),
                      _favoriteWidget(),
                    ],
                  ),
            floatingActionButton:
                controller.pokedex != null && controller.pokedex.isNotEmpty
                    ? FloatingActionButton(
                        backgroundColor: Colors.red[400],
                        child: Icon(Icons.add),
                        onPressed: controller.addPokemon,
                      )
                    : Container(),
          ));
    });
  }

  Widget _pokedexWidget() {
    return Container(
        padding: EdgeInsets.all(16),
        child: controller.pokedex.isEmpty && controller.fullPokedex.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Nenhum pokémon avistado ainda",
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
                          onPressed: controller.addPokemon,
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 32,
                          )),
                    )
                  ],
                ),
              )
            : Column(
                children: [
                  inputSearch(controller.searchPokedex),
                  controller.pokedex.length == 0
                      ? Container(
                          margin: EdgeInsets.only(top: 32),
                          child: Text(
                            "Pesquisa resultou em 0 resultados",
                            style: tsHeading2,
                            textAlign: TextAlign.center,
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                              itemCount: controller.pokedex.length,
                              itemBuilder: (context, index) {
                                Size size = MediaQuery.of(context).size;
                                return pokeCard(
                                    fullWidth: size.width,
                                    fullHeight: size.height,
                                    index: index,
                                    pokemon: controller.pokedex[index],
                                    setFavorite: (value) {
                                      controller.favoritePokemon(value);
                                    });
                              }),
                        )
                ],
              ));
  }

  Widget _pokemonWidget() {
    return Container(
        padding: const EdgeInsets.all(16),
        child: controller.catches.isEmpty && controller.fullCatches.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Nenhum pokémon avistado ainda",
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
                          onPressed: controller.addPokemon,
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 32,
                          )),
                    )
                  ],
                ),
              )
            : Column(
                children: [
                  inputSearch(controller.searchCatches),
                  Expanded(
                    child: ListView.builder(
                        itemCount: controller.catches.length,
                        itemBuilder: (context, index) {
                          Size size = MediaQuery.of(context).size;

                          return pokeCard(
                              fullWidth: size.width,
                              fullHeight: size.height,
                              index: index,
                              pokemon: controller.catches[index],
                              catchPoke: true,
                              setFavorite: (value) {
                                controller.favoritePokemon(value);
                              });
                        }),
                  )
                ],
              ));
  }

  Widget _favoriteWidget() {
    return Container(
        padding: const EdgeInsets.all(16),
        child: controller.favorites.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Nenhum pokémon favoritado ainda",
                      style: tsHeading2,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  inputSearch(controller.searchFavorites),
                  Expanded(
                    child: ListView.builder(
                        itemCount: controller.favorites.length,
                        itemBuilder: (context, index) {
                          Size size = MediaQuery.of(context).size;

                          return pokeCard(
                              fullWidth: size.width,
                              fullHeight: size.height,
                              index: index,
                              pokemon: controller.favorites[index],
                              setFavorite: (value) {
                                controller.favoritePokemon(value);
                              });
                        }),
                  )
                ],
              ));
  }
}
