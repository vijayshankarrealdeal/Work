class ModelSegment {
  ModelSegment({
    this.createOn,
    this.updatedOn,
    this.id,
    this.images,
    this.files,
    this.name,
    this.dayOfWeeksOpen,
    this.openTime,
    this.closeTime,
    this.slotTimeSize,
    this.costPerSlot,
    this.active,
    this.establishment,
    this.sports,
  });

  DateTime createOn;
  DateTime updatedOn;
  int id;
  List<String> images;
  dynamic files;
  String name;
  List<String> dayOfWeeksOpen;
  String openTime;
  String closeTime;
  int slotTimeSize;
  double costPerSlot;
  dynamic active;
  dynamic establishment;
  Sports sports;

  factory ModelSegment.fromJson(Map<String, dynamic> json) => ModelSegment(
        createOn:
            json["createOn"] != null ? DateTime.parse(json["createOn"]) : '',
        updatedOn:
            json["updatedOn"] != null ? DateTime.parse(json["updatedOn"]) : '',
        id: json["id"],
        images: json["images"] != null
            ? List<String>.from(json["images"].map((x) => x))
            : [],
        files: json["files"] != null ? json["files"] : '',
        name: json["name"] != null ? json["name"] : '',
        dayOfWeeksOpen: List<String>.from(json["dayOfWeeksOpen"].map((x) => x)),
        openTime: json["openTime"],
        closeTime: json["closeTime"],
        slotTimeSize: json["slotTimeSize"],
        costPerSlot: json["costPerSlot"],
        active: json["active"],
        establishment: json["establishment"],
        sports: Sports.fromJson(json["sports"]),
      );

  Map<String, dynamic> toJson() => {
        "createOn": createOn.toIso8601String(),
        "updatedOn": updatedOn.toIso8601String(),
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x)),
        "files": files,
        "name": name,
        "dayOfWeeksOpen": List<dynamic>.from(dayOfWeeksOpen.map((x) => x)),
        "openTime": openTime,
        "closeTime": closeTime,
        "slotTimeSize": slotTimeSize,
        "costPerSlot": costPerSlot,
        "active": active,
        "establishment": establishment,
        "sports": sports.toJson(),
      };
}

class Sports {
  Sports({
    this.createOn,
    this.updatedOn,
    this.id,
    this.name,
    this.iconWhiteUrl,
    this.iconBlackUrl,
  });

  dynamic createOn;
  dynamic updatedOn;
  int id;
  String name;
  String iconWhiteUrl;
  String iconBlackUrl;

  factory Sports.fromJson(Map<String, dynamic> json) => Sports(
        createOn: json["createOn"],
        updatedOn: json["updatedOn"],
        id: json["id"],
        name: json["name"],
        iconWhiteUrl: json["iconWhiteUrl"],
        iconBlackUrl: json["iconBlackUrl"],
      );

  Map<String, dynamic> toJson() => {
        "createOn": createOn,
        "updatedOn": updatedOn,
        "id": id,
        "name": name,
        "iconWhiteUrl": iconWhiteUrl,
        "iconBlackUrl": iconBlackUrl,
      };
}
