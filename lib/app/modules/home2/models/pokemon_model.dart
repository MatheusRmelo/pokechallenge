class PokemonModel {
  late int _id;
  late String _doc;
  late String _name;
  late String _image;
  late int _baseExperience;
  late bool _favorite;

  PokemonModel.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    _doc = parsedJson['doc'];
    _name = parsedJson['name'];
    _image = parsedJson['image'];
    _baseExperience = parsedJson['baseExperience'];
    _favorite = parsedJson['favorite'];
  }

  get id => _id;
  get doc => _doc;

  get name => _name;
  get image => _image;
  get baseExperience => _baseExperience;
  get favorite => _favorite;
}
