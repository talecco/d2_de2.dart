import 'dart:math' as math;

void main() {
  final comparador = ComparadorFormasGeometricas();

  final circuloA = Circulo('Circulo A', 3);
  final circuloB = Circulo('Circulo B', 8);
  final retanguloA = Retangulo('Retangulo A', 4, 3);
  final retanguloB = Retangulo('Retangulo B', 19, 11);
  final trianguloEquilateroA = TrianguloEquilatero('Triangulo Equilatero A', 5);
  final trianguloEquilateroB = TrianguloEquilatero('Triangulo Equilatero B', 7);
  final trianguloRetanguloA = TrianguloRetangulo('Triangulo Retangulo A', 3, 4);
  final trianguloRetanguloB =
      TrianguloRetangulo('Triangulo Retangulo B', 5, 12);
  final pentagonoRegularA = PentagonoRegular('Pentagono Regular A', 6);
  final pentagonoRegularB = PentagonoRegular('Pentagono Regular B', 8);
  final hexagonoRegularA = HexagonoRegular('Hexagono Regular A', 5);
  final hexagonoRegularB = HexagonoRegular('Hexagono Regular B', 7);

  final formaMaiorArea = comparador.formaDeMaiorArea([
    circuloA,
    circuloB,
    retanguloA,
    retanguloB,
    trianguloEquilateroA,
    trianguloEquilateroB,
    trianguloRetanguloA,
    trianguloRetanguloB,
    pentagonoRegularA,
    pentagonoRegularB,
    hexagonoRegularA,
    hexagonoRegularB,
  ]);

  final formaMaiorPerimetro = comparador.formaDeMaiorPerimetro([
    circuloA,
    circuloB,
    retanguloA,
    retanguloB,
    trianguloEquilateroA,
    trianguloEquilateroB,
    trianguloRetanguloA,
    trianguloRetanguloB,
    pentagonoRegularA,
    pentagonoRegularB,
    hexagonoRegularA,
    hexagonoRegularB,
  ]);

  print(
    'A forma com a maior área é ${formaMaiorArea.nome} '
    'com área de ${formaMaiorArea.calcularArea().toStringAsFixed(2)}',
  );

  print(
    'A forma com o maior perímetro é ${formaMaiorPerimetro.nome} '
    'com perímetro de ${formaMaiorPerimetro.calcularPerimetro().toStringAsFixed(2)}',
  );
}

abstract class FormaGeometrica {
  String nome;

  FormaGeometrica(this.nome);

  double calcularArea();
  double calcularPerimetro();
}

class Circulo extends FormaGeometrica {
  double raio;

  Circulo(String nome, this.raio) : super(nome);

  @override
  double calcularArea() {
    return math.pi * math.pow(raio, 2);
  }

  @override
  double calcularPerimetro() {
    return 2 * math.pi * raio;
  }
}

class Retangulo extends FormaGeometrica {
  double altura;
  double largura;

  Retangulo(String nome, this.altura, this.largura) : super(nome);

  @override
  double calcularArea() {
    return altura * largura;
  }

  @override
  double calcularPerimetro() {
    return (altura * 2) + (largura * 2);
  }
}

class TrianguloEquilatero extends FormaGeometrica {
  double lado;

  TrianguloEquilatero(String nome, this.lado) : super(nome);

  @override
  double calcularArea() {
    return (math.sqrt(3) / 4) * math.pow(lado, 2);
  }

  @override
  double calcularPerimetro() {
    return 3 * lado;
  }
}

class TrianguloRetangulo extends FormaGeometrica {
  double catetoA;
  double catetoB;

  TrianguloRetangulo(String nome, this.catetoA, this.catetoB) : super(nome);

  @override
  double calcularArea() {
    return (catetoA * catetoB) / 2;
  }

  @override
  double calcularPerimetro() {
    final hipotenusa = math.sqrt(math.pow(catetoA, 2) + math.pow(catetoB, 2));
    return catetoA + catetoB + hipotenusa;
  }
}

class PentagonoRegular extends FormaGeometrica {
  double lado;

  PentagonoRegular(String nome, this.lado) : super(nome);

  @override
  double calcularArea() {
    return (0.25 * math.sqrt(5 * (5 + 2 * math.sqrt(5)))) * math.pow(lado, 2);
  }

  @override
  double calcularPerimetro() {
    return 5 * lado;
  }
}

class HexagonoRegular extends FormaGeometrica {
  double lado;

  HexagonoRegular(String nome, this.lado) : super(nome);

  @override
  double calcularArea() {
    return (3 * math.sqrt(3) * math.pow(lado, 2)) / 2;
  }

  @override
  double calcularPerimetro() {
    return 6 * lado;
  }
}

class ComparadorFormasGeometricas {
  FormaGeometrica formaDeMaiorArea(List<FormaGeometrica> formas) {
    FormaGeometrica maiorForma = formas[0];

    for (int i = 1; i < formas.length; i++) {
      if (formas[i].calcularArea() > maiorForma.calcularArea()) {
        maiorForma = formas[i];
      }
    }

    return maiorForma;
  }

  FormaGeometrica formaDeMaiorPerimetro(List<FormaGeometrica> formas) {
    FormaGeometrica maiorForma = formas[0];

    for (int i = 1; i < formas.length; i++) {
      if (formas[i].calcularPerimetro() > maiorForma.calcularPerimetro()) {
        maiorForma = formas[i];
      }
    }

    return maiorForma;
  }
}
