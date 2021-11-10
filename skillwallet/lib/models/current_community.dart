class CurrentCommunity {
  String? address;
  int? members;
  String? name;
  String? description;
  int? scarcityScore;
  int? repCredits;
  double? comScore;

  CurrentCommunity(
      {this.address,
      this.members,
      this.name,
      this.description,
      this.scarcityScore,
      this.repCredits,
      this.comScore});

  factory CurrentCommunity.fromJson(Map<String, dynamic> json) {
    return CurrentCommunity(
      address: json['address'] as String?,
      members: json['members'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      scarcityScore: json['scarcityScore'] as int?,
      repCredits: json['repCredits'] as int?,
      comScore: json['comScore'] as double?,
    );
  }

  Map<String, dynamic> toJson() => {
        'address': address,
        'members': members,
        'name': name,
        'description': description,
        'scarcityScore': scarcityScore,
        'repCredits': repCredits,
        'comScore': comScore,
      };
}
