import '../feat_item_price.dart';

extension ItemDtoListX on List<ItemPriceDto> {
  List<ItemPriceModel> get domainList => toDomainList();
  List<ItemPriceModel> toDomainList() => map((e) => e.domainModel).toList();
}

extension UtilExtensions on String {
  List<String> multiSplit(Iterable<String> delimeters) => delimeters.isEmpty
      ? [this]
      : split(RegExp(delimeters.map(RegExp.escape).join('|')));
}
