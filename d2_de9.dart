void main() {
  final controleDePessoas = ControleDePessoas();

  controleDePessoas
    ..cadastrarPessoa(Pessoa('Jose', Mes.abril))
    ..cadastrarPessoa(Pessoa('Arthur', Mes.agosto))
    ..cadastrarPessoa(Pessoa('Joao', Mes.abril))
    ..cadastrarPessoa(Pessoa('Jesse', Mes.dezembro))
    ..cadastrarPessoa(Pessoa('Roberta', Mes.fevereiro))
    ..cadastrarPessoa(Pessoa('Carla', Mes.fevereiro))
    ..cadastrarPessoa(Pessoa('Thania', Mes.agosto))
    ..cadastrarPessoa(Pessoa('Rafaela', Mes.marco))
    ..cadastrarPessoa(Pessoa('Yuri', Mes.junho))
    ..cadastrarPessoa(Pessoa('Jonas', Mes.setembro))
    ..cadastrarPessoa(Pessoa('Elias', Mes.outubro))
    ..cadastrarPessoa(Pessoa('Abel', Mes.maio))
    ..cadastrarPessoa(Pessoa('Danilo', Mes.abril))
    ..cadastrarPessoa(Pessoa('Jonathan', Mes.abril))
    ..cadastrarPessoa(Pessoa('Joseph', Mes.setembro))
    ..cadastrarPessoa(Pessoa('Abdul', Mes.janeiro))
    ..cadastrarPessoa(Pessoa('Jean', Mes.abril));

  for (final entry in controleDePessoas.pessoasPorMes.entries) {
    print('\n${entry.key.name}');

    for (final pessoa in entry.value) {
      print(' > ${pessoa.nome}');
    }
  }
}

enum Mes {
  janeiro,
  fevereiro,
  marco,
  abril,
  maio,
  junho,
  julho,
  agosto,
  setembro,
  outubro,
  novembro,
  dezembro,
}

class Pessoa {
  Pessoa(this.nome, this.mesDeNascimento);

  final String nome;
  final Mes mesDeNascimento;
}

class ControleDePessoas {
  final _pessoas = <Pessoa>[];

  /// Cadastra uma pessoa no sistema
  void cadastrarPessoa(Pessoa pessoa) => _pessoas.add(pessoa);

  /// Retorna um mapa com as pessoas agrupadas por mês de nascimento
  Map<Mes, List<Pessoa>> get pessoasPorMes {
    final pessoasPorMes = <Mes, List<Pessoa>>{};
    for (final pessoa in _pessoas) {
      pessoasPorMes.putIfAbsent(pessoa.mesDeNascimento, () => []).add(pessoa);
    }
    return pessoasPorMes;
  }
}
