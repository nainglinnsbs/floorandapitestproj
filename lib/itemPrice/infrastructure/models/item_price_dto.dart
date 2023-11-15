//{
//       "ItemPriceID": "015b5751-2360-44e0-85aa-a5f80ecdbc1e",
//       "ItemID": "8eaee0af-1da9-4ec4-82a8-a6b09bfb05d4",
//       "UnitID": "62fa5166-cf81-473e-90b6-11cb2fb1047f",
//       "Price": "1000.00",
//       "ItemOptionLabelIDs": "bb399111-b9eb-4362-b2a3-51e23ca1e5b3",
//       "CreatedBy": "db7cd1f9-6963-436a-967b-d62081c856e9",
//       "CreatedOn": "2023-03-20 15:20:42.070",
//       "ModifiedBy": "db7cd1f9-6963-436a-967b-d62081c856e9",
//       "ModifiedOn": "2023-03-20 15:28:08.953",
//       "Active": "True"
//},
import 'package:floor/floor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/feat_core.dart';
import '../../feat_item_price.dart';

part 'item_price_dto.g.dart';

@JsonSerializable()
@Entity(tableName: 'itemPrice')
class ItemPriceDto {
  @JsonKey(name: 'ItemPriceID', fromJson: stringFromJson)
  @ColumnInfo(name: 'id')
  @primaryKey
  final String id;

  @JsonKey(name: 'ItemID', fromJson: stringFromJson)
  @ColumnInfo(name: 'itemID')
  final String itemID;

  @JsonKey(name: 'UnitID', fromJson: stringFromJson)
  @ColumnInfo(name: 'unitID')
  final String unitID;

  @JsonKey(name: 'Price', fromJson: stringFromJson)
  @ColumnInfo(name: 'price')
  final String price;

  @JsonKey(name: 'ItemOptionLabelIDs', fromJson: stringFromJson)
  @ColumnInfo(name: 'itemOptionLabelIDs')
  final String itemOptionLabelIDs;

  @JsonKey(name: 'CreatedBy', fromJson: stringFromJson)
  @ColumnInfo(name: 'createdBy')
  final String createdBy;

  @JsonKey(name: 'CreatedOn', fromJson: stringFromJson)
  @ColumnInfo(name: 'createdOn')
  final String createdOn;

  @JsonKey(name: 'ModifiedBy', fromJson: stringFromJson)
  @ColumnInfo(name: 'modifiedBy')
  final String modifiedBy;

  @JsonKey(name: 'ModifiedOn', fromJson: stringFromJson)
  @ColumnInfo(name: 'modifiedOn')
  final String modifiedOn;

  @JsonKey(name: 'Active', fromJson: stringFromJson)
  @ColumnInfo(name: 'active')
  final String active;

  ItemPriceDto({
    required this.id,
    required this.itemID,
    required this.unitID,
    required this.price,
    required this.itemOptionLabelIDs,
    required this.createdBy,
    required this.createdOn,
    required this.modifiedBy,
    required this.modifiedOn,
    required this.active,
  });

  factory ItemPriceDto.fromJson(Map<String, dynamic> json) =>
      _$ItemPriceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ItemPriceDtoToJson(this);

  ItemPriceModel get domainModel => toDomain();
  ItemPriceModel toDomain() => ItemPriceModel(
        itemPriceID: id,
        itemID: itemID,
        unitID: unitID,
        price: price,
        itemOptionLabelIDs: itemOptionLabelIDs,
        createdBy: createdBy,
        createdOn: createdOn,
        modifiedBy: modifiedBy,
        modifiedOn: modifiedOn,
        active: active,
      );

  ItemPriceDto copyWith({
    String? id,
    String? itemID,
    String? unitID,
    String? price,
    String? itemOptionLabelIDs,
    String? createdBy,
    String? createdOn,
    String? modifiedBy,
    String? modifiedOn,
    String? active,
  }) {
    return ItemPriceDto(
      id: id ?? this.id,
      itemID: itemID ?? this.itemID,
      unitID: unitID ?? this.unitID,
      price: price ?? this.price,
      itemOptionLabelIDs: itemOptionLabelIDs ?? this.itemOptionLabelIDs,
      createdBy: createdBy ?? this.createdBy,
      createdOn: createdOn ?? this.createdOn,
      modifiedBy: modifiedBy ?? this.modifiedBy,
      modifiedOn: modifiedOn ?? this.modifiedOn,
      active: active ?? this.active,
    );
  }

  @override
  String toString() {
    return 'ItemPriceDto(id: $id, itemID: $itemID, unitId: $unitID, price: $price, itemOptionLabelIDs: $itemOptionLabelIDs, createdBy: $createdBy, createdOn: $createdOn, modifiedBy: $modifiedBy, modifiedOn: $modifiedOn, active: $active)';
  }

  @override
  bool operator ==(covariant ItemPriceDto other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.itemID == itemID &&
        other.unitID == unitID &&
        other.price == price &&
        other.itemOptionLabelIDs == itemOptionLabelIDs &&
        other.createdBy == createdBy &&
        other.createdOn == createdOn &&
        other.modifiedBy == modifiedBy &&
        other.modifiedOn == modifiedOn &&
        other.active == active;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        itemID.hashCode ^
        unitID.hashCode ^
        price.hashCode ^
        itemOptionLabelIDs.hashCode ^
        createdBy.hashCode ^
        createdOn.hashCode ^
        modifiedBy.hashCode ^
        modifiedOn.hashCode ^
        active.hashCode;
  }
}
