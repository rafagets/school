import 'package:flutter/material.dart';

import '../../../components/icon_button_component.dart';
import '../../../components/spacer_component.dart';

class PerfilTab extends StatelessWidget {
  const PerfilTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Card(
          margin: const EdgeInsets.all(0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(children: [
              const CircleAvatar(child: Text('R')),
              const SpacerComponent(size: 8, isHorizontal: true),
              const Text('Rafael Silva', style: TextStyle(fontWeight: FontWeight.bold)),
              const SpacerComponent(isFull: true),
              IconButtonComponent(
                icon: Icons.more_vert,
                onPressed: () {},
              ),
            ]),
          ),
        ),
        const SpacerComponent(),
        const Text(
          'Minhas estatísticas',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 16),
        const Row(children: [
          Icon(Icons.list),
          SizedBox(width: 8),
          Text('Total de notas: '),
          Text('0'),
        ]),
        const SpacerComponent(),
        const Row(children: [
          Icon(Icons.list),
          SizedBox(width: 8),
          Text('Concluídas: '),
          Text('0'),
        ]),
        const SpacerComponent(),
        const SpacerComponent(isHorizontal: true, isFull: true),
        const SpacerComponent(),
        const Text(
          'Minhas estatísticas',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 16),
        Row(children: [
          const Text('Tema escuro'),
          const SpacerComponent(isFull: true),
          Switch(value: true, onChanged: (val) {}),
        ])
      ]),
    );
  }
}
