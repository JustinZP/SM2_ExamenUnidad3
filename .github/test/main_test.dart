import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_moviles_2/utils/preference_utils.dart';

void main() {
  group('Pruebas de filtrado de preferencias', () {
    test('Filtra elementos que contienen una subcadena', () {
      final preferencias = ['deportes', 'casual', 'formal'];
      final resultado = filtrarPreferencias(preferencias, 'ca');
      expect(resultado, contains('casual'));
      expect(resultado.length, 1);
    });

    test('Devuelve lista vacía si no hay coincidencias', () {
      final preferencias = ['deportes', 'casual'];
      final resultado = filtrarPreferencias(preferencias, 'elegante');
      expect(resultado, isEmpty);
    });

    test('El filtrado distingue entre mayúsculas y minúsculas', () {
      final preferencias = ['Ropa', 'ropa deportiva'];
      final resultado = filtrarPreferencias(preferencias, 'ropa');
      expect(resultado, contains('ropa deportiva'));
      expect(resultado, isNot(contains('Ropa')));
    });
  });
}
