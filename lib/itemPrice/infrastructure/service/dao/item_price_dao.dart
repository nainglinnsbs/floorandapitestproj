import 'package:floor/floor.dart';
import 'package:simple_app/itemPrice/infrastructure/models/item_price_dto.dart';

@dao
abstract class ItemPriceDao {
  @Query('SELECT * FROM items where active="True"')
  Future<List<ItemPriceDto>> findAll();

  @Query('SELECT * FROM items')
  Stream<List<ItemPriceDto>> findAllItemPrice();

  @Query('SELECT * FROM itemPrice WHERE itemId = :id')
  Future<ItemPriceDto?> findbyItemID(String id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<List<int>> insertMany(List<ItemPriceDto> items);

  @Query('SELECT * FROM items WHERE item_name LIKE :name order by seq asc')
  Stream<List<ItemPriceDto>> findByItemNameStream(String name);
}
