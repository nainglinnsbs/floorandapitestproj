import 'package:dartz/dartz.dart';

import '../../../core/feat_core.dart';
import '../../feat_item.dart';

class ItemRepositoryImpl implements ItemRepository {
  final ItemRemoteService _remoteService;
  final ItemLocalService _localService;

  ItemRepositoryImpl(this._remoteService, this._localService);

  @override
  Future<Either<ItemFailure, DomainResult<List<ItemModel>>>>
      getAllItems() async {
    try {
      final result = await _remoteService.getAllItems();
      return right(
        await result.when(
          noConnection: () async {
            final localItems = await _localService.getAllItems();
            if (localItems.isEmpty) return const DomainResult.noConnection();
            return DomainResult.result(localItems.domainList);
          },
          withData: (data) async {
            await _localService.addAll(data);

            return DomainResult.result(data.domainList);
          },
        ),
      );
    } on RestApiException catch (e) {
      return left(ItemFailure.api(e.errorCode, e.message));
    }
  }

  @override
  Stream<List<ItemModel>> watchItem({String? filter}) {
    if (filter!.isEmpty) {
      return _localService.watchItems(filter: filter).map((e) {
        return e.domainList;
      });
    } else {
      return _localService.watchAllItems().map((e) {
        return e.domainList;
      });
    }
  }
}
