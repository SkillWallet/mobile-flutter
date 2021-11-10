class Badge {
  String? title;
  String? description;
  String? image;

  Badge({this.title, this.description, this.image});

  factory Badge.fromJson(Map<String, dynamic> json) => Badge(
        title: json['title'] as String?,
        description: json['description'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'image': image,
      };
}
