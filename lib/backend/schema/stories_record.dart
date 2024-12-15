import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StoriesRecord extends FirestoreRecord {
  StoriesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('stories')
          : FirebaseFirestore.instance.collectionGroup('stories');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('stories').doc(id);

  static Stream<StoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StoriesRecord.fromSnapshot(s));

  static Future<StoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StoriesRecord.fromSnapshot(s));

  static StoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStoriesRecordData({
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class StoriesRecordDocumentEquality implements Equality<StoriesRecord> {
  const StoriesRecordDocumentEquality();

  @override
  bool equals(StoriesRecord? e1, StoriesRecord? e2) {
    return e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(StoriesRecord? e) => const ListEquality().hash([e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is StoriesRecord;
}
