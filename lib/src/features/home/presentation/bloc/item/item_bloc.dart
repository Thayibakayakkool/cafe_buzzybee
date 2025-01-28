import 'package:cafe_buzzybee/src/core/config/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'item_event.dart';

part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc()
      : super(ItemState(
            menuCategories: menu,
            selectedMenu: 'Croissant',
            menuItems: menuItems,
            filteredMenuItems: menuItems['Croissant'] ?? [])) {
    on<SelectMenuCategoryEvent>(_selectMenuCategoryEvent);
    on<SearchItemEvent>(_searchItemEvent);
  }

  Future<void> _selectMenuCategoryEvent(
      SelectMenuCategoryEvent event, Emitter<ItemState> emit) async {
    final selectedMenu = event.selectedMenu;
    emit(state.copyWith(
      selectedMenu: selectedMenu,
      filteredMenuItems: state.menuItems[selectedMenu] ?? [],
    ));
  }

  Future<void> _searchItemEvent(
      SearchItemEvent event, Emitter<ItemState> emit) async {
    final searchTerm = event.query.toLowerCase();
    final filteredItems = state.menuItems[state.selectedMenu]?.where((item) {
      return item['name']!.toLowerCase().contains(searchTerm);
    }).toList();
    emit(state.copyWith(filteredMenuItems: filteredItems ?? []));
  }
}
