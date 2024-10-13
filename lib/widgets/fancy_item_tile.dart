import 'package:flutter/material.dart';
import 'package:ah_cha/models/item.dart';

class FancyItemTile extends StatelessWidget {
  final Item item;
  final VoidCallback onTap;

  const FancyItemTile({Key? key, required this.item, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(
          item.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text('Interval: ${item.purchaseInterval}'),
            SizedBox(height: 4),
            Wrap(
              spacing: 4,
              children: item.tags.map((tag) => Chip(label: Text(tag))).toList(),
            ),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}