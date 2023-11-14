import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_failure.freezed.dart';

@freezed
class ItemFailure with _$ItemFailure {
  const factory ItemFailure.api(
    int? errorCode,
    String? message,
  ) = _Api;
}
