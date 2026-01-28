import 'package:flutter/material.dart';
import 'package:project_uas/models/character.dart';
import 'package:project_uas/pages/character_detail_page.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(character.image),
        ),
        title: Text(character.name),
        subtitle: Text("${character.role} • ${character.anime}"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  CharacterDetailPage(character: character),
            ),
          );
        },
      ),
    );
  }
}
