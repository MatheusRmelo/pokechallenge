import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pokemon/app/modules/home/home_controller.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';
import 'package:pokemon/app/modules/home/repository/repository.dart';
part 'details_controller.g.dart';

class DetailsController = _DetailsControllerBase with _$DetailsController;

abstract class _DetailsControllerBase with Store {
  final controller = Modular.get<HomeController>();
  final HomeRepository repository;

  _DetailsControllerBase(this.repository);

  @observable
  TextEditingController textEditingController = TextEditingController(text: "");
  @observable
  String obs = "";
  @observable
  bool error = false;
  @observable
  bool success = false;
  @observable
  bool favorite = false;

  @action
  Future<void> fetchObsCatch(String doc, bool fav) async {
    success = false;
    error = false;
    favorite = fav;
    textEditingController.text = await repository.fetchObsCatch(doc);
  }

  @action
  Future<void> saveObs(String doc) async {
    var result = await repository.saveObs(doc, obs);
    success = result;
    error = !result;
  }

  @action
  Future<bool> leavePokemon(String doc) async {
    var result = await repository.leavePokemon(doc);
    if (result) {
      List<PokemonModel> newCatches = [];
      for (var element in controller.fullCatches) {
        if (element.doc != doc) {
          newCatches.add(element);
        }
      }
      controller.catches = newCatches;
      controller.fullCatches = newCatches;
    }
    return result;
  }

  @action
  void favoritePokemon(PokemonModel pokemon) {
    favorite = !pokemon.favorite;
    controller.favoritePokemon(pokemon);
  }
}
