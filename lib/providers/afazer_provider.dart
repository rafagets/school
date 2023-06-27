import 'package:flutter/material.dart';
import 'package:shcool/services/afazer_service.dart';

import '../entities/afazer_entity.dart';
import '../pages/home/components/novo_item_widget.dart';

class AfazerProvider with ChangeNotifier {
  final service = AfazerService();
  List<AfazerEntity> _listaAfazeres = [];
  AfazerEntity? _selecionado;
  int? _idx;

  AfazerProvider() {
    buscarAfazeres();
  }

  buscarAfazeres() async {
    listaAfazeres = await service.buscar();
  }

  List<AfazerEntity> get listaAfazeres => _listaAfazeres;

  AfazerEntity? get selecionado {
    return _selecionado;
  }

  set selecionado(AfazerEntity? val) {
    _selecionado = val;
    notifyListeners();
  }

  set idx(int val) {
    _idx = val;
    notifyListeners();
  }

  void atualizarItemAfazer(int idx) {
    if (selecionado != null) {
      _listaAfazeres[idx] = _selecionado!;
      notifyListeners();
    }
  }

  set listaAfazeres(List<AfazerEntity> val) {
    _listaAfazeres = val;
    service.salvar(_listaAfazeres);
    notifyListeners();
  }

  void removerItemAfazer(int index) {
    listaAfazeres.removeAt(index);
    service.salvar(listaAfazeres);
    notifyListeners();
  }

  void abrirModalCadastro(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          contentPadding: const EdgeInsets.all(16),
          children: [
            NovoItemWidget(callback: (item) {
              listaAfazeres = [item, ...listaAfazeres];
            }),
          ],
        );
      },
    );
  }
}
