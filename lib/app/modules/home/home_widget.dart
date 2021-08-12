import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/modules/home/home_controller.dart';
import 'package:pokemon/app/modules/home/widgets/poke_card.dart';
import 'package:pokemon/utils/texts.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  HomeController controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
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
          body: Observer(builder: (context) {
            if (controller.pokedex!.value == null) {
              return const CircularProgressIndicator();
            }
            return TabBarView(
              children: [
                _pokedexWidget(),
                const Icon(Icons.directions_transit),
                const Icon(Icons.directions_bike),
              ],
            );
          }),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.red[400],
            child: Icon(Icons.add),
            onPressed: () {
              Modular.to.pushNamed("discovery");
            },
          ),
        ));
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
                    "Nenhum pokémon avistado ainda!",
                    style: tsHeading2,
                    textAlign: TextAlign.center,
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 16),
                  //   child: Image.asset(
                  //     "assets/pokedex.png",
                  //     width: 80,
                  //     height: 80,
                  //   ),
                  // ),
                  Container(
                    width: 64,
                    height: 64,
                    margin: const EdgeInsets.only(top: 24),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.red[400]),
                    child: IconButton(
                        onPressed: () {
                          Modular.to.pushNamed("discovery");
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
                    pokemon: controller.pokedex!.value![index]);
              }),
    );
  }
}
