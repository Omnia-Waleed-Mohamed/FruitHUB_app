

import 'package:hive/hive.dart';

//نعمل جنريت لي ادبتر 
part 'user_entity.g.dart';

@HiveType(typeId: 0)
class UserEntity extends HiveObject {
  @HiveField(0)
   final String name; 
  @HiveField(1) 
  final String email;
  @HiveField(2)
  final String id;

  UserEntity({
    required this.name,
    required this.email,
    required this.id,
  });
  
}