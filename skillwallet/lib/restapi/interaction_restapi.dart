import 'package:dio/dio.dart';
import 'package:skillwallet/models/interaction_result.dart';

abstract class IInteractionClientRepository {
  Future<List<InteractionResult?>?> getInteractions(tokenID);
}

class InteractionRestAPI implements IInteractionClientRepository {
  Dio? _dio;

  InteractionRestAPI() {
    _dio = Dio();
  }

  @override
  Future<List<InteractionResult?>?> getInteractions(tokenID) async {
    Response response = await _dio!.get(
        "https://api.skillwallet.id/api/skillwallet/$tokenID/interactions");

    if (response.statusCode! >= 200) {
      return (response.data as List)
          .map((e) => InteractionResult.fromJson(e))
          .toList();
    } else {
      return null;
    }
  }
}
