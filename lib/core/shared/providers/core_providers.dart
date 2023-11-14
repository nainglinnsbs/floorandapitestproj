import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../env.dart';
import '../../application/network_status_notifier.dart';
import '../../feat_core.dart';
import '../netwrok_status.dart';

final dioProvider = Provider(
  (ref) => Dio()
    ..options = BaseOptions(
      baseUrl: Env.baseUrl,
      contentType: ApiConsts.formUrlEncoded,
    ),
);
final appFloorDBProvider = Provider(
  (ref) => AppFloorDB(),
);

final networkStatusNotifierProvider =
    StateNotifierProvider<NetworkStatusNotifier, NetworkState>(
  (ref) => NetworkStatusNotifier(),
);

final networkStatusProvider = Provider<NetworkStatus>(
  (ref) => ref.watch(networkStatusNotifierProvider).when(
        connected: () => NetworkStatus.connected,
        none: () => NetworkStatus.none,
      ),
);
