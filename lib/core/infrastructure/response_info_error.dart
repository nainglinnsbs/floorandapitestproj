import 'package:freezed_annotation/freezed_annotation.dart';
part 'response_info_error.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.api(
    int? errorCode,
    String? message,
  ) = _Api;
}
