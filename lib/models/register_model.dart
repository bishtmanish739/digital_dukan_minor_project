import 'package:digital_dukan_minor_project/models/address.dart';
import 'package:digital_dukan_minor_project/models/user_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RegisterModel {
  final String? phoneNumber;
  final String? name;
  final String? password;
  String? shopName;
  String? upi;
  final Address? address;
  final UserType? type;

  RegisterModel.customer(
      this.phoneNumber, this.name, this.password, this.address, this.type);
  RegisterModel(this.phoneNumber, this.name, this.password, this.shopName,
      this.upi, this.address, this.type);
  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
