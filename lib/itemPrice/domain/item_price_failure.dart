import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_price_failure.freezed.dart';

@freezed
class ItemPriceFailure with _$ItemPriceFailure {
  const factory ItemPriceFailure.api(
    int? errorCode,
    String? message,
  ) = _Api;
}
