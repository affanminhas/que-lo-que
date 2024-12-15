import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserActivityRecord extends FirestoreRecord {
  UserActivityRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

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

  // "activityAddress" field.
  String? _activityAddress;
  String get activityAddress => _activityAddress ?? '';
  bool hasActivityAddress() => _activityAddress != null;

  // "startDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "isFree" field.
  bool? _isFree;
  bool get isFree => _isFree ?? false;
  bool hasIsFree() => _isFree != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "privacy" field.
  String? _privacy;
  String get privacy => _privacy ?? '';
  bool hasPrivacy() => _privacy != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "locationLink" field.
  String? _locationLink;
  String get locationLink => _locationLink ?? '';
  bool hasLocationLink() => _locationLink != null;

  // "activityImage" field.
  String? _activityImage;
  String get activityImage => _activityImage ?? '';
  bool hasActivityImage() => _activityImage != null;

  // "activityVideo" field.
  String? _activityVideo;
  String get activityVideo => _activityVideo ?? '';
  bool hasActivityVideo() => _activityVideo != null;

  // "promoteActivity" field.
  bool? _promoteActivity;
  bool get promoteActivity => _promoteActivity ?? false;
  bool hasPromoteActivity() => _promoteActivity != null;

  // "noOfParticipants" field.
  int? _noOfParticipants;
  int get noOfParticipants => _noOfParticipants ?? 0;
  bool hasNoOfParticipants() => _noOfParticipants != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  void _initializeFields() {
    _planet = snapshotData['planet'] as String?;
    _country = snapshotData['country'] as String?;
    _region = snapshotData['region'] as String?;
    _city = snapshotData['city'] as String?;
    _activityAddress = snapshotData['activityAddress'] as String?;
    _startDate = snapshotData['startDate'] as DateTime?;
    _startTime = snapshotData['startTime'] as DateTime?;
    _isFree = snapshotData['isFree'] as bool?;
    _category = snapshotData['category'] as String?;
    _privacy = snapshotData['privacy'] as String?;
    _description = snapshotData['description'] as String?;
    _locationLink = snapshotData['locationLink'] as String?;
    _activityImage = snapshotData['activityImage'] as String?;
    _activityVideo = snapshotData['activityVideo'] as String?;
    _promoteActivity = snapshotData['promoteActivity'] as bool?;
    _noOfParticipants = castToType<int>(snapshotData['noOfParticipants']);
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _title = snapshotData['title'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userActivity');

  static Stream<UserActivityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserActivityRecord.fromSnapshot(s));

  static Future<UserActivityRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserActivityRecord.fromSnapshot(s));

  static UserActivityRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserActivityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserActivityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserActivityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserActivityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserActivityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserActivityRecordData({
  String? planet,
  String? country,
  String? region,
  String? city,
  String? activityAddress,
  DateTime? startDate,
  DateTime? startTime,
  bool? isFree,
  String? category,
  String? privacy,
  String? description,
  String? locationLink,
  String? activityImage,
  String? activityVideo,
  bool? promoteActivity,
  int? noOfParticipants,
  DocumentReference? createdBy,
  DateTime? createdAt,
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'planet': planet,
      'country': country,
      'region': region,
      'city': city,
      'activityAddress': activityAddress,
      'startDate': startDate,
      'startTime': startTime,
      'isFree': isFree,
      'category': category,
      'privacy': privacy,
      'description': description,
      'locationLink': locationLink,
      'activityImage': activityImage,
      'activityVideo': activityVideo,
      'promoteActivity': promoteActivity,
      'noOfParticipants': noOfParticipants,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'title': title,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserActivityRecordDocumentEquality
    implements Equality<UserActivityRecord> {
  const UserActivityRecordDocumentEquality();

  @override
  bool equals(UserActivityRecord? e1, UserActivityRecord? e2) {
    return e1?.planet == e2?.planet &&
        e1?.country == e2?.country &&
        e1?.region == e2?.region &&
        e1?.city == e2?.city &&
        e1?.activityAddress == e2?.activityAddress &&
        e1?.startDate == e2?.startDate &&
        e1?.startTime == e2?.startTime &&
        e1?.isFree == e2?.isFree &&
        e1?.category == e2?.category &&
        e1?.privacy == e2?.privacy &&
        e1?.description == e2?.description &&
        e1?.locationLink == e2?.locationLink &&
        e1?.activityImage == e2?.activityImage &&
        e1?.activityVideo == e2?.activityVideo &&
        e1?.promoteActivity == e2?.promoteActivity &&
        e1?.noOfParticipants == e2?.noOfParticipants &&
        e1?.createdBy == e2?.createdBy &&
        e1?.createdAt == e2?.createdAt &&
        e1?.title == e2?.title;
  }

  @override
  int hash(UserActivityRecord? e) => const ListEquality().hash([
        e?.planet,
        e?.country,
        e?.region,
        e?.city,
        e?.activityAddress,
        e?.startDate,
        e?.startTime,
        e?.isFree,
        e?.category,
        e?.privacy,
        e?.description,
        e?.locationLink,
        e?.activityImage,
        e?.activityVideo,
        e?.promoteActivity,
        e?.noOfParticipants,
        e?.createdBy,
        e?.createdAt,
        e?.title
      ]);

  @override
  bool isValidKey(Object? o) => o is UserActivityRecord;
}
