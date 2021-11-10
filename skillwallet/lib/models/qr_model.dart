class QrModel {
  String? tokenId;
  int? nonce;
  int? action;

  QrModel({this.tokenId, this.nonce, this.action});

  factory QrModel.fromJson(Map<String, dynamic> json) => QrModel(
        tokenId: json['tokenId'] as String?,
        nonce: json['nonce'] as int?,
        action: json['action'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'tokenId': tokenId,
        'nonce': nonce,
        'action': action,
      };
}
