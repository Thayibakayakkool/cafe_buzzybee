part of 'item_bloc.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();
}

class SelectMenuCategoryEvent extends ItemEvent {
  final String selectedMenu;

  const SelectMenuCategoryEvent(this.selectedMenu);

  @override
  List<Object?> get props => [selectedMenu];
}

class SearchItemEvent extends ItemEvent {
  final String query;

  const SearchItemEvent(this.query);

  @override
  List<Object?> get props => [query];
}
class ChangeGridColumnEvent extends ItemEvent {
  final int crossAxisCount;

  const ChangeGridColumnEvent(this.crossAxisCount);

  @override
  List<Object?> get props => [crossAxisCount];
}