import 'dart:convert';

/// funcion para llamar la clase badrequestModel
BadRequestModel badRequestModelFromJson(String str) =>
    BadRequestModel.fromJson(json.decode(str) as Map<String, dynamic>);

/// Modelo badquestmodel
class BadRequestModel {
  /// Constructor
  BadRequestModel({
    required this.statusCode,
    required this.message,
    required this.error,
    this.traceId,
    this.timestamp,
  });

  /// Contructor Factory FromJson
  factory BadRequestModel.fromJson(Map<String, dynamic> json) =>
      BadRequestModel(
        statusCode: json['statusCode'] as int,
        message: json['message'] is String
            ? [json['message'] as String]
            : List<String>.from(
                ((json['message']) as Iterable).map((x) => x),
              ),
        error: json['error'] as String,
      );

  /// Propiedad codigo de estado
  final int statusCode;

  /// Propiedad mensaje
  final List<String> message;

  /// Propiedad lista de strings
  final String error;

  /// Propiedad id del trazo del error
  final String? traceId;

  /// Propiedad timestamp de tiempo
  final DateTime? timestamp;
}
