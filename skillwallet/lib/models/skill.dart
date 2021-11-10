class Skill {
  String? name;
  int? value;

  Skill({this.name, this.value});

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        name: json['name'] as String?,
        value: json['value'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'value': value,
      };
}
