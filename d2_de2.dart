import 'dart:math';

void main() {
  final pessoa = Pessoa();

  // Fornecedores disponíveis
  final fornecedores = [
    FornecedorDeBebidas(),
    FornecedorDeSanduba(),
    FornecedorBolos(),
    FornecedorSaladas(),
    FornecedorPetiscos(),
    FornecedorUltraCaloricos(),
  ];

  // Consumindo produtos fornecidos
  for (var i = 0; i < 5; i++) {
    final fornecedorAleatorio = FornecedorAleatorio(fornecedores);
    pessoa.refeicao(fornecedorAleatorio);
  }
  pessoa.somarCaloriasConsumidas();
  pessoa.informacoes();
}

class Produto {
  Produto(this.nome, this.calorias);

  /// Nome deste produto
  final String nome;

  /// Total de calorias
  final int calorias;
}

class FornecedorDeBebidas {
  final _random = Random();
  final _bebidasDisponiveis = <Produto>[
    Produto('Agua', 0),
    Produto('Refrigerante', 200),
    Produto('Suco de fruta', 100),
    Produto('Energetico', 135),
    Produto('Cafe', 60),
    Produto('Cha', 35),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _bebidasDisponiveis[_random.nextInt(_bebidasDisponiveis.length)];
  }
}

class FornecedorDeSanduba {
  final _random = Random();
  final _sandubasDisponiveis = <Produto>[
    Produto('salada', 100),
    Produto('carne', 120),
    Produto('frango', 155),
    Produto('peixe', 80),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _sandubasDisponiveis[_random.nextInt(_sandubasDisponiveis.length)];
  }
}

class FornecedorBolos {
  final _random = Random();
  final _bolosDisponiveis = <Produto>[
    Produto('Chocolate', 2200),
    Produto('Morango', 1500),
    Produto('Chocolate Branco', 1835),
    Produto('Nozes', 1540),
    Produto('Trufado', 2535),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _bolosDisponiveis[_random.nextInt(_bolosDisponiveis.length)];
  }
}

class FornecedorSaladas {
  final _random = Random();
  final _saladasDisponiveis = <Produto>[
    Produto('pepino', 30),
    Produto('alface', 10),
    Produto('brocolis', 15),
    Produto('tomate', 20),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _saladasDisponiveis[_random.nextInt(_saladasDisponiveis.length)];
  }
}

class FornecedorPetiscos {
  final _random = Random();
  final _petiscosDisponiveis = <Produto>[
    Produto('ovo', 20),
    Produto('batatinha', 30),
    Produto('camarao', 25),
    Produto('pepino', 10),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _petiscosDisponiveis[_random.nextInt(_petiscosDisponiveis.length)];
  }
}

class FornecedorUltraCaloricos {
  final _random = Random();
  final _ultaCalDisponiveis = <Produto>[
    Produto('Coxinha', 3500),
    Produto('Barra de Chocolate', 8900),
    Produto('Pao com Bolinho', 7600),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _ultaCalDisponiveis[_random.nextInt(_ultaCalDisponiveis.length)];
  }
}

class FornecedorAleatorio {
  final _random = Random();
  final List<Produto> _produtosDisponiveis;

  FornecedorAleatorio(this._produtosDisponiveis);

  /// Retorna um produto aleatório dentre os disponíveis
  Produto fornecer() {
    return _produtosDisponiveis[_random.nextInt(_produtosDisponiveis.length)];
  }
}

class Pessoa {
  int _caloriasConsumidas = 0;

  void informacoes() {
    print('Calorias consumidas: $_caloriasConsumidas');
  }

  void refeicao(FornecedorAleatorio fornecedor) {
    final produto = fornecedor.fornecer();
    print('Consumindo ${produto.nome} (${produto.calorias} calorias)');

    _caloriasConsumidas += produto.calorias;
  }

  void somarCaloriasConsumidas() {}
}
