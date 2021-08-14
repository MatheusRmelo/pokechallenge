class PokemonModel {
  int id;
  final String doc;
  final String name;
  final String image;
  final int baseExperience;
  bool favorite;
  PokemonModel(this.id, this.doc, this.name, this.image, this.baseExperience,
      this.favorite);
}
