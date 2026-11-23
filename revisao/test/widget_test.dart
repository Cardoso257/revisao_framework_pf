import 'package:flutter_test/flutter_test.dart';
import 'package:revisao/utils/validadores.dart';
void main(){test('valida texto obrigatório',(){expect(Validadores.textoObrigatorio('  '),isNotNull);expect(Validadores.textoObrigatorio('Material'),isNull);});test('quantidade aceita zero e rejeita negativos',(){expect(Validadores.quantidade('0'),isNull);expect(Validadores.quantidade('-1'),isNotNull);});}
