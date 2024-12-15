import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BusinessOwnerRecord extends FirestoreRecord {
  BusinessOwnerRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "companyName" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

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

  // "businessAddress" field.
  String? _businessAddress;
  String get businessAddress => _businessAddress ?? '';
  bool hasBusinessAddress() => _businessAddress != null;

  // "businessDocument" field.
  String? _businessDocument;
  String get businessDocument => _businessDocument ?? '';
  bool hasBusinessDocument() => _businessDocument != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "media" field.
  List<String>? _media;
  List<String> get media => _media ?? const [];
  bool hasMedia() => _media != null;

  // "companyUsername" field.
  String? _companyUsername;
  String get companyUsername => _companyUsername ?? '';
  bool hasCompanyUsername() => _companyUsername != null;

  // "profile_url" field.
  String? _profileUrl;
  String get profileUrl => _profileUrl ?? '';
  bool hasProfileUrl() => _profileUrl != null;

  // "followers" field.
  List<DocumentReference>? _followers;
  List<DocumentReference> get followers => _followers ?? const [];
  bool hasFollowers() => _followers != null;

  // "following" field.
  List<DocumentReference>? _following;
  List<DocumentReference> get following => _following ?? const [];
  bool hasFollowing() => _following != null;

  // "businessNumber" field.
  String? _businessNumber;
  String get businessNumber => _businessNumber ?? '';
  bool hasBusinessNumber() => _businessNumber != null;

  void _initializeFields() {
    _companyName = snapshotData['companyName'] as String?;
    _planet = snapshotData['planet'] as String?;
    _country = snapshotData['country'] as String?;
    _region = snapshotData['region'] as String?;
    _city = snapshotData['city'] as String?;
    _businessAddress = snapshotData['businessAddress'] as String?;
    _businessDocument = snapshotData['businessDocument'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _media = getDataList(snapshotData['media']);
    _companyUsername = snapshotData['companyUsername'] as String?;
    _profileUrl = snapshotData['profile_url'] as String?;
    _followers = getDataList(snapshotData['followers']);
    _following = getDataList(snapshotData['following']);
    _businessNumber = snapshotData['businessNumber'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('businessOwner');

  static Stream<BusinessOwnerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BusinessOwnerRecord.fromSnapshot(s));

  static Future<BusinessOwnerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BusinessOwnerRecord.fromSnapshot(s));

  static BusinessOwnerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BusinessOwnerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BusinessOwnerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BusinessOwnerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BusinessOwnerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BusinessOwnerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBusinessOwnerRecordData({
  String? companyName,
  String? planet,
  String? country,
  String? region,
  String? city,
  String? businessAddress,
  String? businessDocument,
  DocumentReference? userRef,
  String? companyUsername,
  String? profileUrl,
  String? businessNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'companyName': companyName,
      'planet': planet,
      'country': country,
      'region': region,
      'city': city,
      'businessAddress': businessAddress,
      'businessDocument': businessDocument,
      'userRef': userRef,
      'companyUsername': companyUsername,
      'profile_url': profileUrl,
      'businessNumber': businessNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class BusinessOwnerRecordDocumentEquality
    implements Equality<BusinessOwnerRecord> {
  const BusinessOwnerRecordDocumentEquality();

  @override
  bool equals(BusinessOwnerRecord? e1, BusinessOwnerRecord? e2) {
    const listEquality = ListEquality();
    return e1?.companyName == e2?.companyName &&
        e1?.planet == e2?.planet &&
        e1?.country == e2?.country &&
        e1?.region == e2?.region &&
        e1?.city == e2?.city &&
        e1?.businessAddress == e2?.businessAddress &&
        e1?.businessDocument == e2?.businessDocument &&
        e1?.userRef == e2?.userRef &&
        listEquality.equals(e1?.media, e2?.media) &&
        e1?.companyUsername == e2?.companyUsername &&
        e1?.profileUrl == e2?.profileUrl &&
        listEquality.equals(e1?.followers, e2?.followers) &&
        listEquality.equals(e1?.following, e2?.following) &&
        e1?.businessNumber == e2?.businessNumber;
  }

  @override
  int hash(BusinessOwnerRecord? e) => const ListEquality().hash([
        e?.companyName,
        e?.planet,
        e?.country,
        e?.region,
        e?.city,
        e?.businessAddress,
        e?.businessDocument,
        e?.userRef,
        e?.media,
        e?.companyUsername,
        e?.profileUrl,
        e?.followers,
        e?.following,
        e?.businessNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is BusinessOwnerRecord;
}
