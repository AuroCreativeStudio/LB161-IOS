import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BlogsMasonicEducationRecord extends FirestoreRecord {
  BlogsMasonicEducationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _image = snapshotData['image'] as String?;
    _category = snapshotData['category'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('blogs_masonic_education');

  static Stream<BlogsMasonicEducationRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => BlogsMasonicEducationRecord.fromSnapshot(s));

  static Future<BlogsMasonicEducationRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => BlogsMasonicEducationRecord.fromSnapshot(s));

  static BlogsMasonicEducationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BlogsMasonicEducationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BlogsMasonicEducationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BlogsMasonicEducationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BlogsMasonicEducationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BlogsMasonicEducationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBlogsMasonicEducationRecordData({
  String? title,
  String? description,
  String? image,
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'image': image,
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class BlogsMasonicEducationRecordDocumentEquality
    implements Equality<BlogsMasonicEducationRecord> {
  const BlogsMasonicEducationRecordDocumentEquality();

  @override
  bool equals(
      BlogsMasonicEducationRecord? e1, BlogsMasonicEducationRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.image == e2?.image &&
        e1?.category == e2?.category;
  }

  @override
  int hash(BlogsMasonicEducationRecord? e) => const ListEquality()
      .hash([e?.title, e?.description, e?.image, e?.category]);

  @override
  bool isValidKey(Object? o) => o is BlogsMasonicEducationRecord;
}
