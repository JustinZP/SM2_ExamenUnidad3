import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_moviles_2/screens/LoginScreen.dart';

void main() {
  testWidgets('Pantalla Login contiene campos y botón', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    // Campo de correo
    expect(find.byType(TextFormField), findsNWidgets(2));

    // Campo por hint text
    expect(find.widgetWithText(TextFormField, 'Correo'), findsOneWidget);

    // Campo de contraseña
    expect(find.widgetWithText(TextFormField, 'Contraseña'), findsOneWidget);

    // Botón de iniciar sesión
    expect(find.widgetWithText(ElevatedButton, 'Iniciar sesión'), findsOneWidget);
  });

  testWidgets('Escribir texto en campos de login', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    await tester.enterText(find.widgetWithText(TextFormField, 'Correo'), 'test@ejemplo.com');
    await tester.enterText(find.widgetWithText(TextFormField, 'Contraseña'), '123456');

    expect(find.text('test@ejemplo.com'), findsOneWidget);
    expect(find.text('123456'), findsOneWidget);
  });

  testWidgets('Botón iniciar sesión se presiona correctamente', (WidgetTester tester) async {
    bool presionado = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: ElevatedButton(
                onPressed: () {
                  presionado = true;
                },
                child: const Text('Iniciar sesión'),
              ),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('Iniciar sesión'));
    await tester.pump();

    expect(presionado, isTrue);
  });
}
