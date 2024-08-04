import 'package:equatable/equatable.dart';

class NetworkErrorModel extends Equatable {
  final String? error;

  const NetworkErrorModel({this.error});

  factory NetworkErrorModel.fromJson(Map<String, dynamic> json) {
    return NetworkErrorModel(error: json['error']);
  }

  Map<String, dynamic> toJson() {
    return {'error': error};
  }

  @override
  List<Object?> get props => [error];
}
