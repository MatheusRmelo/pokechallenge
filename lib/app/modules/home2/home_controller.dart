import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pokemon/app/modules/home2/models/pokemon_model.dart';
import 'package:pokemon/app/modules/home2/repository/repository.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeRepository repository;

  _HomeControllerBase(this.repository);
  @observable
  List<PokemonModel> _pokedex = [];
  @observable
  List<PokemonModel> _catches = [];
  @observable
  List<PokemonModel> _favorites = [];
  @observable
  bool _loading = true;
  @action
  Future<bool> getPokemons() async {
    loading = true;
    List<PokemonModel> newPokedex = await repository.fetchMyPokedex();
    List<PokemonModel> newCatches = await repository.fetchMyCatches();
    List<PokemonModel> newFavorites = [];
    newPokedex.forEach((element) {
      if (element.favorite) {
        newFavorites.add(element);
      }
    });
    pokedex = newPokedex;
    catches = newCatches;
    favorites = newFavorites;
    loading = false;
    return true;
  }

  void addPokemon() {
    Modular.to.pushNamed("discovery");
  }

  void logout() {
    FirebaseAuth.instance.signOut().then((value) {
      Modular.to.navigate("/auth");
    });
  }

  void set loading(value) => _loading = value;
  get loading => _loading;

  void set pokedex(value) => _pokedex = value;
  get pokedex => _pokedex;

  void set catches(value) => _catches = value;
  get catches => _catches;

  void set favorites(value) => _favorites = value;
  get favorites => _favorites;
}
