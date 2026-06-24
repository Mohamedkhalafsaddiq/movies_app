import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String success;
  final String statusCode;
  final String statusMessage;

  const ErrorMessageModel({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      success: json['success'].toString(),
      statusCode: json['status_code'].toString(),
      statusMessage: json['status_message'],
    );
  }

  @override
  List<Object?> get props => [success, statusCode, statusMessage];
}
