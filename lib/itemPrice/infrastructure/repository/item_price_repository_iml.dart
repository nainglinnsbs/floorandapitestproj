import 'package:dartz/dartz.dart';

import '../../../core/feat_core.dart';
import '../../feat_item_price.dart';

class ItemPriceRepositoryImpl implements ItemPriceRepository {
  final ItemPriceRemoteService _itemRemoteService;
  final ItemPriceLocalService _localService;

  ItemPriceRepositoryImpl(this._itemRemoteService, this._localService);

  @override
  Future<Either<ItemPriceFailure, DomainResult<List<ItemPriceModel>>>>
      getAllItemsPrice() async {
    try {
      final result = await _itemRemoteService.getAllItemsPrice();
      return right(
        await result.when(
          noConnection: () async {
            final localItemsPrice = await _localService.getAllItemsPrice();
            if (localItemsPrice.isEmpty) {
              return const DomainResult.noConnection();
            }
            return DomainResult.result(localItemsPrice.domainList);
          },
          withData: (data) async {
            await _localService.addAll(data);

            return DomainResult.result(data.domainList);
          },
        ),
      );
    } on RestApiException catch (e) {
      return left(ItemPriceFailure.api(e.errorCode, e.message));
    }
  }

  @override
  Stream<List<ItemPriceModel>> watchItem({String? filter}) {
    if (filter!.isEmpty) {
      return _localService.watchItems(filter: filter).map((event) {
        return event.domainList;
      });
    } else {
      return _localService.watchItems().map((event) {
        return event.domainList;
      });
    }
  }
}
