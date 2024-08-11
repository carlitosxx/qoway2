import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/services.dart';

/// clase de entrada para nombres o apellidos
class TextfieldName extends StatelessWidget {
  /// Widget de entrada para numero de celular
  const TextfieldName({
    required this.hint,
    required this.controller,
    this.onChanged,
    this.icon,
    this.focus,
    super.key,
  });

  /// Texto de apoyo visual de lo que debe ingresar
  final String hint;

  /// Controlador para obtener el valor del texto ingresado
  final TextEditingController controller;

  /// Funcion para ingresar logica al detectar un cambio en el textfield
  final void Function(String)? onChanged;

  /// Icono
  final IconData? icon;

  /// Focus
  final FocusNode? focus;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          focusNode: focus,
          onChanged: onChanged,
          controller: controller,
          maxLength: 35,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.name,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 16,
          ),
          inputFormatters: [
            FilteringTextInputFormatter.allow(
              RegExp(r'[a-zA-Z\sáéíóúÁÉÍÓÚ]'),
            ),
          ],
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 50),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.primary),
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: Theme.of(context).colorScheme.onSurface.withOpacity(.1),
            filled: true,
            counterText: '',
            border: InputBorder.none,
            hintText: hint,
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
            ),
          ),
        ),
        Positioned(
          left: 16,
          top: 12,
          child: Icon(
            icon ?? Icons.person,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}
