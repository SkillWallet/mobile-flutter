import 'package:dio/dio.dart';
import 'package:skillwallet/models/skill_wallet_profile_model.dart';

abstract class ISkillWalletClientRepository {
  Future<SkillWalletProfileModel?> fetchProfileData(tokenID);
}

class SkillWalletClient implements ISkillWalletClientRepository {
  Dio? _dio;

  @override
  Future<SkillWalletProfileModel?> fetchProfileData(tokenID) async {
    _dio = Dio();

    Response response = await _dio!
        .get("https://api.skillwallet.id/api/skillwallet?tokenId=$tokenID");

    if (response.statusCode == 200) {
      return SkillWalletProfileModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
