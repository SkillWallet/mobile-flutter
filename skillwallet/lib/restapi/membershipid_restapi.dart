import 'package:dio/dio.dart';
import 'package:skillwallet/models/membership_id_model.dart';

abstract class IMembershipClientRepository {
  Future<MembershipIdModel?> getMembershipData(addres);
}

class MembershipIDClient extends IMembershipClientRepository {
  Dio? _dio;

  MembershipIDClient() {
    _dio = Dio();
  }

  @override
  Future<MembershipIdModel?> getMembershipData(addres) async {
    Response response = await _dio!.get(
        "https://api.skillwallet.id/api/skillwallet/13/community/$addres/membershipID");

    if (response.statusCode! >= 200) {
      return MembershipIdModel.fromJson(response.data!);
    }

    return null;
  }
}
