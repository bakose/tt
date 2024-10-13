import 'package:flutter/foundation.dart';
import 'package:ah_cha/models/item.dart';
import 'package:ah_cha/services/database_helper.dart';

class ItemProvider with ChangeNotifier {
  List<Item> _items = [];

  List<Item> get items => _items;

  Future<void> fetchItems() async {
    _items = await DatabaseHelper.instance.getItems();
    notifyListeners();
  }

  Future<void> addItem(Item item) async {
    await DatabaseHelper.instance.insertItem(item);
    await fetchItems();
  }

  Future<void> updateItem(Item item) async {
    await DatabaseHelper.instance.updateItem(item);
    await fetchItems();
  }

  Future<void> deleteItem(int id) async {
    await DatabaseHelper.instance.deleteItem(id);
    await fetchItems();
  }
}