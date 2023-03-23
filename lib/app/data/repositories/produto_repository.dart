import 'dart:convert';

import 'package:http/http.dart';

import '../http/exceptions.dart';
import '../http/http_client.dart';
import '../models/produto_model.dart';

abstract class IProdutoRepository {
  Future<List<ProdutoModel>> getProdutos();
}

class ProdutoRepository implements IProdutoRepository {
  final HttpClient client;

  ProdutoRepository({required this.client});

  @override
  Future<List<ProdutoModel>> getProdutos() async {
    final Response response = await client.get(
      url: 'https://dummyjson.com/products',
    );

    if (response.statusCode == 200) {
      final List<ProdutoModel> produtos = [];
      final Map<String, dynamic> body = jsonDecode(response.body);

      body['products'].map((item) {
        final produto = ProdutoModel.fromMap(item);
        produtos.add(produto);
      }).toList();

      return produtos;
    } else if (response.statusCode == 404) {
      throw NotFoundException('URL não encontrada');
    } else {
      throw Exception('Não foi possível carregar os produtos');
    }
  }
}
