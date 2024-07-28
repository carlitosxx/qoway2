import 'package:flutter/material.dart';

/// clase de entrada para el correo
class TextfieldPassword extends StatefulWidget {
  /// Widget de entrada para el correo
  const TextfieldPassword({
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
  State<TextfieldPassword> createState() => _TextfieldPasswordState();
}

class _TextfieldPasswordState extends State<TextfieldPassword> {
  bool isOpen = true;
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
            // autofocus: true,
            onChanged: widget.onChanged,
            obscureText: isOpen,
            controller: widget.controller,
            maxLength: 12,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              counterText: '',
              border: InputBorder.none,
              hintText: widget.hint,
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
            Icons.lock_rounded,
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.4),
          ),
        ),
        Positioned(
          right: 16,
          top: 12,
          child: GestureDetector(
            onTap: () {
              setState(() {
                isOpen = !isOpen;
              });
            },
            child: Icon(
              isOpen ? Icons.visibility_off : Icons.visibility,
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.4),
            ),
          ),
        ),
      ],
    );
  }
}
