//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SyncAssetExifV1 {
  /// Returns a new [SyncAssetExifV1] instance.
  SyncAssetExifV1({
    required this.assetId,
    required this.city,
    required this.country,
    required this.dateTimeOriginal,
    required this.description,
    required this.exifImageHeight,
    required this.exifImageWidth,
    required this.exposureTime,
    required this.fNumber,
    required this.fileSizeInByte,
    required this.focalLength,
    required this.fps,
    required this.iso,
    required this.latitude,
    required this.lensModel,
    required this.longitude,
    required this.make,
    required this.model,
    required this.modifyDate,
    required this.orientation,
    required this.profileDescription,
    required this.projectionType,
    required this.rating,
    required this.state,
    required this.timeZone,
  });

  String assetId;

  String? city;

  String? country;

  DateTime? dateTimeOriginal;

  String? description;

  int? exifImageHeight;

  int? exifImageWidth;

  String? exposureTime;

  double? fNumber;

  int? fileSizeInByte;

  double? focalLength;

  double? fps;

  int? iso;

  double? latitude;

  String? lensModel;

  double? longitude;

  String? make;

  String? model;

  DateTime? modifyDate;

  String? orientation;

  String? profileDescription;

  String? projectionType;

  int? rating;

  String? state;

  String? timeZone;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SyncAssetExifV1 &&
    other.assetId == assetId &&
    other.city == city &&
    other.country == country &&
    other.dateTimeOriginal == dateTimeOriginal &&
    other.description == description &&
    other.exifImageHeight == exifImageHeight &&
    other.exifImageWidth == exifImageWidth &&
    other.exposureTime == exposureTime &&
    other.fNumber == fNumber &&
    other.fileSizeInByte == fileSizeInByte &&
    other.focalLength == focalLength &&
    other.fps == fps &&
    other.iso == iso &&
    other.latitude == latitude &&
    other.lensModel == lensModel &&
    other.longitude == longitude &&
    other.make == make &&
    other.model == model &&
    other.modifyDate == modifyDate &&
    other.orientation == orientation &&
    other.profileDescription == profileDescription &&
    other.projectionType == projectionType &&
    other.rating == rating &&
    other.state == state &&
    other.timeZone == timeZone;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (assetId.hashCode) +
    (city == null ? 0 : city!.hashCode) +
    (country == null ? 0 : country!.hashCode) +
    (dateTimeOriginal == null ? 0 : dateTimeOriginal!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (exifImageHeight == null ? 0 : exifImageHeight!.hashCode) +
    (exifImageWidth == null ? 0 : exifImageWidth!.hashCode) +
    (exposureTime == null ? 0 : exposureTime!.hashCode) +
    (fNumber == null ? 0 : fNumber!.hashCode) +
    (fileSizeInByte == null ? 0 : fileSizeInByte!.hashCode) +
    (focalLength == null ? 0 : focalLength!.hashCode) +
    (fps == null ? 0 : fps!.hashCode) +
    (iso == null ? 0 : iso!.hashCode) +
    (latitude == null ? 0 : latitude!.hashCode) +
    (lensModel == null ? 0 : lensModel!.hashCode) +
    (longitude == null ? 0 : longitude!.hashCode) +
    (make == null ? 0 : make!.hashCode) +
    (model == null ? 0 : model!.hashCode) +
    (modifyDate == null ? 0 : modifyDate!.hashCode) +
    (orientation == null ? 0 : orientation!.hashCode) +
    (profileDescription == null ? 0 : profileDescription!.hashCode) +
    (projectionType == null ? 0 : projectionType!.hashCode) +
    (rating == null ? 0 : rating!.hashCode) +
    (state == null ? 0 : state!.hashCode) +
    (timeZone == null ? 0 : timeZone!.hashCode);

  @override
  String toString() => 'SyncAssetExifV1[assetId=$assetId, city=$city, country=$country, dateTimeOriginal=$dateTimeOriginal, description=$description, exifImageHeight=$exifImageHeight, exifImageWidth=$exifImageWidth, exposureTime=$exposureTime, fNumber=$fNumber, fileSizeInByte=$fileSizeInByte, focalLength=$focalLength, fps=$fps, iso=$iso, latitude=$latitude, lensModel=$lensModel, longitude=$longitude, make=$make, model=$model, modifyDate=$modifyDate, orientation=$orientation, profileDescription=$profileDescription, projectionType=$projectionType, rating=$rating, state=$state, timeZone=$timeZone]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'assetId'] = this.assetId;
    if (this.city != null) {
      json[r'city'] = this.city;
    } else {
    //  json[r'city'] = null;
    }
    if (this.country != null) {
      json[r'country'] = this.country;
    } else {
    //  json[r'country'] = null;
    }
    if (this.dateTimeOriginal != null) {
      json[r'dateTimeOriginal'] = this.dateTimeOriginal!.toUtc().toIso8601String();
    } else {
    //  json[r'dateTimeOriginal'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
    //  json[r'description'] = null;
    }
    if (this.exifImageHeight != null) {
      json[r'exifImageHeight'] = this.exifImageHeight;
    } else {
    //  json[r'exifImageHeight'] = null;
    }
    if (this.exifImageWidth != null) {
      json[r'exifImageWidth'] = this.exifImageWidth;
    } else {
    //  json[r'exifImageWidth'] = null;
    }
    if (this.exposureTime != null) {
      json[r'exposureTime'] = this.exposureTime;
    } else {
    //  json[r'exposureTime'] = null;
    }
    if (this.fNumber != null) {
      json[r'fNumber'] = this.fNumber;
    } else {
    //  json[r'fNumber'] = null;
    }
    if (this.fileSizeInByte != null) {
      json[r'fileSizeInByte'] = this.fileSizeInByte;
    } else {
    //  json[r'fileSizeInByte'] = null;
    }
    if (this.focalLength != null) {
      json[r'focalLength'] = this.focalLength;
    } else {
    //  json[r'focalLength'] = null;
    }
    if (this.fps != null) {
      json[r'fps'] = this.fps;
    } else {
    //  json[r'fps'] = null;
    }
    if (this.iso != null) {
      json[r'iso'] = this.iso;
    } else {
    //  json[r'iso'] = null;
    }
    if (this.latitude != null) {
      json[r'latitude'] = this.latitude;
    } else {
    //  json[r'latitude'] = null;
    }
    if (this.lensModel != null) {
      json[r'lensModel'] = this.lensModel;
    } else {
    //  json[r'lensModel'] = null;
    }
    if (this.longitude != null) {
      json[r'longitude'] = this.longitude;
    } else {
    //  json[r'longitude'] = null;
    }
    if (this.make != null) {
      json[r'make'] = this.make;
    } else {
    //  json[r'make'] = null;
    }
    if (this.model != null) {
      json[r'model'] = this.model;
    } else {
    //  json[r'model'] = null;
    }
    if (this.modifyDate != null) {
      json[r'modifyDate'] = this.modifyDate!.toUtc().toIso8601String();
    } else {
    //  json[r'modifyDate'] = null;
    }
    if (this.orientation != null) {
      json[r'orientation'] = this.orientation;
    } else {
    //  json[r'orientation'] = null;
    }
    if (this.profileDescription != null) {
      json[r'profileDescription'] = this.profileDescription;
    } else {
    //  json[r'profileDescription'] = null;
    }
    if (this.projectionType != null) {
      json[r'projectionType'] = this.projectionType;
    } else {
    //  json[r'projectionType'] = null;
    }
    if (this.rating != null) {
      json[r'rating'] = this.rating;
    } else {
    //  json[r'rating'] = null;
    }
    if (this.state != null) {
      json[r'state'] = this.state;
    } else {
    //  json[r'state'] = null;
    }
    if (this.timeZone != null) {
      json[r'timeZone'] = this.timeZone;
    } else {
    //  json[r'timeZone'] = null;
    }
    return json;
  }

  /// Returns a new [SyncAssetExifV1] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SyncAssetExifV1? fromJson(dynamic value) {
    upgradeDto(value, "SyncAssetExifV1");
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      return SyncAssetExifV1(
        assetId: mapValueOfType<String>(json, r'assetId')!,
        city: mapValueOfType<String>(json, r'city'),
        country: mapValueOfType<String>(json, r'country'),
        dateTimeOriginal: mapDateTime(json, r'dateTimeOriginal', r''),
        description: mapValueOfType<String>(json, r'description'),
        exifImageHeight: mapValueOfType<int>(json, r'exifImageHeight'),
        exifImageWidth: mapValueOfType<int>(json, r'exifImageWidth'),
        exposureTime: mapValueOfType<String>(json, r'exposureTime'),
        fNumber: (mapValueOfType<num>(json, r'fNumber'))?.toDouble(),
        fileSizeInByte: mapValueOfType<int>(json, r'fileSizeInByte'),
        focalLength: (mapValueOfType<num>(json, r'focalLength'))?.toDouble(),
        fps: (mapValueOfType<num>(json, r'fps'))?.toDouble(),
        iso: mapValueOfType<int>(json, r'iso'),
        latitude: (mapValueOfType<num>(json, r'latitude'))?.toDouble(),
        lensModel: mapValueOfType<String>(json, r'lensModel'),
        longitude: (mapValueOfType<num>(json, r'longitude'))?.toDouble(),
        make: mapValueOfType<String>(json, r'make'),
        model: mapValueOfType<String>(json, r'model'),
        modifyDate: mapDateTime(json, r'modifyDate', r''),
        orientation: mapValueOfType<String>(json, r'orientation'),
        profileDescription: mapValueOfType<String>(json, r'profileDescription'),
        projectionType: mapValueOfType<String>(json, r'projectionType'),
        rating: mapValueOfType<int>(json, r'rating'),
        state: mapValueOfType<String>(json, r'state'),
        timeZone: mapValueOfType<String>(json, r'timeZone'),
      );
    }
    return null;
  }

  static List<SyncAssetExifV1> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SyncAssetExifV1>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SyncAssetExifV1.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SyncAssetExifV1> mapFromJson(dynamic json) {
    final map = <String, SyncAssetExifV1>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SyncAssetExifV1.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SyncAssetExifV1-objects as value to a dart map
  static Map<String, List<SyncAssetExifV1>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SyncAssetExifV1>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SyncAssetExifV1.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'assetId',
    'city',
    'country',
    'dateTimeOriginal',
    'description',
    'exifImageHeight',
    'exifImageWidth',
    'exposureTime',
    'fNumber',
    'fileSizeInByte',
    'focalLength',
    'fps',
    'iso',
    'latitude',
    'lensModel',
    'longitude',
    'make',
    'model',
    'modifyDate',
    'orientation',
    'profileDescription',
    'projectionType',
    'rating',
    'state',
    'timeZone',
  };
}

