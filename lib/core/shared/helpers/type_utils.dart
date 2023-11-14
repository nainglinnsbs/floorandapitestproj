import '../../feat_core.dart';

class TypesHelper {
  TypesHelper._();
  static double toDobule(num val) {
    try {
      // ignore: unnecessary_null_comparison
      if (val == null) {
        return 0;
      }
      if (val is double) {
        return val;
      } else {
        return val.toDouble();
      }
    } catch (error) {
      Logger.e('Error', "Fail to parse double");
      return 0;
    }
  }
}
