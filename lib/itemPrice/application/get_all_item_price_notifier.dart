import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../feat_item_price.dart';

part 'get_all_item_price_notifier.freezed.dart';

@freezed
class GetAllItemPriceState with _$GetAllItemPriceState {
  const factory GetAllItemPriceState.initial() = _Initial;
  const factory GetAllItemPriceState.loading() = _Loading;
  const factory GetAllItemPriceState.empty() = _Empty;
  const factory GetAllItemPriceState.noConnection() = _NoConnection;
  const factory GetAllItemPriceState.success(List<ItemPriceModel> itemPrice) =
      _Success;
  const factory GetAllItemPriceState.error(ItemPriceFailure failure) = _Error;
}

class GetAllItemPriceNotifier extends StateNotifier<GetAllItemPriceState> {
  final ItemPriceRepository _repository;

  GetAllItemPriceNotifier(this._repository)
      : super(const GetAllItemPriceState.initial());

  Future<void> call() async {
    state = const GetAllItemPriceState.loading();
    final fos = await _repository.getAllItemsPrice();
    state = fos.fold(
      (l) => GetAllItemPriceState.error(l),
      (r) => r.when(
        noConnection: () {
          return const GetAllItemPriceState.noConnection();
        },
        result: (itemPrice) => itemPrice.isEmpty
            ? const GetAllItemPriceState.empty()
            : GetAllItemPriceState.success(itemPrice),
      ),
    );
  }
}
