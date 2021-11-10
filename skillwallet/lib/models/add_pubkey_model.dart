class AddPubkeyModel {
  String? pubKey;

  AddPubkeyModel({this.pubKey});

  factory AddPubkeyModel.fromJson(Map<String, dynamic> json) {
    return AddPubkeyModel(
      pubKey: json['pubKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'pubKey': pubKey,
      };
}
