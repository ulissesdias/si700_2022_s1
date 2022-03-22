abstract class Pessoa {
  String _nome = "";
  String _sobrenome = "";

  // Getter
  String get nomeCompleto {
    return "$_nome $_sobrenome";
  }

  String get nome {
    return _nome;
  }

  String get sobrenome {
    return _sobrenome;
  }

  displayInfo(); // Método Abstrato

  displayName() {
    return "Nome: $_nome";
  }
}

class Professor extends Pessoa {
  // Atributos
  String _vinculo = "";
  String _nivel = "";

  Professor(n, sn, vn, nvl) {
    _nome = n;
    _sobrenome = sn;
    _vinculo = vn;
    _nivel = nvl;
  }

  // Com nome
  Professor.contratar(n, sn) {
    _nome = n;
    _sobrenome = sn;
    _vinculo = "Esunicamp";
    _nivel = "MS3.1";
  }

  @override
  displayInfo() {
    return """
    Nome: $_nome;
    Sobrenome: $_sobrenome;
    Vínculo: $_vinculo;
    Nível: $_nivel;
    """;
  }
}

class ProfessorEmergencial extends Professor {
  ProfessorEmergencial.contratar(n, sn) : super(n, sn, "CLT", "RTP");
}

class Aluno extends Pessoa {
  @override
  Aluno() {
    _nome = "Fulano";
    _sobrenome = "De Tal";
  }

  @override
  displayInfo() {
    return """
    Nome Completo: $nome $sobrenome;
    Vínculo: Estudante;
    """;
  }
}
