import 'package:flutter/material.dart';
import 'package:shcool/components/spacer_component.dart';

class AfazeresTab extends StatefulWidget {
  final int valorIniciaL;
  final void Function(int tabIndx)? callback;

  const AfazeresTab({
    super.key,
    required this.valorIniciaL,
    this.callback,
  });

  @override
  State createState() => _AfazeresTab();
}

class _AfazeresTab extends State<AfazeresTab> {
  late int acumulador;

  void somarMaiUm() {
    setState(() {
      acumulador++;
    });
  }

  void handleCallback() {
    if (widget.callback != null) {
      widget.callback!(1);
    }
  }

  @override
  void initState() {
    acumulador = widget.valorIniciaL;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$acumulador'),
        const SpacerComponent(),
        ElevatedButton(
          onPressed: somarMaiUm,
          child: const Text('+1'),
        ),
        const SpacerComponent(),
        ElevatedButton(
          onPressed: handleCallback,
          child: const Text('callback'),
        ),
      ],
    );
  }
}
