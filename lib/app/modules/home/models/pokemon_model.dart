class PokemonModel {
  late int _id;
  late String doc;
  late String _name;
  late String _image;
  late int _baseExperience;
  late bool favorite;

  PokemonModel.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    doc = parsedJson['doc'];
    _name = parsedJson['name'];
    _image = parsedJson['image'];
    _baseExperience = parsedJson['baseExperience'];
    favorite = parsedJson['favorite'];
  }

  get id => _id;

  String get name => _name;
  get image => _image;
  get baseExperience => _baseExperience;
}
