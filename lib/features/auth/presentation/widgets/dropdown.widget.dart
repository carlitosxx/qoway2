// import 'dart:js_interop';

import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({
    required this.hint,
    required this.onTap,
    this.text,
    super.key,
  });

  /// Texto de apoyo visual de lo que debe ingresar
  final String hint;
  final String? text;
  final void Function()? onTap;
  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 16,
          top: 12,
          child: Icon(
            Icons.keyboard_arrow_down,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
          ),
        ),
        GestureDetector(
          onTap: widget.onTap,
          child: Container(
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.onSurface.withOpacity(.1),
              ),
              child: Center(
                child: widget.text == null
                    ? Text(
                        widget.hint,
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.3),
                          fontSize: 16,
                        ),
                      )
                    : Text(
                        widget.text!,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 16,
                        ),
                      ),
              )),
        ),
        Positioned(
          left: 16,
          top: 12,
          child: Icon(
            Icons.paid,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}
