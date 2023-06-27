import 'package:flutter/material.dart';
import 'package:shcool/components/icon_button_component.dart';
import 'package:shcool/entities/afazer_entity.dart';
import 'package:shcool/services/picker_service.dart';

class DetalheHeaderWidget extends StatelessWidget {
  final AfazerEntity item;
  final Function() onEdit;

  const DetalheHeaderWidget({
    super.key,
    required this.item,
    required this.onEdit,
  });

  Widget makeImage() {
    if (item.image != null) {
      return Image.memory(
        PickerService().decodeBase64(item.image!),
        fit: BoxFit.cover,
      );
    }
    return const Icon(Icons.image_search, size: 100);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 300,
          color: Colors.amber[100],
          child: makeImage(),
        ),
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: Container(
            width: double.infinity,
            color: const Color.fromARGB(219, 255, 193, 7),
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              item.titulo,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 18,
          right: 18,
          child: IconButtonComponent(
            icon: Icons.edit,
            size: 24,
            onPressed: onEdit,
          ),
        )
      ],
    );
  }
}
