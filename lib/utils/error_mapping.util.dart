import 'package:flutter/widgets.dart';

/// Mapeo de error
class ErrorMapping {
  /// Modelo para mapear un error con
  ErrorMapping({
    required this.messageError,
    required this.painter,
    required this.titleError,
  });

  /// Mensaje del error
  String messageError;

  /// Titulo del error
  String titleError;

  /// Custom painter de la imagen del error
  CustomPainter painter;
}

/// Mapeo de error
class ErrorMappingTablet {
  /// Modelo para mapear un error con
  ErrorMappingTablet({
    required this.messageError,
    required this.painter,
    required this.titleError,
  });

  /// Mensaje del error
  String messageError;

  /// Titulo del error
  String titleError;

  /// Custom painter de la imagen del error
  CustomPaint painter;
}
