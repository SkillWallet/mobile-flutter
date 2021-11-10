class PastCommunity {
  String? name;
  String? address;

  PastCommunity({this.name, this.address});

  factory PastCommunity.fromJson(Map<String, dynamic> json) => PastCommunity(
        name: json['name'] as String?,
        address: json['address'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'address': address,
      };
}
