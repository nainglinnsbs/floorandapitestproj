import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../feat_item.dart';

part 'get_all_item_notifier.freezed.dart';

@freezed
class GetAllItemState with _$GetAllItemState {
  const factory GetAllItemState.initial() = _Initial;
  const factory GetAllItemState.loading() = _Loading;
  const factory GetAllItemState.empty() = _Empty;
  const factory GetAllItemState.noConnection() = _NoConnection;
  const factory GetAllItemState.success(List<ItemModel> products) = _Success;
  const factory GetAllItemState.error(ItemFailure failure) = _Error;
}

class GetAllItemNotifier extends StateNotifier<GetAllItemState> {
  final ItemRepository _repository;

  GetAllItemNotifier(this._repository) : super(const GetAllItemState.initial());

  Future<void> call() async {
    state = const GetAllItemState.loading();
    final fos = await _repository.getAllItems();
    state = fos.fold(
      (l) => GetAllItemState.error(l),
      (r) => r.when(
        noConnection: () => const GetAllItemState.noConnection(),
        result: (products) => products.isEmpty
            ? const GetAllItemState.empty()
            : GetAllItemState.success(products),
      ),
    );
  }
}
