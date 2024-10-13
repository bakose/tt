import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ah_cha/models/folder.dart';
import 'package:ah_cha/providers/item_provider.dart';
import 'package:ah_cha/widgets/fancy_item_tile.dart';
import 'package:ah_cha/screens/item_detail_screen.dart';

class FolderScreen extends StatelessWidget {
  final Folder folder;

  const FolderScreen({Key? key, required this.folder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(folder.name),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Consumer<ItemProvider>(
        builder: (context, itemProvider, child) {
          final folderItems = itemProvider.items
              .where((item) => item.folderId == folder.id)
              .toList();

          if (folderItems.isEmpty) {
            return Center(child: Text('No items in this folder'));
          }

          return ListView.builder(
            itemCount: folderItems.length,
            itemBuilder: (context, index) {
              final item = folderItems[index];
              return FancyItemTile(
                item: item,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemDetailScreen(item: item),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // TODO: Implement add new item functionality
        },
      ),
    );
  }
}