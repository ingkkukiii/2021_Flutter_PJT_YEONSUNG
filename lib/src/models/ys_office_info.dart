import 'package:equatable/equatable.dart';

class OfficeInfo extends Equatable {
  final String? uid;
  final String? name;
  final String? parentGroup;
  final String? teacher;
  final String? location;
  final String? number;
  final String? officeUrl;
  final String? instagram;
  final String? youtube;
  bool isFavorite;

  OfficeInfo({
    this.uid,
    this.name,
    this.parentGroup,
    this.teacher,
    this.location,
    this.number,
    this.officeUrl,
    this.instagram,
    this.youtube,
    this.isFavorite = false,
  });

  OfficeInfo.fromJson(Map<String, dynamic> map)
      : this(
          uid: map['uid'],
          name: map['name'],
          parentGroup: map['parentGroup'],
          teacher: map['teacher'],
          location: map['location'],
          number: map['number'],
          officeUrl: map['officeUrl'],
          instagram: map['instagram'],
          youtube: map['youtube'],
          isFavorite: map['isFavorite'] ?? false,
        );

  @override
  List<Object?> get props => [
        uid,
        name,
        parentGroup,
        teacher,
        location,
        number,
        officeUrl,
        instagram,
        youtube
      ];

  void setFavorite(bool isFavorite) {
    this.isFavorite = isFavorite;
  }
}
