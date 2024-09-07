import 'package:flutter/material.dart';

String limparCpf(String cpf) {
  return cpf.replaceAll(RegExp(r'\D'), '');
}

bool validarCpf(String cpf) {
  cpf = limparCpf(cpf);

  if (cpf.length != 11) {
    return false;
  }

  if (cpf.split('').every((char) => char == cpf[0])) {
    return false;
  }

  int soma = 0;
  for (int i = 0; i < 9; i++) {
    soma += int.parse(cpf[i]) * (10 - i);
  }
  int primeiroDigitoVerificador = (soma * 10) % 11;
  if (primeiroDigitoVerificador == 10) {
    primeiroDigitoVerificador = 0;
  }

  soma = 0;
  for (int i = 0; i < 10; i++) {
    soma += int.parse(cpf[i]) * (11 - i);
  }
  int segundoDigitoVerificador = (soma * 10) % 11;
  if (segundoDigitoVerificador == 10) {
    segundoDigitoVerificador = 0;
  }

  return primeiroDigitoVerificador == int.parse(cpf[9]) &&
         segundoDigitoVerificador == int.parse(cpf[10]);
}

void main() {
  String cpfTeste = "123.456.789-09";
  if (validarCpf(cpfTeste)) {
    debugPrint("CPF válido!");
  } else {
    debugPrint("CPF inválido!");
  }
}
