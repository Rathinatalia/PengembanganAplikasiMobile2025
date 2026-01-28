import 'package:flutter/material.dart';
import 'package:project_uas/models/character.dart';
import 'package:project_uas/services/character_service.dart';
import 'package:project_uas/widgets/character_card.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  final CharacterService service = CharacterService();

  bool isLoading = true;
  String errorMessage = "";
  List<Character> characters = [];

  Future<void> loadCharacters() async {
    try {
      characters = await service.getCharacters();
    } catch (e) {
      errorMessage = "Gagal memuat data karakter";
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadCharacters();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (errorMessage.isNotEmpty) {
      return Scaffold(
        body: Center(child: Text(errorMessage)),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Naruto Characters")),
      body: ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return CharacterCard(character: characters[index]);
        },
      ),
    );
  }
}
