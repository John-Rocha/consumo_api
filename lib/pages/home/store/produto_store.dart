import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:consumo_api/data/http/exceptions.dart';
import 'package:consumo_api/data/models/produto_model.dart';
import 'package:consumo_api/data/repositories/produto_repository.dart';

class ProdutoStore {
  final ProdutoRepository repository;

  ProdutoStore({required this.repository});

  // Variável reativa de loading;
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  // Variável reativa para state;
  final ValueNotifier<List<ProdutoModel>> state = ValueNotifier([]);

  // Variável reativa para erro;
  final ValueNotifier<String> error = ValueNotifier('');

  getProdutos() async {
    isLoading.value = true;

    try {
      final result = await repository.getProdutos();
      state.value = result;
    } on NotFoundException catch (e, s) {
      log('Erro de requisição', stackTrace: s);
      error.value = e.message;
    } catch (e, s) {
      log('Erro de requisição', stackTrace: s);
      error.value = e.toString();
    }
    isLoading.value = false;
  }
}
