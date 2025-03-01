import 'package:cafe_buzzybee/src/core/config/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'item_event.dart';

part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc(double screenWidth)
      : super(ItemState(
            menuCategories: menu,
            selectedMenu: 'All',
            menuItems: menuItems,
            filteredMenuItems: menuItems['All'] ?? [],
            crossAxisCount: _crossAxisCount(screenWidth))) {
    on<SelectMenuCategoryEvent>(_selectMenuCategoryEvent);
    on<SearchItemEvent>(_searchItemEvent);
    on<ChangeGridColumnEvent>(_changeGridColumnEvent);
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

  Future<void> _changeGridColumnEvent(
      ChangeGridColumnEvent event, Emitter<ItemState> emit) async {
    emit(state.copyWith(crossAxisCount: event.crossAxisCount));
  }

  static int _crossAxisCount(double screenWidth) {
    if (screenWidth < 600) {
      return 2;
    } else if (screenWidth >= 600 && screenWidth < 950) {
      return 2;
    } else {
      return 3;
    }
  }
}
