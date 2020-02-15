class Pokemon {
 String url;

 Pokemon({this.url});
 factory Pokemon.fromJson(Map<String,dynamic> json){
   return Pokemon(url: json['url']);
 }

}
class PokemonUrl{
  int id;
  String name;

  PokemonUrl({this.id, this.name});

  factory PokemonUrl.fromJson(Map<String, dynamic> json) {
    return PokemonUrl(id: json['id'], name: json['name']);
  }
}