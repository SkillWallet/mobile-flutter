class MembershipIdModel {
  String? communityName;
  String? logoImage;
  String? membershipNumber;
  String? description;
  String? about;
  String? owner;
  String? date;

  MembershipIdModel(
      {this.communityName,
      this.logoImage,
      this.membershipNumber,
      this.description,
      this.about,
      this.owner,
      this.date});

  factory MembershipIdModel.fromJson(Map<String, dynamic> json) {
    return MembershipIdModel(
      communityName: json['communityName'] as String?,
      logoImage: json['logoImage'] as String?,
      membershipNumber: json['membershipNumber'] as String?,
      description: json['communnityDescription'] as String?,
      about: json['about'] as String?,
      owner: json['owner'] as String?,
      date: json['date'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'communityName': communityName,
        'logoImage': logoImage,
        'membershipNumber': membershipNumber,
        'communnityDescription': description,
        'about': about,
        'owner': owner,
        'date': date,
      };
}
