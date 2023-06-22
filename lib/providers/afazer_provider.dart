import 'package:flutter/material.dart';
import 'package:shcool/services/afazer_service.dart';

import '../entities/afazer_entity.dart';

class AfazerProvider with ChangeNotifier {
  final service = AfazerService();
  List<AfazerEntity> _listaAfazeres = [];

  AfazerProvider() {
    buscarAfazeres();
  }

  buscarAfazeres() async {
    listaAfazeres = await service.buscar();
  }

  List<AfazerEntity> get listaAfazeres => _listaAfazeres;

  set listaAfazeres(List<AfazerEntity> val) {
    _listaAfazeres = val;
    notifyListeners();
  }
}
