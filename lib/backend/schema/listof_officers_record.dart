import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListofOfficersRecord extends FirestoreRecord {
  ListofOfficersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "officers" field.
  String? _officers;
  String get officers => _officers ?? '';
  bool hasOfficers() => _officers != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _officers = snapshotData['officers'] as String?;
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ListofOfficers');

  static Stream<ListofOfficersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ListofOfficersRecord.fromSnapshot(s));

  static Future<ListofOfficersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ListofOfficersRecord.fromSnapshot(s));

  static ListofOfficersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ListofOfficersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ListofOfficersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ListofOfficersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ListofOfficersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ListofOfficersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createListofOfficersRecordData({
  String? officers,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'officers': officers,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class ListofOfficersRecordDocumentEquality
    implements Equality<ListofOfficersRecord> {
  const ListofOfficersRecordDocumentEquality();

  @override
  bool equals(ListofOfficersRecord? e1, ListofOfficersRecord? e2) {
    return e1?.officers == e2?.officers && e1?.name == e2?.name;
  }

  @override
  int hash(ListofOfficersRecord? e) =>
      const ListEquality().hash([e?.officers, e?.name]);

  @override
  bool isValidKey(Object? o) => o is ListofOfficersRecord;
}
