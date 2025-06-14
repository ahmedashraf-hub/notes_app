import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveType(typeId: 0)
  final String title;
  @HiveType(typeId: 1)
  final String subTitle;
  @HiveType(typeId: 2)
  final String data;
  @HiveType(typeId: 3)
  final int color;

  NoteModel({
    required this.title,
    required this.subTitle,
    required this.data,
    required this.color,
  });
}
