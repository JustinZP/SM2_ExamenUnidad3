import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_moviles_2/utils/preference_utils.dart';

void main() {
  test('Filtra preferencias que contienen texto', () {
    final preferencias = ['deportes', 'casual', 'formal'];
    final resultado = filtrarPreferencias(preferencias, 'ca');
    expect(resultado, contains('casual'));
    expect(resultado.length, 1);
  });

  test('Devuelve vacío si no hay coincidencias', () {
    final preferencias = ['deportes', 'casual'];
    final resultado = filtrarPreferencias(preferencias, 'elegante');
    expect(resultado, isEmpty);
  });

  test('Filtrado distingue mayúsculas y minúsculas', () {
    final preferencias = ['Ropa', 'ropa deportiva'];
    final resultado = filtrarPreferencias(preferencias, 'ropa');
    expect(resultado, contains('ropa deportiva'));
    expect(resultado, isNot(contains('Ropa')));
  });
}
