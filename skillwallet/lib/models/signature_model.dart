class SignatureModel {
  String? signature;

  SignatureModel({this.signature});

  factory SignatureModel.fromJson(Map<String, dynamic> json) {
    return SignatureModel(
      signature: json['signature'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'signature': signature,
      };
}
