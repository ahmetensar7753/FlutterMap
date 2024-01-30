import 'dart:convert';

Station stationFromJson(String str) => Station.fromJson(json.decode(str));

String stationToJson(Station data) => json.encode(data.toJson());

class Station {
  int id;
  String chargePointId;
  String name;
  String imageLink;
  String country;
  String city;
  String district;
  String neighborhood;
  String addressDetail;
  double latitude;
  double longitude;
  int commentCount;
  double reviewStar;
  String stationType;
  String about;
  List<ClosestPlacement> closestPlacements;
  List<Connector> connectors;

  Station({
    required this.id,
    required this.chargePointId,
    required this.name,
    required this.imageLink,
    required this.country,
    required this.city,
    required this.district,
    required this.neighborhood,
    required this.addressDetail,
    required this.latitude,
    required this.longitude,
    required this.commentCount,
    required this.reviewStar,
    required this.stationType,
    required this.about,
    required this.closestPlacements,
    required this.connectors,
  });

  factory Station.fromJson(Map<String, dynamic> json) => Station(
        id: json["id"],
        chargePointId: json["chargePointId"],
        name: json["name"],
        imageLink: json["imageLink"],
        country: json["country"],
        city: json["city"],
        district: json["district"],
        neighborhood: json["neighborhood"],
        addressDetail: json["addressDetail"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        commentCount: json["commentCount"],
        reviewStar: json["reviewStar"]?.toDouble(),
        stationType: json["stationType"],
        about: json["about"],
        closestPlacements: List<ClosestPlacement>.from(
            json["closestPlacements"].map((x) => ClosestPlacement.fromJson(x))),
        connectors: List<Connector>.from(
            json["connectors"].map((x) => Connector.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "chargePointId": chargePointId,
        "name": name,
        "imageLink": imageLink,
        "country": country,
        "city": city,
        "district": district,
        "neighborhood": neighborhood,
        "addressDetail": addressDetail,
        "latitude": latitude,
        "longitude": longitude,
        "commentCount": commentCount,
        "reviewStar": reviewStar,
        "stationType": stationType,
        "about": about,
        "closestPlacements":
            List<dynamic>.from(closestPlacements.map((x) => x.toJson())),
        "connectors": List<dynamic>.from(connectors.map((x) => x.toJson())),
      };

  String isAvailable() {
    String state = '';
    for (Connector connector in connectors) {
      if (connector.status == 'Available' || connector.status == 'Finishing') {
        state = 'Available';
      }
    }
    // If there is no available connector, a check is made to see if there is a reservation.
    if (state.isEmpty) {
      for (Connector connector in connectors) {
        if (connector.status == 'Unavailable') {
          state = 'Unavailable';
        }
      }
    }

    return state;
  }
}

class ClosestPlacement {
  int id;
  String name;

  ClosestPlacement({
    required this.id,
    required this.name,
  });

  factory ClosestPlacement.fromJson(Map<String, dynamic> json) =>
      ClosestPlacement(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Connector {
  int id;
  int connectorId;
  String socketTypeId;
  int power;
  String status;

  Connector({
    required this.id,
    required this.connectorId,
    required this.socketTypeId,
    required this.power,
    required this.status,
  });

  factory Connector.fromJson(Map<String, dynamic> json) => Connector(
        id: json["id"],
        connectorId: json["connectorId"],
        socketTypeId: json["socketTypeId"],
        power: json["power"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "connectorId": connectorId,
        "socketTypeId": socketTypeId,
        "power": power,
        "status": status,
      };
}
