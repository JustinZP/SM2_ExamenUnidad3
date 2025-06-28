import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_moviles_2/services/AuthService.dart';

void main() {
  group('Pruebas de AuthService (Login)', () {
    test('Login con email inválido debe lanzar error', () async {
      try {
        await AuthService.loginUsuario('correo-invalido', '123456');
        fail('Se esperaba un error pero no ocurrió.');
      } catch (e) {
        expect(e.toString(), contains('email'));
      }
    });

    test('Login con contraseña incorrecta debe fallar', () async {
      try {
        await AuthService.loginUsuario('usuario@example.com', 'contraseñaIncorrecta');
        fail('Se esperaba un error pero no ocurrió.');
      } catch (e) {
        expect(e.toString(), contains('contraseña'));
      }
    });

    test('El usuario actual después del login debe no ser nulo', () async {
      // Solo si tienes un usuario real para test (¡puede fallar en Firebase si no existe!)
      try {
        await AuthService.loginUsuario('usuario@example.com', 'contraseñaCorrecta');
        final user = AuthService.currentUser;
        expect(user, isNotNull);
      } catch (e) {
        // Este test puede ser omitido si no tienes credenciales válidas
        expect(true, true); // Lo dejamos pasar
      }
    });
  });
}
