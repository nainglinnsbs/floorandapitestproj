import '../feat_item.dart';

extension ItemDtoListX on List<ItemDto> {
  List<ItemModel> get domainList => toDomainList();
  List<ItemModel> toDomainList() => map((e) => e.domainModel).toList();
}

extension UtilExtensions on String {
  List<String> multiSplit(Iterable<String> delimeters) => delimeters.isEmpty
      ? [this]
      : split(RegExp(delimeters.map(RegExp.escape).join('|')));
}
