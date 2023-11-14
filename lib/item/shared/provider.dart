import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/feat_core.dart';
import '../feat_item.dart';

final itemDaoProvider = Provider<ItemDao>((ref) {
  return ref.watch(appFloorDBProvider).instance.itemDao;
});

final itemRemoteServiceProvider = Provider<ItemRemoteService>((ref) {
  return ItemRemoteService(ref.watch(dioProvider));
});

final itemLocalServiceProvider = Provider<ItemLocalService>((ref) {
  return ItemLocalService(ref.watch(itemDaoProvider));
});

final itemsRepositoryProvider = Provider<ItemRepository>((ref) {
  return ItemRepositoryImpl(
    ref.watch(itemRemoteServiceProvider),
    ref.watch(itemLocalServiceProvider),
  );
});

final getAllItemsNotifierProvider =
    StateNotifierProvider<GetAllItemNotifier, GetAllItemState>((ref) {
  return GetAllItemNotifier(ref.watch(itemsRepositoryProvider));
});
