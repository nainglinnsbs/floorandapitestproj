import 'package:dio/dio.dart';

import '../../../core/feat_core.dart';
import '../../../env.dart';
import '../../feat_item.dart';

class ItemRemoteService {
  static const String tag = 'ItemRemoteService';

  final Dio _dio;

  ItemRemoteService(this._dio);

  // Get all customers.
  ///
  /// Optional [modifiedData] for passing to request payload data.
  ///
  /// Throw [SoapApiException]
  Future<Result<List<ItemDto>>> getAllItems({
    String? modifiedDate,
  }) async {
    Logger.i(tag, 'modifiedDate: $modifiedDate');
    final payload = {
      "modifiedOn": modifiedDate ?? '',
      "sign": Env.sign,
    };

    try {
      final response = await _dio.post(
        '/GetAll_Items',
        data: payload,
      );

      if (response.statusCode == 200) {
        final jsonData = (response.data as String).xmlToJson;
        final responseInfo = ResponseInfoDto.fromJson(
          nextDecode(jsonData, ApiConsts.responseInfo),
        );

        if (responseInfo.code == '0') {
          final responseData = nextDecode<List<dynamic>>(
            jsonData,
            ApiConsts.responseData,
          );

          final convertedData =
              responseData.map((e) => ItemDto.fromJson(e)).toList();

          return Result.withData(convertedData);
        } else {
          throw SoapApiException(
            responseInfo.code.valInt,
            responseInfo.message,
          );
        }
      } else {
        throw SoapApiException(
          response.statusCode,
          response.statusMessage,
        );
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return const Result.noConnection();
      } else if (e.error != null) {
        throw SoapApiException(
          e.response?.statusCode,
          e.response?.statusMessage,
        );
      } else {
        Logger.e(
          tag,
          'getAllItems: $e',
        );
        rethrow;
      }
    }
  }
}
