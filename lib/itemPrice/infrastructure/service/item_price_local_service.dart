// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:simple_app/itemPrice/infrastructure/models/item_price_dto.dart';
import 'package:simple_app/itemPrice/infrastructure/service/dao/item_price_dao.dart';

class ItemPriceLocalService {
  final ItemPriceDao dao;

  ItemPriceLocalService(this.dao);

  Future<List<ItemPriceDto>> getAllItemsPrice() async {
    return await dao.findAll();
  }

  Stream<List<ItemPriceDto>> watchItems({String? filter}) {
    return dao.findByItemNameStream(filter ?? '');
  }

  Future<ItemPriceDto?> getItemById(String id) async {
    return await dao.findbyItemID(id);
  }

  Future<List<int>> addAll(List<ItemPriceDto> items) async {
    return await dao.insertMany(items);
  }
}
