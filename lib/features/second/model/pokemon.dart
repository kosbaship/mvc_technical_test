
import 'package:ossos_technical_test/common/network/route.dart';

class Pokemon {
  final String? name;
  final String? url;

  Pokemon({this.name, this.url});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      url: json['url'],
    );
  }

  String? get getImage =>
      "${OSURl.baseUrlImage}${url?.split('/').elementAt(6).replaceAll("/", "")}.png";
}
