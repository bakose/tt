import 'package:flutter/foundation.dart';
import 'package:ah_cha/models/folder.dart';
import 'package:ah_cha/services/database_helper.dart';

class FolderProvider with ChangeNotifier {
  List<Folder> _folders = [];

  List<Folder> get folders => _folders;

  Future<void> fetchFolders() async {
    _folders = await DatabaseHelper.instance.getFolders();
    notifyListeners();
  }

  Future<void> addFolder(Folder folder) async {
    await DatabaseHelper.instance.insertFolder(folder);
    await fetchFolders();
  }

  Future<void> updateFolder(Folder folder) async {
    await DatabaseHelper.instance.updateFolder(folder);
    await fetchFolders();
  }

  Future<void> deleteFolder(int id) async {
    await DatabaseHelper.instance.deleteFolder(id);
    await fetchFolders();
  }
}