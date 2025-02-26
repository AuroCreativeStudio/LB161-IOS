import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MinutesRecord extends FirestoreRecord {
  MinutesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "document" field.
  String? _document;
  String get document => _document ?? '';
  bool hasDocument() => _document != null;

  // "files" field.
  String? _files;
  String get files => _files ?? '';
  bool hasFiles() => _files != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _document = snapshotData['document'] as String?;
    _files = snapshotData['files'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('minutes');

  static Stream<MinutesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MinutesRecord.fromSnapshot(s));

  static Future<MinutesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MinutesRecord.fromSnapshot(s));

  static MinutesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MinutesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MinutesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MinutesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MinutesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MinutesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMinutesRecordData({
  String? title,
  DateTime? time,
  String? document,
  String? files,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'time': time,
      'document': document,
      'files': files,
      'userRef': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class MinutesRecordDocumentEquality implements Equality<MinutesRecord> {
  const MinutesRecordDocumentEquality();

  @override
  bool equals(MinutesRecord? e1, MinutesRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.time == e2?.time &&
        e1?.document == e2?.document &&
        e1?.files == e2?.files &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(MinutesRecord? e) => const ListEquality()
      .hash([e?.title, e?.time, e?.document, e?.files, e?.userRef]);

  @override
  bool isValidKey(Object? o) => o is MinutesRecord;
}
