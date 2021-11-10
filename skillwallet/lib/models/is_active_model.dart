class IsActiveModel {
  bool? isActive;

  IsActiveModel({this.isActive});

  factory IsActiveModel.fromJson(Map<String, dynamic> json) => IsActiveModel(
        isActive: json['isActive'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'isActive': isActive,
      };
}
