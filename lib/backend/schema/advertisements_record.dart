import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdvertisementsRecord extends FirestoreRecord {
  AdvertisementsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "contentType" field.
  String? _contentType;
  String get contentType => _contentType ?? '';
  bool hasContentType() => _contentType != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "promoLink" field.
  String? _promoLink;
  String get promoLink => _promoLink ?? '';
  bool hasPromoLink() => _promoLink != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "planet" field.
  String? _planet;
  String get planet => _planet ?? '';
  bool hasPlanet() => _planet != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "region" field.
  String? _region;
  String get region => _region ?? '';
  bool hasRegion() => _region != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "adActive" field.
  bool? _adActive;
  bool get adActive => _adActive ?? false;
  bool hasAdActive() => _adActive != null;

  // "priorityPlacement" field.
  bool? _priorityPlacement;
  bool get priorityPlacement => _priorityPlacement ?? false;
  bool hasPriorityPlacement() => _priorityPlacement != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  bool hasDuration() => _duration != null;

  // "createdRole" field.
  String? _createdRole;
  String get createdRole => _createdRole ?? '';
  bool hasCreatedRole() => _createdRole != null;

  // "adsPhoto" field.
  String? _adsPhoto;
  String get adsPhoto => _adsPhoto ?? '';
  bool hasAdsPhoto() => _adsPhoto != null;

  // "adsVideo" field.
  String? _adsVideo;
  String get adsVideo => _adsVideo ?? '';
  bool hasAdsVideo() => _adsVideo != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  void _initializeFields() {
    _contentType = snapshotData['contentType'] as String?;
    _description = snapshotData['description'] as String?;
    _promoLink = snapshotData['promoLink'] as String?;
    _category = snapshotData['category'] as String?;
    _planet = snapshotData['planet'] as String?;
    _country = snapshotData['country'] as String?;
    _region = snapshotData['region'] as String?;
    _city = snapshotData['city'] as String?;
    _adActive = snapshotData['adActive'] as bool?;
    _priorityPlacement = snapshotData['priorityPlacement'] as bool?;
    _duration = castToType<int>(snapshotData['duration']);
    _createdRole = snapshotData['createdRole'] as String?;
    _adsPhoto = snapshotData['adsPhoto'] as String?;
    _adsVideo = snapshotData['adsVideo'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('advertisements');

  static Stream<AdvertisementsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdvertisementsRecord.fromSnapshot(s));

  static Future<AdvertisementsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdvertisementsRecord.fromSnapshot(s));

  static AdvertisementsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdvertisementsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdvertisementsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdvertisementsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdvertisementsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdvertisementsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdvertisementsRecordData({
  String? contentType,
  String? description,
  String? promoLink,
  String? category,
  String? planet,
  String? country,
  String? region,
  String? city,
  bool? adActive,
  bool? priorityPlacement,
  int? duration,
  String? createdRole,
  String? adsPhoto,
  String? adsVideo,
  DateTime? createdAt,
  DocumentReference? createdBy,
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'contentType': contentType,
      'description': description,
      'promoLink': promoLink,
      'category': category,
      'planet': planet,
      'country': country,
      'region': region,
      'city': city,
      'adActive': adActive,
      'priorityPlacement': priorityPlacement,
      'duration': duration,
      'createdRole': createdRole,
      'adsPhoto': adsPhoto,
      'adsVideo': adsVideo,
      'createdAt': createdAt,
      'createdBy': createdBy,
      'title': title,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdvertisementsRecordDocumentEquality
    implements Equality<AdvertisementsRecord> {
  const AdvertisementsRecordDocumentEquality();

  @override
  bool equals(AdvertisementsRecord? e1, AdvertisementsRecord? e2) {
    return e1?.contentType == e2?.contentType &&
        e1?.description == e2?.description &&
        e1?.promoLink == e2?.promoLink &&
        e1?.category == e2?.category &&
        e1?.planet == e2?.planet &&
        e1?.country == e2?.country &&
        e1?.region == e2?.region &&
        e1?.city == e2?.city &&
        e1?.adActive == e2?.adActive &&
        e1?.priorityPlacement == e2?.priorityPlacement &&
        e1?.duration == e2?.duration &&
        e1?.createdRole == e2?.createdRole &&
        e1?.adsPhoto == e2?.adsPhoto &&
        e1?.adsVideo == e2?.adsVideo &&
        e1?.createdAt == e2?.createdAt &&
        e1?.createdBy == e2?.createdBy &&
        e1?.title == e2?.title;
  }

  @override
  int hash(AdvertisementsRecord? e) => const ListEquality().hash([
        e?.contentType,
        e?.description,
        e?.promoLink,
        e?.category,
        e?.planet,
        e?.country,
        e?.region,
        e?.city,
        e?.adActive,
        e?.priorityPlacement,
        e?.duration,
        e?.createdRole,
        e?.adsPhoto,
        e?.adsVideo,
        e?.createdAt,
        e?.createdBy,
        e?.title
      ]);

  @override
  bool isValidKey(Object? o) => o is AdvertisementsRecord;
}
