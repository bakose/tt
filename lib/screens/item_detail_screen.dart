import 'package:flutter/material.dart';
import 'package:ah_cha/models/item.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemDetailScreen extends StatelessWidget {
  final Item item;

  const ItemDetailScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Purchase Interval: ${item.purchaseInterval}'),
            SizedBox(height: 16),
            Text('Tags: ${item.tags.join(", ")}'),
            SizedBox(height: 32),
            ElevatedButton(
              child: Text('Open Purchase Link'),
              onPressed: () async {
                if (await canLaunch(item.purchaseLink)) {
                  await launch(item.purchaseLink);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Could not open the link')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}