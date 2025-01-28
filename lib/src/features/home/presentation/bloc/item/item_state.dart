part of 'item_bloc.dart';

class ItemState extends Equatable {
  final List<Map<String, String>> menuCategories;
  final String selectedMenu;
  final Map<String, List<Map<String, dynamic>>> menuItems;
  final List<Map<String, dynamic>> filteredMenuItems;

  const ItemState({
    required this.menuCategories,
    required this.selectedMenu,
    required this.menuItems,
    required this.filteredMenuItems,
  });

  ItemState copyWith({
    List<Map<String, String>>? menuCategories,
    String? selectedMenu,
    Map<String, List<Map<String, dynamic>>>? menuItems,
    List<Map<String, dynamic>>? filteredMenuItems,
  }) {
    return ItemState(
      menuCategories: menuCategories ?? this.menuCategories,
      selectedMenu: selectedMenu ?? this.selectedMenu,
      menuItems: menuItems ?? this.menuItems,
      filteredMenuItems: filteredMenuItems ?? this.filteredMenuItems,
    );
  }

  @override
  List<Object?> get props =>
      [menuCategories, selectedMenu, menuItems, filteredMenuItems];
}
