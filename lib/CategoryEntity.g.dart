// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CategoryEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryEntity _$CategoryEntityFromJson(Map<String, dynamic> json) {
  return new CategoryEntity(json['name'] as String, json['url'] as String);
}

abstract class _$CategoryEntitySerializerMixin {
  String get name;
  String get url;
  Map<String, dynamic> toJson() => <String, dynamic>{'name': name, 'url': url};
}
