class Validadores {
  static String? textoObrigatorio(String? valor) => valor == null || valor.trim().isEmpty ? 'Este campo é obrigatório.' : null;
  static String? quantidade(String? valor) {
    final n = int.tryParse((valor ?? '').trim());
    if (n == null || n < 0) return 'Informe um número inteiro maior ou igual a zero.';
    return null;
  }
}
