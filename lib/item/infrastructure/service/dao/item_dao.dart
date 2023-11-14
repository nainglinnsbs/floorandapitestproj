import 'package:floor/floor.dart';

import '../../../feat_item.dart';

@dao
abstract class ItemDao {
  @Query('SELECT * FROM products where active="True"')
  Future<List<ItemDto>> findAll();

  @Query('SELECT * FROM products')
  Stream<List<ItemDto>> findAllStream();

  @Query('SELECT * FROM products WHERE id = :id')
  Future<ItemDto?> findById(String id);

  @Query('SELECT itemName FROM products WHERE id = :id')
  Future<String?> getItemName(String id);

  @Query('SELECT * FROM products WHERE id = :id')
  Stream<ItemDto?> findByIdStream(String id);

  @Query('SELECT * FROM products WHERE item_name LIKE :name order by seq asc')
  Stream<List<ItemDto>> findByItemNameStream(String name);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertOne(ItemDto article);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<List<int>> insertMany(List<ItemDto> products);

  @Query("delete from articles where id = :id")
  Future<void> deleteById(int id);

  @delete
  Future<int> deleteAll(List<ItemDto> products);
}
