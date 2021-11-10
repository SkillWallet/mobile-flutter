import 'future_event.dart';
import 'past_event.dart';

class EventsModel {
  List<PastEvent>? pastEvents;
  List<FutureEvent>? futureEvents;

  EventsModel({this.pastEvents, this.futureEvents});

  factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
        pastEvents: (json['pastEvents'] as List<dynamic>?)
            ?.map((e) => PastEvent.fromJson(e as Map<String, dynamic>))
            .toList(),
        futureEvents: (json['futureEvents'] as List<dynamic>?)
            ?.map((e) => FutureEvent.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'pastEvents': pastEvents?.map((e) => e.toJson()).toList(),
        'futureEvents': futureEvents?.map((e) => e.toJson()).toList(),
      };
}
