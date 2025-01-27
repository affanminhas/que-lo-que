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

  // "astrologicalSign" field.
  String? _astrologicalSign;
  String get astrologicalSign => _astrologicalSign ?? '';
  bool hasAstrologicalSign() => _astrologicalSign != null;

  // "followers" field.
  List<DocumentReference>? _followers;
  List<DocumentReference> get followers => _followers ?? const [];
  bool hasFollowers() => _followers != null;

  // "following" field.
  List<DocumentReference>? _following;
  List<DocumentReference> get following => _following ?? const [];
  bool hasFollowing() => _following != null;

  // "friends" field.
  List<DocumentReference>? _friends;
  List<DocumentReference> get friends => _friends ?? const [];
  bool hasFriends() => _friends != null;

  // "friendRequests" field.
  List<DocumentReference>? _friendRequests;
  List<DocumentReference> get friendRequests => _friendRequests ?? const [];
  bool hasFriendRequests() => _friendRequests != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "blockedUsers" field.
  List<DocumentReference>? _blockedUsers;
  List<DocumentReference> get blockedUsers => _blockedUsers ?? const [];
  bool hasBlockedUsers() => _blockedUsers != null;

  // "mixedNationality" field.
  String? _mixedNationality;
  String get mixedNationality => _mixedNationality ?? '';
  bool hasMixedNationality() => _mixedNationality != null;

  // "glasses" field.
  String? _glasses;
  String get glasses => _glasses ?? '';
  bool hasGlasses() => _glasses != null;

  // "beard" field.
  String? _beard;
  String get beard => _beard ?? '';
  bool hasBeard() => _beard != null;

  // "mustache" field.
  String? _mustache;
  String get mustache => _mustache ?? '';
  bool hasMustache() => _mustache != null;

  // "lipThickness" field.
  String? _lipThickness;
  String get lipThickness => _lipThickness ?? '';
  bool hasLipThickness() => _lipThickness != null;

  // "bodyType" field.
  String? _bodyType;
  String get bodyType => _bodyType ?? '';
  bool hasBodyType() => _bodyType != null;

  // "disability" field.
  String? _disability;
  String get disability => _disability ?? '';
  bool hasDisability() => _disability != null;

  // "clothingStyle" field.
  List<String>? _clothingStyle;
  List<String> get clothingStyle => _clothingStyle ?? const [];
  bool hasClothingStyle() => _clothingStyle != null;

  // "personalValues" field.
  List<String>? _personalValues;
  List<String> get personalValues => _personalValues ?? const [];
  bool hasPersonalValues() => _personalValues != null;

  // "activity" field.
  String? _activity;
  String get activity => _activity ?? '';
  bool hasActivity() => _activity != null;

  // "musicType" field.
  String? _musicType;
  String get musicType => _musicType ?? '';
  bool hasMusicType() => _musicType != null;

  // "danceType" field.
  String? _danceType;
  String get danceType => _danceType ?? '';
  bool hasDanceType() => _danceType != null;

  // "agreeTermsOfUse" field.
  bool? _agreeTermsOfUse;
  bool get agreeTermsOfUse => _agreeTermsOfUse ?? false;
  bool hasAgreeTermsOfUse() => _agreeTermsOfUse != null;

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
    _astrologicalSign = snapshotData['astrologicalSign'] as String?;
    _followers = getDataList(snapshotData['followers']);
    _following = getDataList(snapshotData['following']);
    _friends = getDataList(snapshotData['friends']);
    _friendRequests = getDataList(snapshotData['friendRequests']);
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _blockedUsers = getDataList(snapshotData['blockedUsers']);
    _mixedNationality = snapshotData['mixedNationality'] as String?;
    _glasses = snapshotData['glasses'] as String?;
    _beard = snapshotData['beard'] as String?;
    _mustache = snapshotData['mustache'] as String?;
    _lipThickness = snapshotData['lipThickness'] as String?;
    _bodyType = snapshotData['bodyType'] as String?;
    _disability = snapshotData['disability'] as String?;
    _clothingStyle = getDataList(snapshotData['clothingStyle']);
    _personalValues = getDataList(snapshotData['personalValues']);
    _activity = snapshotData['activity'] as String?;
    _musicType = snapshotData['musicType'] as String?;
    _danceType = snapshotData['danceType'] as String?;
    _agreeTermsOfUse = snapshotData['agreeTermsOfUse'] as bool?;
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
  String? astrologicalSign,
  DateTime? createdAt,
  String? mixedNationality,
  String? glasses,
  String? beard,
  String? mustache,
  String? lipThickness,
  String? bodyType,
  String? disability,
  String? activity,
  String? musicType,
  String? danceType,
  bool? agreeTermsOfUse,
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
      'astrologicalSign': astrologicalSign,
      'createdAt': createdAt,
      'mixedNationality': mixedNationality,
      'glasses': glasses,
      'beard': beard,
      'mustache': mustache,
      'lipThickness': lipThickness,
      'bodyType': bodyType,
      'disability': disability,
      'activity': activity,
      'musicType': musicType,
      'danceType': danceType,
      'agreeTermsOfUse': agreeTermsOfUse,
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
        e1?.userRef == e2?.userRef &&
        e1?.astrologicalSign == e2?.astrologicalSign &&
        listEquality.equals(e1?.followers, e2?.followers) &&
        listEquality.equals(e1?.following, e2?.following) &&
        listEquality.equals(e1?.friends, e2?.friends) &&
        listEquality.equals(e1?.friendRequests, e2?.friendRequests) &&
        e1?.createdAt == e2?.createdAt &&
        listEquality.equals(e1?.blockedUsers, e2?.blockedUsers) &&
        e1?.mixedNationality == e2?.mixedNationality &&
        e1?.glasses == e2?.glasses &&
        e1?.beard == e2?.beard &&
        e1?.mustache == e2?.mustache &&
        e1?.lipThickness == e2?.lipThickness &&
        e1?.bodyType == e2?.bodyType &&
        e1?.disability == e2?.disability &&
        listEquality.equals(e1?.clothingStyle, e2?.clothingStyle) &&
        listEquality.equals(e1?.personalValues, e2?.personalValues) &&
        e1?.activity == e2?.activity &&
        e1?.musicType == e2?.musicType &&
        e1?.danceType == e2?.danceType &&
        e1?.agreeTermsOfUse == e2?.agreeTermsOfUse;
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
        e?.userRef,
        e?.astrologicalSign,
        e?.followers,
        e?.following,
        e?.friends,
        e?.friendRequests,
        e?.createdAt,
        e?.blockedUsers,
        e?.mixedNationality,
        e?.glasses,
        e?.beard,
        e?.mustache,
        e?.lipThickness,
        e?.bodyType,
        e?.disability,
        e?.clothingStyle,
        e?.personalValues,
        e?.activity,
        e?.musicType,
        e?.danceType,
        e?.agreeTermsOfUse
      ]);

  @override
  bool isValidKey(Object? o) => o is IndividualUserRecord;
}
