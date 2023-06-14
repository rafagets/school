import 'package:flutter/material.dart';

import '../../../components/icon_button_component.dart';
import '../../../components/spacer_component.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

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
              const CircleAvatar(child: Text('C')),
              const SpacerComponent(size: 8, isHorizontalSpacer: false),
              const Text('Camila Conte',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              IconButtonComponent(
                icon: Icons.more_vert,
                onPressed: () {},
                color: Colors.black,
                size: 24,
              )
            ]),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Minhas estatísticas',
          style: TextStyle(fontSize: 18),
        ),
        const SpacerComponent(size: 16),
        const Row(children: [
          Icon(Icons.list),
          SizedBox(width: 8),
          Text('Total de notas: '),
          Text('0'),
        ]),
        const Row(children: [
          Icon(Icons.list),
          SizedBox(width: 8),
          Text('Concluídas: '),
          Text('0'),
        ]),
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 16),
        const Text(
          'Minhas estatísticas',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 16),
        Row(children: [
          const Text('Tema escuro'),
          const Spacer(),
          Switch(value: true, onChanged: (val) {}),
        ])
      ]),
    );
  }
}
