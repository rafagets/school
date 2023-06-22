import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shcool/components/spacer_component.dart';
import 'package:shcool/entities/afazer_entity.dart';
import 'package:shcool/pages/home/components/item_widget.dart';
import 'package:shcool/pages/home/components/novo_item_widget.dart';
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

  void handleAdicionar() {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          contentPadding: const EdgeInsets.all(16),
          children: [
            NovoItemWidget(callback: (item) {
              store.listaAfazeres = [...store.listaAfazeres, item];
            }),
          ],
        );
      },
    );
  }

  void handleExcluir(int index) {
    // _listaAfazeres.removeAt(index);
    // setState(() {
    //   _listaAfazeres = _listaAfazeres;
    // });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<AfazerProvider>(context);

    return Column(
      children: [
        ElevatedButton(
          onPressed: handleAdicionar,
          child: const Text('Adicionar'),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 400,
          child: ListView.builder(
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
                    handleAdicionar();
                  },
                ),
              );
            },
          ),
        ),
        const SpacerComponent(),
      ],
    );
  }
}
