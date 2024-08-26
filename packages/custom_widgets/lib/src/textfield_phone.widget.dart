import 'package:custom_widgets/src/custom_painters/pe.cp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Widget de entrada para numero celular
class TextfieldPhone extends StatelessWidget {
  /// Constructor
  const TextfieldPhone({
    required this.hint,
    required this.controller,
    this.onChanged,
    super.key,
  });

  /// Texto de apoyo
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
            color: Theme.of(context).colorScheme.onSurface.withOpacity(.1),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: TextField(
            onChanged: onChanged,
            controller: controller,
            maxLength: 9,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.phone,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 16,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: InputDecoration(
              counterText: '',
              border: InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
              ),
            ),
          ),
        ),
        Positioned(
          right: 16,
          top: 12,
          child: Icon(
            Icons.phone,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
          ),
        ),
        Positioned(
          left: 16,
          top: 10,
          child: CustomPaint(
            size: const Size(
              30,
              30 * 0.8872260823089257,
            ),
            painter: PeCP(),
          ),
        ),
      ],
    );
  }
}
