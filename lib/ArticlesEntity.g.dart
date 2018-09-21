// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ArticlesEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticlesEntity _$ArticlesEntityFromJson(Map<String, dynamic> json) {
  return new ArticlesEntity(
      json['guid'] as String,
      json['category'] as String,
      json['create_date'] as String,
      json['description'] as String,
      json['link'] as String,
      json['modify_date'] as String,
      json['pubDate'] as String,
      json['published'] as String,
      json['rss_link'] as String,
      json['rss_published'] as String,
      json['rss_title'] as String,
      json['title'] as String);
}

abstract class _$ArticlesEntitySerializerMixin {
  String get guid;
  String get category;
  String get create_date;
  String get description;
  String get link;
  String get modify_date;
  String get pubDate;
  String get published;
  String get rss_link;
  String get rss_published;
  String get rss_title;
  String get title;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'guid': guid,
        'category': category,
        'create_date': create_date,
        'description': description,
        'link': link,
        'modify_date': modify_date,
        'pubDate': pubDate,
        'published': published,
        'rss_link': rss_link,
        'rss_published': rss_published,
        'rss_title': rss_title,
        'title': title
      };
}
