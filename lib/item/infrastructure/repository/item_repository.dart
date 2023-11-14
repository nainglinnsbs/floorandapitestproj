import 'package:dartz/dartz.dart';

import '../../../core/feat_core.dart';
import '../../feat_item.dart';

abstract class ItemRepository {
  Future<Either<ItemFailure, DomainResult<List<ItemModel>>>> getAllItems();

  Stream<List<ItemModel>> watchItem({String? filter});
}
