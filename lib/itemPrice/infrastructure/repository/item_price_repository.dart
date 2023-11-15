import 'package:dartz/dartz.dart';
import 'package:simple_app/core/feat_core.dart';
import 'package:simple_app/itemPrice/feat_item_price.dart';

abstract class ItemPriceRepository {
  Future<Either<ItemPriceFailure, DomainResult<List<ItemPriceModel>>>>
      getAllItemsPrice();

  Stream<List<ItemPriceModel>> watchItem({String? filter});
}
