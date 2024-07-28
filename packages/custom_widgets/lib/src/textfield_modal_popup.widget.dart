import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

/// Widget de entrada para numero celular
class TextfieldModalPopup extends StatelessWidget {
  /// Constructor
  const TextfieldModalPopup({
    required this.hint,
    required this.onTap,
    required this.icon,
    this.text,
    // this.onChanged,
    super.key,
  });

  /// Texto de apoyo
  final String hint;

  /// Texto de valor seleccionado
  final String? text;

  /// Funcion al presionar en el campo
  final void Function()? onTap;

  /// Icono
  final IconData icon;

  /// Funcion para ingresar logica al detectar un cambio en el textfield
  // final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.onBackground.withOpacity(.1),
            ),
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Center(
                child: (text != null)
                    ? Text(
                        text!,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 16,
                        ),
                      )
                    : Text(
                        hint,
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.3),
                          fontSize: 16,
                        ),
                      ),
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: 12,
            child: Icon(
              icon,
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }
}
