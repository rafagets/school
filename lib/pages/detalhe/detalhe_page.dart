import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shcool/components/body_component.dart';
import 'package:shcool/components/spacer_component.dart';
import 'package:shcool/pages/detalhe/components/detalhe_header_widget.dart';
import 'package:shcool/pages/detalhe/components/detalhe_menu_widget.dart';
import 'package:shcool/providers/afazer_provider.dart';
import 'package:shcool/services/picker_service.dart';

import 'components/detalhe_item_widget.dart';

class DetalhePage extends StatefulWidget {
  const DetalhePage({super.key});

  @override
  State<DetalhePage> createState() => _DetalhePageState();
}

class _DetalhePageState extends State<DetalhePage> {
  late AfazerProvider store;
  int? idx;

  void onEditImage() async {
    final pickerService = PickerService();
    final image = await pickerService.getImage(ImageSource.gallery);
    if (image != null) {
      final base64 = pickerService.base64(await image.readAsBytes());
      store.selecionado!.image = base64;
      store.atualizarItemAfazer(idx!);
    }
  }

  void onDone() {
    store.selecionado!.isConcluido = true;
    store.atualizarItemAfazer(idx!);
  }

  void onDelete() {
    store.removerItemAfazer(idx!);
    Navigator.pop(context);
  }

  void itemOnChange(int index, bool val) {
    store.selecionado!.conteudos[index].isChecked = val;
    store.atualizarItemAfazer(idx!);
  }

  List<Widget> lista() {
    return store.selecionado!.conteudos.asMap().entries.map((elemento) {
      return DetalheItemWidget(
        item: elemento.value,
        onChanged: (val) {
          itemOnChange(elemento.key, val ?? false);
        },
      );
    }).toList();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arg = ModalRoute.of(context)?.settings.arguments;
    if (arg != null) {
      idx = arg as int;
    }
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<AfazerProvider>(context);

    if (store.selecionado == null) {
      Navigator.of(context).pop();
      return const Text('Selecione um item da lista.');
    }

    return BodyComponent(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(0),
        child: Column(children: [
          DetalheHeaderWidget(
            item: store.selecionado!,
            onEdit: onEditImage,
          ),
          const SpacerComponent(),
          DetalheMenuWidget(
            item: store.selecionado!,
            onDone: onDone,
            onDelete: onDelete,
          ),
          const SpacerComponent(),
          ...lista(),
        ]),
      ),
    );
  }
}
