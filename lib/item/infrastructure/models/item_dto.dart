import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/feat_core.dart';
import '../../feat_item.dart';

part 'item_dto.g.dart';

@JsonSerializable()
@Entity(tableName: 'items')
class ItemDto {
  @JsonKey(name: 'ItemID', fromJson: stringFromJson)
  @ColumnInfo(name: 'id')
  @primaryKey
  final String id;

  @JsonKey(name: 'ItemName', fromJson: stringFromJson)
  @ColumnInfo(name: 'itemName')
  final String itemName;

  @JsonKey(name: 'ItemNo', fromJson: stringFromJson)
  @ColumnInfo(name: 'itemNo')
  final String itemNo;

  @JsonKey(name: 'GenericID', fromJson: stringFromJson)
  @ColumnInfo(name: 'genericID')
  final String genericID;

  @JsonKey(name: 'GenericName', fromJson: stringFromJson)
  @ColumnInfo(name: 'genericName')
  final String genericName;

  @JsonKey(name: 'Active', fromJson: stringFromJson)
  @ColumnInfo(name: 'active')
  final String active;

  @JsonKey(name: 'CreatedOn', fromJson: stringFromJson)
  @ColumnInfo(name: 'createdOn')
  final String createdOn;

  @JsonKey(name: 'ModifiedOn', fromJson: stringFromJson)
  @ColumnInfo(name: 'modifiedOn')
  final String modifiedOn;

  ItemDto({
    required this.id,
    required this.itemName,
    required this.itemNo,
    required this.genericID,
    required this.genericName,
    required this.active,
    required this.createdOn,
    required this.modifiedOn,
  });

  /// Connect the generated [_$ItemDtoFromJson] function to the `fromJson`
  /// factory.
  factory ItemDto.fromJson(Map<String, dynamic> json) =>
      _$ItemDtoFromJson(json);

  /// Connect the generated [_$ItemDtoToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ItemDtoToJson(this);

  ItemModel get domainModel => toDomain();
  ItemModel toDomain() => ItemModel(
        itemID: id,
        itemName: itemName,
        itemNo: itemNo,
        genericID: genericID,
        genericName: genericName,
        createdOn: createdOn,
        modifiedOn: modifiedOn,
        createdBy: '',
        modifiedBy: '',
        active: active,
      );

  ItemDto copyWith({
    String? id,
    String? itemName,
    String? itemNo,
    String? genericID,
    String? genericName,
    String? active,
    String? createdOn,
    String? modifiedOn,
  }) {
    return ItemDto(
      id: id ?? this.id,
      itemName: itemName ?? this.itemName,
      itemNo: itemNo ?? this.itemNo,
      genericID: genericID ?? this.genericID,
      genericName: genericName ?? this.genericName,
      createdOn: createdOn ?? this.createdOn,
      active: active ?? this.active,
      modifiedOn: modifiedOn ?? this.modifiedOn,
    );
  }

  @override
  String toString() {
    return 'ItemDto(id: $id, itemName: $itemName, itemNo: $itemNo, genericID: $genericID, genericName: $genericName, active: $active,createdOn: $createdOn, modifiedOn: $modifiedOn)';
  }

  @override
  bool operator ==(covariant ItemDto other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.itemName == itemName &&
        other.itemNo == itemNo &&
        other.genericID == genericID &&
        other.genericName == genericName &&
        other.active == active &&
        other.createdOn == createdOn &&
        other.modifiedOn == modifiedOn;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        itemName.hashCode ^
        itemNo.hashCode ^
        genericID.hashCode ^
        genericName.hashCode ^
        active.hashCode ^
        createdOn.hashCode ^
        modifiedOn.hashCode;
  }
}
