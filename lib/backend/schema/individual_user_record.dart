import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IndividualUserRecord extends FirestoreRecord {
  IndividualUserRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "firstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "profilePhoto" field.
  String? _profilePhoto;
  String get profilePhoto => _profilePhoto ?? '';
  bool hasProfilePhoto() => _profilePhoto != null;

  // "faceBodyMedia" field.
  List<String>? _faceBodyMedia;
  List<String> get faceBodyMedia => _faceBodyMedia ?? const [];
  bool hasFaceBodyMedia() => _faceBodyMedia != null;

  // "nationality" field.
  String? _nationality;
  String get nationality => _nationality ?? '';
  bool hasNationality() => _nationality != null;

  // "height" field.
  String? _height;
  String get height => _height ?? '';
  bool hasHeight() => _height != null;

  // "weight" field.
  String? _weight;
  String get weight => _weight ?? '';
  bool hasWeight() => _weight != null;

  // "ethinicity" field.
  String? _ethinicity;
  String get ethinicity => _ethinicity ?? '';
  bool hasEthinicity() => _ethinicity != null;

  // "eyeColor" field.
  String? _eyeColor;
  String get eyeColor => _eyeColor ?? '';
  bool hasEyeColor() => _eyeColor != null;

  // "hairColor" field.
  String? _hairColor;
  String get hairColor => _hairColor ?? '';
  bool hasHairColor() => _hairColor != null;

  // "hairStyle" field.
  String? _hairStyle;
  String get hairStyle => _hairStyle ?? '';
  bool hasHairStyle() => _hairStyle != null;

  // "planet" field.
  String? _planet;
  String get planet => _planet ?? '';
  bool hasPlanet() => _planet != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  bool hasLanguage() => _language != null;

  // "religion" field.
  String? _religion;
  String get religion => _religion ?? '';
  bool hasReligion() => _religion != null;

  // "socialLinks" field.
  List<String>? _socialLinks;
  List<String> get socialLinks => _socialLinks ?? const [];
  bool hasSocialLinks() => _socialLinks != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "privateProfile" field.
  bool? _privateProfile;
  bool get privateProfile => _privateProfile ?? false;
  bool hasPrivateProfile() => _privateProfile != null;

  // "hideFriends" field.
  bool? _hideFriends;
  bool get hideFriends => _hideFriends ?? false;
  bool hasHideFriends() => _hideFriends != null;

  // "relationship" field.
  String? _relationship;
  String get relationship => _relationship ?? '';
  bool hasRelationship() => _relationship != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "drivingLicense" field.
  bool? _drivingLicense;
  bool get drivingLicense => _drivingLicense ?? false;
  bool hasDrivingLicense() => _drivingLicense != null;

  // "occupation" field.
  String? _occupation;
  String get occupation => _occupation ?? '';
  bool hasOccupation() => _occupation != null;

  // "tattoo" field.
  String? _tattoo;
  String get tattoo => _tattoo ?? '';
  bool hasTattoo() => _tattoo != null;

  // "birthday" field.
  String? _birthday;
  String get birthday => _birthday ?? '';
  bool hasBirthday() => _birthday != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _username = snapshotData['username'] as String?;
    _firstName = snapshotData['firstName'] as String?;
    _lastName = snapshotData['lastName'] as String?;
    _gender = snapshotData['gender'] as String?;
    _profilePhoto = snapshotData['profilePhoto'] as String?;
    _faceBodyMedia = getDataList(snapshotData['faceBodyMedia']);
    _nationality = snapshotData['nationality'] as String?;
    _height = snapshotData['height'] as String?;
    _weight = snapshotData['weight'] as String?;
    _ethinicity = snapshotData['ethinicity'] as String?;
    _eyeColor = snapshotData['eyeColor'] as String?;
    _hairColor = snapshotData['hairColor'] as String?;
    _hairStyle = snapshotData['hairStyle'] as String?;
    _planet = snapshotData['planet'] as String?;
    _location = snapshotData['location'] as String?;
    _address = snapshotData['address'] as String?;
    _language = snapshotData['language'] as String?;
    _religion = snapshotData['religion'] as String?;
    _socialLinks = getDataList(snapshotData['socialLinks']);
    _description = snapshotData['description'] as String?;
    _privateProfile = snapshotData['privateProfile'] as bool?;
    _hideFriends = snapshotData['hideFriends'] as bool?;
    _relationship = snapshotData['relationship'] as String?;
    _status = snapshotData['status'] as String?;
    _drivingLicense = snapshotData['drivingLicense'] as bool?;
    _occupation = snapshotData['occupation'] as String?;
    _tattoo = snapshotData['tattoo'] as String?;
    _birthday = snapshotData['birthday'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('individualUser');

  static Stream<IndividualUserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IndividualUserRecord.fromSnapshot(s));

  static Future<IndividualUserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IndividualUserRecord.fromSnapshot(s));

  static IndividualUserRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IndividualUserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IndividualUserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IndividualUserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IndividualUserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IndividualUserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIndividualUserRecordData({
  String? username,
  String? firstName,
  String? lastName,
  String? gender,
  String? profilePhoto,
  String? nationality,
  String? height,
  String? weight,
  String? ethinicity,
  String? eyeColor,
  String? hairColor,
  String? hairStyle,
  String? planet,
  String? location,
  String? address,
  String? language,
  String? religion,
  String? description,
  bool? privateProfile,
  bool? hideFriends,
  String? relationship,
  String? status,
  bool? drivingLicense,
  String? occupation,
  String? tattoo,
  String? birthday,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'profilePhoto': profilePhoto,
      'nationality': nationality,
      'height': height,
      'weight': weight,
      'ethinicity': ethinicity,
      'eyeColor': eyeColor,
      'hairColor': hairColor,
      'hairStyle': hairStyle,
      'planet': planet,
      'location': location,
      'address': address,
      'language': language,
      'religion': religion,
      'description': description,
      'privateProfile': privateProfile,
      'hideFriends': hideFriends,
      'relationship': relationship,
      'status': status,
      'drivingLicense': drivingLicense,
      'occupation': occupation,
      'tattoo': tattoo,
      'birthday': birthday,
      'userRef': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class IndividualUserRecordDocumentEquality
    implements Equality<IndividualUserRecord> {
  const IndividualUserRecordDocumentEquality();

  @override
  bool equals(IndividualUserRecord? e1, IndividualUserRecord? e2) {
    const listEquality = ListEquality();
    return e1?.username == e2?.username &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.gender == e2?.gender &&
        e1?.profilePhoto == e2?.profilePhoto &&
        listEquality.equals(e1?.faceBodyMedia, e2?.faceBodyMedia) &&
        e1?.nationality == e2?.nationality &&
        e1?.height == e2?.height &&
        e1?.weight == e2?.weight &&
        e1?.ethinicity == e2?.ethinicity &&
        e1?.eyeColor == e2?.eyeColor &&
        e1?.hairColor == e2?.hairColor &&
        e1?.hairStyle == e2?.hairStyle &&
        e1?.planet == e2?.planet &&
        e1?.location == e2?.location &&
        e1?.address == e2?.address &&
        e1?.language == e2?.language &&
        e1?.religion == e2?.religion &&
        listEquality.equals(e1?.socialLinks, e2?.socialLinks) &&
        e1?.description == e2?.description &&
        e1?.privateProfile == e2?.privateProfile &&
        e1?.hideFriends == e2?.hideFriends &&
        e1?.relationship == e2?.relationship &&
        e1?.status == e2?.status &&
        e1?.drivingLicense == e2?.drivingLicense &&
        e1?.occupation == e2?.occupation &&
        e1?.tattoo == e2?.tattoo &&
        e1?.birthday == e2?.birthday &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(IndividualUserRecord? e) => const ListEquality().hash([
        e?.username,
        e?.firstName,
        e?.lastName,
        e?.gender,
        e?.profilePhoto,
        e?.faceBodyMedia,
        e?.nationality,
        e?.height,
        e?.weight,
        e?.ethinicity,
        e?.eyeColor,
        e?.hairColor,
        e?.hairStyle,
        e?.planet,
        e?.location,
        e?.address,
        e?.language,
        e?.religion,
        e?.socialLinks,
        e?.description,
        e?.privateProfile,
        e?.hideFriends,
        e?.relationship,
        e?.status,
        e?.drivingLicense,
        e?.occupation,
        e?.tattoo,
        e?.birthday,
        e?.userRef
      ]);

  @override
  bool isValidKey(Object? o) => o is IndividualUserRecord;
}
