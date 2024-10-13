import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ah_cha/providers/folder_provider.dart';
import 'package:ah_cha/screens/folder_screen.dart';
import 'package:ah_cha/widgets/fancy_folder_tile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AH CHA'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Consumer<FolderProvider>(
        builder: (context, folderProvider, child) {
          if (folderProvider.folders.isEmpty) {
            folderProvider.fetchFolders();
            return Center(child: CircularProgressIndicator());
          }
          return GridView.builder(
            padding: EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: folderProvider.folders.length,
            itemBuilder: (context, index) {
              final folder = folderProvider.folders[index];
              return FancyFolderTile(
                folder: folder,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FolderScreen(folder: folder),
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
          // TODO: Implement add new folder functionality
        },
      ),
    );
  }
}