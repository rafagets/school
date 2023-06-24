import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shcool/components/body_component.dart';
import 'package:shcool/providers/afazer_provider.dart';

import '../../components/app_bar_component.dart';
import 'abas/afazes_tab.dart';
import 'abas/perfil_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AfazerProvider store;
  late int abaSelecionada;

  final List<BottomNavigationBarItem> _abas = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Perfil'),
  ];

  final List<Widget> _conteudos = [
    const AfazeresTab(),
    const PerfilTab(),
  ];

  void handleTab(int tabIdx) {
    setState(() {
      abaSelecionada = tabIdx;
    });
  }

  @override
  void initState() {
    abaSelecionada = 0;
    store = Provider.of<AfazerProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BodyComponent(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      bar: BottomNavigationBar(
        currentIndex: abaSelecionada,
        items: _abas,
        onTap: handleTab,
      ),
      actionButton: FloatingActionButton(
        onPressed: () {
          store.abrirModalCadastro(context);
        },
        child: const Icon(Icons.add),
      ),
      child: _conteudos.elementAt(abaSelecionada),
    );
  }
}
