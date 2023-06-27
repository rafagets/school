import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shcool/app_routes.dart';
import 'package:shcool/entities/afazer_entity.dart';
import 'package:shcool/pages/home/components/item_widget.dart';
import 'package:shcool/providers/afazer_provider.dart';

class AfazeresTab extends StatefulWidget {
  const AfazeresTab({
    super.key,
  });

  @override
  State createState() => _AfazeresTab();
}

class _AfazeresTab extends State<AfazeresTab> {
  late AfazerProvider store;

  void handleExcluir(int index) {
    store.removerItemAfazer(index);
  }

  void onDetalhes(AfazerEntity item, int idx) {
    store.selecionado = item;
    Navigator.pushNamed(context, AppRoutes.detalhe, arguments: idx);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<AfazerProvider>(context);

    return ListView.builder(
      itemCount: store.listaAfazeres.length,
      itemBuilder: (context, index) {
        final item = store.listaAfazeres.elementAt(index);
        return Dismissible(
          key: Key(item.uuid),
          onDismissed: (direction) {
            if (direction == DismissDirection.startToEnd) {
              handleExcluir(index);
            }
          },
          child: ItemWidget(
            item: item,
            onPressed: () {
              onDetalhes(item, index);
            },
          ),
        );
      },
    );
  }
}
