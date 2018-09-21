import 'package:json_annotation/json_annotation.dart';

/// This allows our `User` class to access private members in 
/// the generated file. The value for this is *.g.dart, where 
/// the star denotes the source file name.
part 'ArticlesEntity.g.dart';

/// An annotation for the code generator to know that this class needs the 
/// JSON serialization logic to be generated.
@JsonSerializable()
/// Every json_serializable class must have the serializer mixin. 
/// It makes the generated toJson() method to be usable for the class. 
/// The mixin's name follows the source class, in this case, User.
class ArticlesEntity extends Object with _$ArticlesEntitySerializerMixin{
  ArticlesEntity(
    this.guid,
    this.category,
    this.create_date,
    this.description,
    this.link,
    this.modify_date,
    this.pubDate,
    this.published,
    this.rss_link,
    this.rss_published,
    this.rss_title,
    this.title,
  );

  String guid;
  String category;
  String create_date;
  String description;
  String link;
  String modify_date;
  String pubDate;
  String published;
  String rss_link;
  String rss_published;
  String rss_title;
  String title;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. We pass the map to the generated _$UserFromJson constructor. 
  /// The constructor is named after the source class, in this case User.
  factory ArticlesEntity.fromJson(Map<String, dynamic> json) => _$ArticlesEntityFromJson(json);
}