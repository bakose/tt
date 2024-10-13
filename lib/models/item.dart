class Item {
  final int? id;
  final String name;
  final String purchaseInterval;
  final String purchaseLink;
  final List<String> tags;
  final int folderId;

  Item({
    this.id,
    required this.name,
    required this.purchaseInterval,
    required this.purchaseLink,
    required this.tags,
    required this.folderId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'purchaseInterval': purchaseInterval,
      'purchaseLink': purchaseLink,
      'tags': tags.join(','),
      'folderId': folderId,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      purchaseInterval: map['purchaseInterval'],
      purchaseLink: map['purchaseLink'],
      tags: map['tags'].split(','),
      folderId: map['folderId'],
    );
  }
}