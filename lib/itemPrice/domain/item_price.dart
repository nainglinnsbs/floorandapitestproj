import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_price.freezed.dart';

// {
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
//     },

@freezed
class ItemPriceModel with _$ItemPriceModel {
  const factory ItemPriceModel({
    required String itemPriceID,
    required String itemID,
    required String unitID,
    required String price,
    required String itemOptionLabelIDs,
    required String createdBy,
    required String createdOn,
    required String modifiedBy,
    required String modifiedOn,
    required String active,
  }) = _ItemModel;
}
