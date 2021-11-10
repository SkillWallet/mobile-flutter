class InteractionResult {
  String? image;
  int? role;
  int? amount;
  String? title;
  String? description;
  String? communityName;
  String? membershipID;
  String? date;

  InteractionResult(
      {this.image,
      this.role,
      this.amount,
      this.title,
      this.description,
      this.membershipID,
      this.communityName,
      this.date});

  factory InteractionResult.fromJson(Map<String, dynamic> json) {
    return InteractionResult(
      image: json['image'] as String?,
      role: json['role'] as int?,
      amount: json['amount'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      date: json['date'] as String?,
      communityName: json['communityName'] as String?,
      membershipID: json['membershipID'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'image': image,
        'role': role,
        'amount': amount,
        'title': title,
        'description': description,
        'membershipID': membershipID,
        'communityName': communityName,
        'date': date,
      };
}
