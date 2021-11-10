class FutureEvent {
  String? title;
  List<String>? roles;
  int? credits;

  FutureEvent({this.title, this.roles, this.credits});

  factory FutureEvent.fromJson(Map<String, dynamic> json) => FutureEvent(
        title: json['title'] as String?,
        roles: json['roles'].cast<String>(),
        credits: json['credits'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'roles': roles,
        'credits': credits,
      };
}
