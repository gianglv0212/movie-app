// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'list_cart_user.g.dart';

@JsonSerializable()
class User {
  @JsonKey()
  final int? id;
  @JsonKey()
  final List<Cast>? cast;
  @JsonKey()
  final List<Cast>? crew;

  User({
    this.id,
    this.cast,
    this.crew,
  });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Cast {
  @JsonKey()
  final bool? adult;
  @JsonKey()
  final int? gender;
  @JsonKey()
  final int? id;
  @JsonKey(name: "known_for_department")
  final String? knownForDepartment;
  @JsonKey()
  final String? name;
  @JsonKey(name: "original_name")
  final String? originalName;
  @JsonKey()
  final double? popularity;
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  @JsonKey(name: "cast_id")
  final int? castId;
  @JsonKey()
  final String? character;
  @JsonKey(name: "credit_id")
  final String? creditId;
  @JsonKey()
  final int? order;
  @JsonKey()
  final String? department;
  @JsonKey()
  final String? job;

  Cast({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
    this.department,
    this.job,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
  Map<String, dynamic> toJson() => _$CastToJson(this);
}

enum Department {
  ACTING,
  PRODUCTION,
  EDITING,
  WRITING,
  SOUND,
  DIRECTING,
  CAMERA,
  COSTUME_MAKE_UP,
  ART,
  CREW,
  VISUAL_EFFECTS,
  LIGHTING
}

final departmentValues = EnumValues({
  "Acting": Department.ACTING,
  "Art": Department.ART,
  "Camera": Department.CAMERA,
  "Costume & Make-Up": Department.COSTUME_MAKE_UP,
  "Crew": Department.CREW,
  "Directing": Department.DIRECTING,
  "Editing": Department.EDITING,
  "Lighting": Department.LIGHTING,
  "Production": Department.PRODUCTION,
  "Sound": Department.SOUND,
  "Visual Effects": Department.VISUAL_EFFECTS,
  "Writing": Department.WRITING
});

extension DepartmentExtension on Department {
  String get stringValue {
    switch (this) {
      case Department.ACTING:
        return "Acting";
      case Department.PRODUCTION:
        return "Production";
      case Department.EDITING:
        return "Editing";
      case Department.WRITING:
        return "Writing";
      case Department.SOUND:
        return "Sound";
      case Department.DIRECTING:
        return "Directing";
      case Department.CAMERA:
        return "Camera";
      case Department.COSTUME_MAKE_UP:
        return "Costume/Make-up";
      case Department.ART:
        return "Art";
      case Department.CREW:
        return "Crew";
      case Department.VISUAL_EFFECTS:
        return "Visual Effects";
      case Department.LIGHTING:
        return "Lighting";
      default:
        return "";
    }
  }
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
