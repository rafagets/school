import 'package:flutter/material.dart';
import 'package:shcool/entities/afazer_checklist_enty.dart';

class DetalheItemWidget extends StatelessWidget {
  final AfazerChecklistEntity item;
  final Function(bool? val) onChanged;

  const DetalheItemWidget({
    super.key,
    required this.item,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          title: Text(item.titulo),
          contentPadding: const EdgeInsets.all(0),
          controlAffinity: ListTileControlAffinity.leading,
          value: item.isChecked,
          onChanged: onChanged,
        ),
        const Divider(),
      ],
    );
  }
}
