// To parse this JSON data, do
//
//     final customerJson = customerJsonFromJson(jsonString);

import 'dart:convert';

Map<String, CustomerJson> customerJsonFromJson(String str) =>
    Map.from(json.decode(str)).map(
        (k, v) => MapEntry<String, CustomerJson>(k, CustomerJson.fromJson(v)));

String customerJsonToJson(Map<String, CustomerJson> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class CustomerJson {
  String name;
  int phonenumber;
  Map<String, Datum> data;

  CustomerJson({
    this.name,
    this.phonenumber,
    this.data,
  });

  factory CustomerJson.fromJson(Map<String, dynamic> json) => CustomerJson(
        name: json["name"],
        phonenumber: json["phonenumber"],
        data: Map.from(json["data"])
            .map((k, v) => MapEntry<String, Datum>(k, Datum.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phonenumber": phonenumber,
        "data": Map.from(data)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Datum {
  int gave;
  int got;
  int status;
  Datum({
    this.gave,
    this.got,
    this.status,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        gave: json["gave"],
        got: json["got"],
        status: json["status"]
      );

  Map<String, dynamic> toJson() => {
        "gave": gave,
        "got": got,
        "status":status
      };
}
