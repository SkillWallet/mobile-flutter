import 'current_community.dart';
import 'past_community.dart';
import 'skill.dart';

class SkillWalletProfileModel {
  List<PastCommunity>? pastCommunities;
  List<Skill>? skills;
  List<CurrentCommunity>? currentCommunities;
  String? imageUrl;
  String? nickname;
  int? diToCredits;
  String? tokenId;
  double? repScore;

  SkillWalletProfileModel(
      {this.pastCommunities,
      this.skills,
      this.currentCommunities,
      this.imageUrl,
      this.nickname,
      this.diToCredits,
      this.tokenId,
      this.repScore});

  factory SkillWalletProfileModel.fromJson(Map<String, dynamic> json) {
    return SkillWalletProfileModel(
      pastCommunities: (json['pastCommunities'] as List<dynamic>?)
          ?.map((e) => PastCommunity.fromJson(e as Map<String, dynamic>))
          .toList(),
      skills: (json['skills'] as List<dynamic>?)
          ?.map((e) => Skill.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentCommunities: (json['currentCommunities'] as List<dynamic>?)
          ?.map((e) => CurrentCommunity.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageUrl: json['imageUrl'] as String?,
      nickname: json['nickname'] as String?,
      diToCredits: json['diToCredits'] as int?,
      tokenId: json['tokenId'] as String?,
      repScore: json['repScore'] as double?,
    );
  }

  Map<String, dynamic> toJson() => {
        'pastCommunities': pastCommunities?.map((e) => e.toJson()).toList(),
        'currentCommunity': currentCommunities?.map((e) => e.toJson()).toList(),
        'skills': skills?.map((e) => e.toJson()).toList(),
        'imageUrl': imageUrl,
        'nickname': nickname,
        'diToCredits': diToCredits,
        'tokenId': tokenId,
        'repScore': repScore,
      };
}
