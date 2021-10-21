import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable(explicitToJson: true)
class Address {
  final String? city;
  final String? state;
  final String? zip;

  Address(this.city, this.state, this.zip);
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
  @override
  String toString() {
    return "Address: City ${this.city}, State ${this.state}, zip ${this.zip}";
  }
}
