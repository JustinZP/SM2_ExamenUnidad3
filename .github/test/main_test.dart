// test/main_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Pruebas unitarias de LoginScreen', () {
    // Simulación de la función _inputDecoration
    InputDecoration inputDecoration(String label, Color textColor, Color primaryColor) {
      return InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: textColor, fontFamily: 'Georgia'),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: primaryColor),
        ),
      );
    }

    test('Decoración del campo de texto contiene el label correcto', () {
      final decoration = inputDecoration('Correo electrónico', Color(0xFF3E1F00), Color(0xFF4E2500));
      expect(decoration.labelText, 'Correo electrónico');
      expect(decoration.labelStyle?.color, Color(0xFF3E1F00));
    });

    test('Validación de correo inválido (sin @)', () {
      String? validarCorreo(String? v) => v == null || !v.contains('@') ? 'Correo inválido' : null;
      final resultado = validarCorreo('correo_sin_arroba.com');
      expect(resultado, 'Correo inválido');
    });

    test('Validación de contraseña menor a 6 caracteres', () {
      String? validarPassword(String? v) => v == null || v.length < 6 ? 'Mínimo 6 caracteres' : null;
      final resultado = validarPassword('123');
      expect(resultado, 'Mínimo 6 caracteres');
    });
  });
}
