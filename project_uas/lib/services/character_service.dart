import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_uas/models/character.dart';

class CharacterService {
  final String baseUrl =
      "https://api.jikan.moe/v4/anime/20/characters";

  Future<List<Character>> getCharacters() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List list = data['data'];

      return list.map((e) => Character.fromJson(e)).toList();
    } else {
      throw Exception("Gagal mengambil data karakter");
    }
  }
}
