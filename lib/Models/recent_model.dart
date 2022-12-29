// ignore_for_file: unnecessary_this, prefer_collection_literals


class RecentPeoples {
  List<Faces>? faces;
  int? total;

  RecentPeoples({this.faces, this.total});

  RecentPeoples.fromJson(Map<String, dynamic> json) {
    if (json['faces'] != null) {
      faces = <Faces>[];
      json['faces'].forEach((v) {
        faces!.add(Faces.fromJson(v));
      });
    }
    total = json['total'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.faces != null) {
      data['faces'] = this.faces!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    return data;
  }
}

class Faces {
  String? id;
  String? version;
  List<Urls>? urls;
  Meta? meta;

  Faces({this.id, this.version, this.urls, this.meta});

  Faces.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    version = json['version'] ?? "";
    if (json['urls'] != null) {
      urls = <Urls>[];
      json['urls'].forEach((v) {
        urls!.add(Urls.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['version'] = this.version;
    if (this.urls != null) {
      data['urls'] = this.urls!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Urls {
  String? s32;
  String? s64;
  String? s128;
  String? s256;
  String? s512;

  Urls({this.s32, this.s64, this.s128, this.s256, this.s512});

  Urls.fromJson(Map<String, dynamic> json) {
    s32 = json['32'] ?? "";
    s64 = json['64'] ?? "";
    s128 = json['128'] ?? "";
    s256 = json['256'] ?? "";
    s512 = json['512'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['32'] = this.s32;
    data['64'] = this.s64;
    data['128'] = this.s128;
    data['256'] = this.s256;
    data['512'] = this.s512;
    return data;
  }
}

class Meta {
  double? confidence;
  List<String>? gender;
  List<String>? age;
  List<String>? ethnicity;
  List<String>? eyeColor;
  List<String>? hairColor;
  List<String>? hairLength;
  List<String>? emotion;

  Meta(
      {this.confidence,
      this.gender,
      this.age,
      this.ethnicity,
      this.eyeColor,
      this.hairColor,
      this.hairLength,
      this.emotion});

  Meta.fromJson(Map<String, dynamic> json) {
    confidence = json['confidence'] ?? 0;
    gender = json['gender'].cast<String>() ?? [];
    age = json['age'].cast<String>() ?? [];
    ethnicity = json['ethnicity'].cast<String>() ?? [];
    eyeColor = json['eye_color'].cast<String>() ?? [];
    hairColor = json['hair_color'].cast<String>() ?? [];
    hairLength = json['hair_length'].cast<String>() ?? [];
    emotion = json['emotion'].cast<String>() ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['confidence'] = this.confidence;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['ethnicity'] = this.ethnicity;
    data['eye_color'] = this.eyeColor;
    data['hair_color'] = this.hairColor;
    data['hair_length'] = this.hairLength;
    data['emotion'] = this.emotion;
    return data;
  }
}
