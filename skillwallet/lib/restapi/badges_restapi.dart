import 'package:dio/dio.dart';
import 'package:skillwallet/models/badges_model.dart';

abstract class IBadgesClientRepository {
  Future<List<BadgesModel?>?> getBadges(tokenID);
}

class BadgesRestAPI extends IBadgesClientRepository {
  Dio? _dio;

  BadgesRestAPI() {
    _dio = Dio();
  }

  @override
  Future<List<BadgesModel?>?> getBadges(tokenID) async {
    Response response = await _dio!
        .get("https://api.skillwallet.id/api/skillwallet/$tokenID/badges");

    if (response.statusCode! >= 200) {
      return (response.data as List)
          .map((e) => BadgesModel.fromJson(e))
          .toList();
    }

    return null;
  }
}
