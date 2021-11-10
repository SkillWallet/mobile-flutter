import 'badge.dart';

class BadgesModel {
  String? communityName;
  List<Badge>? badges;

  BadgesModel({this.communityName, this.badges});

  factory BadgesModel.fromJson(Map<String, dynamic> json) => BadgesModel(
        communityName: json['communityName'] as String?,
        badges: (json['badges'] as List<dynamic>?)
            ?.map((e) => Badge.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'communityName': communityName,
        'badges': badges?.map((e) => e.toJson()).toList(),
      };
}
