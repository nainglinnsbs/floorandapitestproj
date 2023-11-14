import '../../feat_item.dart';

class ItemLocalService {
  final ItemDao _dao;

  ItemLocalService(this._dao);

  Future<List<ItemDto>> getAllItems() async {
    return await _dao.findAll();
  }

  Stream<List<ItemDto>> watchItems({String? filter}) {
    return _dao.findByItemNameStream(filter ?? '');
  }

  Stream<List<ItemDto>> watchAllItems() {
    return _dao.findAllStream();
  }

  Future<ItemDto?> getItemById(String id) async {
    return await _dao.findById(id);
  }

  Future<String?> getNameById(String id) async {
    return await _dao.getItemName(id);
  }

  Future<void> addOne(ItemDto product) async {
    await _dao.insertOne(product);
  }

  Future<List<int>> addAll(List<ItemDto> products) async {
    return await _dao.insertMany(products);
  }
}
