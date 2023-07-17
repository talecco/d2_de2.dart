import 'dart:math';

class ItemCompra {
  String nome;
  int quantidade;

  ItemCompra(this.nome, this.quantidade);
}

class ControleDeMercado {
  List<ItemCompra> itensDesejados;
  List<ItemCompra> itensComprados;
  List<ItemCompra> itensSemEstoque;

  ControleDeMercado()
      : itensDesejados = [],
        itensComprados = [],
        itensSemEstoque = [];

  void incluirItemDesejado(ItemCompra item) {
    itensDesejados.add(item);
  }

  void separarItensComprados() {
    itensComprados.clear();
    for (var item in itensDesejados) {
      if (item.quantidade > 0) {
        itensComprados.add(item);
      }
    }
  }

  void separarItensSemEstoque() {
    itensSemEstoque.clear();
    for (var item in itensDesejados) {
      if (item.quantidade == 0) {
        itensSemEstoque.add(item);
      }
    }
  }

  void exibirItensDesejados() {
    for (var item in itensDesejados) {
      print('Item: ${item.nome}, Quantidade: ${item.quantidade}');
    }
  }

  ItemCompra? escolherItemPendenteAleatoriamente() {
    List<ItemCompra> itensPendentes = [];
    for (var item in itensDesejados) {
      if (item.quantidade > 0) {
        itensPendentes.add(item);
      }
    }
    if (itensPendentes.isEmpty) {
      return null;
    }
    var random = Random();
    return itensPendentes[random.nextInt(itensPendentes.length)];
  }

  void mostrarProgresso() {
    int totalItensDesejados = itensDesejados.length;
    int totalItensComprados = itensComprados.length;
    print('Progresso: $totalItensComprados/$totalItensDesejados');
  }
}

void main() {
  ControleDeMercado mercado = ControleDeMercado();

  ItemCompra item1 = ItemCompra('Maçã', 5);
  ItemCompra item2 = ItemCompra('Leite', 2);
  ItemCompra item3 = ItemCompra('Pão', 3);

  mercado.incluirItemDesejado(item1);
  mercado.incluirItemDesejado(item2);
  mercado.incluirItemDesejado(item3);

  // Simular a compra de 2 itens
  item1.quantidade -= 2;
  item2.quantidade -= 2;

  // Simular item sem estoque
  item3.quantidade = 0;

  mercado.separarItensComprados();
  mercado.separarItensSemEstoque();

  print('Itens desejados:');
  mercado.exibirItensDesejados();

  print('Itens comprados:');
  for (var item in mercado.itensComprados) {
    print('Item: ${item.nome}, Quantidade: ${item.quantidade}');
  }

  print('Itens sem estoque:');
  for (var item in mercado.itensSemEstoque) {
    print('Item: ${item.nome}, Quantidade: ${item.quantidade}');
  }

  ItemCompra? itemPendente = mercado.escolherItemPendenteAleatoriamente();
  if (itemPendente != null) {
    print('Item pendente aleatório: ${itemPendente.nome}');
  }

  mercado.mostrarProgresso();
}
