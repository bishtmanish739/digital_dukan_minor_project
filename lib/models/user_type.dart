import 'package:hive_flutter/adapters.dart';

part 'user_type.g.dart';

@HiveType(typeId: 1)
enum UserType {
  @HiveField(0)
  owner,
  @HiveField(1)
  customer
}
