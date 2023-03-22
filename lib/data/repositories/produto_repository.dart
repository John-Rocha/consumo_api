import 'package:consumo_api/data/models/produto_model.dart';

abstract class IProdutoRepository {
  Future<List<ProdutoModel>> getProdutos();
}

class ProdutoRepository implements IProdutoRepository {
  @override
  Future<List<ProdutoModel>> getProdutos() async {
    return [];
  }
}
