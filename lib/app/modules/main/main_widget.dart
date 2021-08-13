import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/modules/home/home_view.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';
import 'package:pokemon/app/modules/home/repository/firestore_repository.dart';
import 'package:pokemon/app/modules/home/widgets/poke_card.dart';
import 'package:pokemon/app/modules/main/main_controller.dart';
import 'package:pokemon/utils/texts.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  MainController controller = Modular.get<MainController>();

  void addPokemon() {
    Modular.to.pushNamed("discovery");
  }

  void logout() {
    FirebaseAuth.instance.signOut().then((value) {
      Modular.to.navigate("/auth");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      logout();
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
            body: controller.pokedex!.value == null
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
            floatingActionButton: controller.pokedex!.value != null &&
                    controller.pokedex!.value!.isNotEmpty
                ? FloatingActionButton(
                    backgroundColor: Colors.red[400],
                    child: Icon(Icons.add),
                    onPressed: () {
                      addPokemon();
                    },
                  )
                : Container(),
          ));
    });
  }

  Widget _pokedexWidget() {
    return Container(
      padding: EdgeInsets.all(16),
      child: controller.pokedex!.value!.isEmpty
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
                        onPressed: () {
                          addPokemon();
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
              itemCount: controller.pokedex!.value!.length,
              itemBuilder: (context, index) {
                Size size = MediaQuery.of(context).size;

                return pokeCard(
                    fullWidth: size.width,
                    fullHeight: size.height,
                    index: index,
                    pokemon: controller.pokedex!.value![index],
                    setFavorite: (value) {
                      controller.favoritePokemon(value);
                    });
              }),
    );
  }

  Widget _pokemonWidget() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: controller.pokemons!.value!.isEmpty
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
                        onPressed: () {
                          addPokemon();
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
              itemCount: controller.pokemons!.value!.length,
              itemBuilder: (context, index) {
                Size size = MediaQuery.of(context).size;

                return pokeCard(
                    fullWidth: size.width,
                    fullHeight: size.height,
                    index: index,
                    pokemon: controller.pokemons!.value![index],
                    setFavorite: (value) {
                      controller.favoritePokemon(value);
                    });
              }),
    );
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
          : ListView.builder(
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
    );
  }
}
