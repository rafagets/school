import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shcool/components/body_component.dart';
import 'package:shcool/pages/detalhe/components/detalhe_header.dart';
import 'package:shcool/providers/afazer_provider.dart';
import 'package:shcool/services/picker_service.dart';

import '../../components/app_bar_component.dart';

class DetalhePage extends StatefulWidget {
  const DetalhePage({super.key});

  @override
  State<DetalhePage> createState() => _DetalhePageState();
}

class _DetalhePageState extends State<DetalhePage> {
  late AfazerProvider store;

  void onEditImage() async {
    final pickerService = PickerService();
    final image = await pickerService.getImage(ImageSource.gallery);
    if (image != null) {
      final base64 = pickerService.base64(await image.readAsBytes());
      store.atualizarItemAfazer(0, base64);
    }
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<AfazerProvider>(context);
    return BodyComponent(
      child: Column(children: [
        DetalheHeaderWidget(
          item: store.listaAfazeres.elementAt(0),
          onEdit: onEditImage,
        ),
      ]),
    );
  }
}
