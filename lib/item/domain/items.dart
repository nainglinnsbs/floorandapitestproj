import 'package:freezed_annotation/freezed_annotation.dart';

part 'items.freezed.dart';

@freezed
class ItemModel with _$ItemModel {
  const factory ItemModel({
    required String itemID,
    required String itemNo,
    required String itemName,
    required String createdOn,
    required String modifiedOn,
    required String genericName,
    required String genericID,
    required String active,
    required String createdBy,
    required String modifiedBy,
  }) = _ItemModel;
}
