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
    super.key,
  });

  /// Texto de apoyo visual de lo que debe ingresar
  final String hint;

  /// Controlador para obtener el valor del texto ingresado
  final TextEditingController controller;

  /// Funcion para ingresar logica al detectar un cambio en el textfield
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.onBackground.withOpacity(.1),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: TextField(
            onChanged: onChanged,
            controller: controller,
            maxLength: 35,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.name,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 16,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(r'[a-zA-Z\sáéíóúÁÉÍÓÚ]'),
              ),
            ],
            decoration: InputDecoration(
              counterText: '',
              border: InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(
                color:
                    Theme.of(context).colorScheme.onBackground.withOpacity(0.3),
              ),
            ),
          ),
        ),
        Positioned(
          left: 16,
          top: 12,
          child: Icon(
            Icons.person,
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}
