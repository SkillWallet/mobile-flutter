import 'package:dio/dio.dart';
import 'package:skillwallet/models/events_model.dart';

abstract class IEventsClientRepository {
  Future<EventsModel?> getEvents(tokenID);
}

class EventsRestAPI extends IEventsClientRepository {
  Dio? _dio;

  EventsRestAPI() {
    _dio = Dio();
  }

  @override
  Future<EventsModel?> getEvents(tokenID) async {
    Response response = await _dio!
        .get("https://api.skillwallet.id/api/skillwallet/$tokenID/events");

    if (response.statusCode! >= 200) {
      return EventsModel.fromJson(response.data);
    }

    return null;
  }
}
