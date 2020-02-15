
class Move{
  String name;
  String url;

  Move({this.name, this.url});
 factory Move.fromJson(Map<String,dynamic> json){
    return Move(
      name: json['name'],
      url: json['url']
    );
  }
}