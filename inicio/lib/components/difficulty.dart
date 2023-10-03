import 'package:flutter/material.dart';

class difficulty extends StatelessWidget {
  final int deficultyLevel;

  const difficulty({
    required this.deficultyLevel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 15,
          //condição para cor da estrelha, (operação)[?]pergunta( resposta)[:]se nao (resposta)
          color: (deficultyLevel >= 1) ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (deficultyLevel >= 2) ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (deficultyLevel >= 3) ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (deficultyLevel >= 4) ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (deficultyLevel >= 5) ? Colors.blue : Colors.blue[100],
        ),
      ],
    );
  }
}
