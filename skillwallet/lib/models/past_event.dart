class PastEvent {
  String? title;
  List<String>? roles;
  int? credits;

  PastEvent({this.title, this.roles, this.credits});

  factory PastEvent.fromJson(Map<String, dynamic> json) => PastEvent(
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
