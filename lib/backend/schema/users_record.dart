import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "whatsapp_number" field.
  String? _whatsappNumber;
  String get whatsappNumber => _whatsappNumber ?? '';
  bool hasWhatsappNumber() => _whatsappNumber != null;

  // "catName" field.
  DocumentReference? _catName;
  DocumentReference? get catName => _catName;
  bool hasCatName() => _catName != null;

  // "jain" field.
  String? _jain;
  String get jain => _jain ?? '';
  bool hasJain() => _jain != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "user_city" field.
  String? _userCity;
  String get userCity => _userCity ?? '';
  bool hasUserCity() => _userCity != null;

  // "user_aboutUs" field.
  String? _userAboutUs;
  String get userAboutUs => _userAboutUs ?? '';
  bool hasUserAboutUs() => _userAboutUs != null;

  // "business" field.
  DocumentReference? _business;
  DocumentReference? get business => _business;
  bool hasBusiness() => _business != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "native_city" field.
  String? _nativeCity;
  String get nativeCity => _nativeCity ?? '';
  bool hasNativeCity() => _nativeCity != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "zip_code" field.
  String? _zipCode;
  String get zipCode => _zipCode ?? '';
  bool hasZipCode() => _zipCode != null;

  // "father_name" field.
  String? _fatherName;
  String get fatherName => _fatherName ?? '';
  bool hasFatherName() => _fatherName != null;

  // "mother_name" field.
  String? _motherName;
  String get motherName => _motherName ?? '';
  bool hasMotherName() => _motherName != null;

  // "blood_donor" field.
  String? _bloodDonor;
  String get bloodDonor => _bloodDonor ?? '';
  bool hasBloodDonor() => _bloodDonor != null;

  // "blood_group" field.
  String? _bloodGroup;
  String get bloodGroup => _bloodGroup ?? '';
  bool hasBloodGroup() => _bloodGroup != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "member_name" field.
  String? _memberName;
  String get memberName => _memberName ?? '';
  bool hasMemberName() => _memberName != null;

  // "reg_no" field.
  String? _regNo;
  String get regNo => _regNo ?? '';
  bool hasRegNo() => _regNo != null;

  // "rglsi_id" field.
  String? _rglsiId;
  String get rglsiId => _rglsiId ?? '';
  bool hasRglsiId() => _rglsiId != null;

  // "date_of_birth" field.
  String? _dateOfBirth;
  String get dateOfBirth => _dateOfBirth ?? '';
  bool hasDateOfBirth() => _dateOfBirth != null;

  // "master_year" field.
  String? _masterYear;
  String get masterYear => _masterYear ?? '';
  bool hasMasterYear() => _masterYear != null;

  // "rg_rank" field.
  String? _rgRank;
  String get rgRank => _rgRank ?? '';
  bool hasRgRank() => _rgRank != null;

  // "g_rank" field.
  String? _gRank;
  String get gRank => _gRank ?? '';
  bool hasGRank() => _gRank != null;

  // "subscription" field.
  String? _subscription;
  String get subscription => _subscription ?? '';
  bool hasSubscription() => _subscription != null;

  // "side_degrees" field.
  List<String>? _sideDegrees;
  List<String> get sideDegrees => _sideDegrees ?? const [];
  bool hasSideDegrees() => _sideDegrees != null;

  // "doi" field.
  String? _doi;
  String get doi => _doi ?? '';
  bool hasDoi() => _doi != null;

  // "dop" field.
  String? _dop;
  String get dop => _dop ?? '';
  bool hasDop() => _dop != null;

  // "dor" field.
  String? _dor;
  String get dor => _dor ?? '';
  bool hasDor() => _dor != null;

  // "chapter" field.
  DocumentReference? _chapter;
  DocumentReference? get chapter => _chapter;
  bool hasChapter() => _chapter != null;

  // "RAM" field.
  DocumentReference? _ram;
  DocumentReference? get ram => _ram;
  bool hasRam() => _ram != null;

  // "Conclave" field.
  DocumentReference? _conclave;
  DocumentReference? get conclave => _conclave;
  bool hasConclave() => _conclave != null;

  // "Mark" field.
  DocumentReference? _mark;
  DocumentReference? get mark => _mark;
  bool hasMark() => _mark != null;

  // "wedding_anniversary" field.
  String? _weddingAnniversary;
  String get weddingAnniversary => _weddingAnniversary ?? '';
  bool hasWeddingAnniversary() => _weddingAnniversary != null;

  // "spouse_name" field.
  String? _spouseName;
  String get spouseName => _spouseName ?? '';
  bool hasSpouseName() => _spouseName != null;

  // "children" field.
  String? _children;
  String get children => _children ?? '';
  bool hasChildren() => _children != null;

  // "userList" field.
  List<DocumentReference>? _userList;
  List<DocumentReference> get userList => _userList ?? const [];
  bool hasUserList() => _userList != null;

  // "spouse_dob" field.
  String? _spouseDob;
  String get spouseDob => _spouseDob ?? '';
  bool hasSpouseDob() => _spouseDob != null;

  // "spouse_bloodgroup" field.
  String? _spouseBloodgroup;
  String get spouseBloodgroup => _spouseBloodgroup ?? '';
  bool hasSpouseBloodgroup() => _spouseBloodgroup != null;

  // "children2" field.
  String? _children2;
  String get children2 => _children2 ?? '';
  bool hasChildren2() => _children2 != null;

  // "children3" field.
  String? _children3;
  String get children3 => _children3 ?? '';
  bool hasChildren3() => _children3 != null;

  // "user_status" field.
  bool? _userStatus;
  bool get userStatus => _userStatus ?? false;
  bool hasUserStatus() => _userStatus != null;

  // "subscription_status" field.
  bool? _subscriptionStatus;
  bool get subscriptionStatus => _subscriptionStatus ?? false;
  bool hasSubscriptionStatus() => _subscriptionStatus != null;

  // "donor_blood" field.
  bool? _donorBlood;
  bool get donorBlood => _donorBlood ?? false;
  bool hasDonorBlood() => _donorBlood != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _whatsappNumber = snapshotData['whatsapp_number'] as String?;
    _catName = snapshotData['catName'] as DocumentReference?;
    _jain = snapshotData['jain'] as String?;
    _address = snapshotData['address'] as String?;
    _userCity = snapshotData['user_city'] as String?;
    _userAboutUs = snapshotData['user_aboutUs'] as String?;
    _business = snapshotData['business'] as DocumentReference?;
    _lastName = snapshotData['last_name'] as String?;
    _nativeCity = snapshotData['native_city'] as String?;
    _country = snapshotData['country'] as String?;
    _zipCode = snapshotData['zip_code'] as String?;
    _fatherName = snapshotData['father_name'] as String?;
    _motherName = snapshotData['mother_name'] as String?;
    _bloodDonor = snapshotData['blood_donor'] as String?;
    _bloodGroup = snapshotData['blood_group'] as String?;
    _title = snapshotData['title'] as String?;
    _memberName = snapshotData['member_name'] as String?;
    _regNo = snapshotData['reg_no'] as String?;
    _rglsiId = snapshotData['rglsi_id'] as String?;
    _dateOfBirth = snapshotData['date_of_birth'] as String?;
    _masterYear = snapshotData['master_year'] as String?;
    _rgRank = snapshotData['rg_rank'] as String?;
    _gRank = snapshotData['g_rank'] as String?;
    _subscription = snapshotData['subscription'] as String?;
    _sideDegrees = getDataList(snapshotData['side_degrees']);
    _doi = snapshotData['doi'] as String?;
    _dop = snapshotData['dop'] as String?;
    _dor = snapshotData['dor'] as String?;
    _chapter = snapshotData['chapter'] as DocumentReference?;
    _ram = snapshotData['RAM'] as DocumentReference?;
    _conclave = snapshotData['Conclave'] as DocumentReference?;
    _mark = snapshotData['Mark'] as DocumentReference?;
    _weddingAnniversary = snapshotData['wedding_anniversary'] as String?;
    _spouseName = snapshotData['spouse_name'] as String?;
    _children = snapshotData['children'] as String?;
    _userList = getDataList(snapshotData['userList']);
    _spouseDob = snapshotData['spouse_dob'] as String?;
    _spouseBloodgroup = snapshotData['spouse_bloodgroup'] as String?;
    _children2 = snapshotData['children2'] as String?;
    _children3 = snapshotData['children3'] as String?;
    _userStatus = snapshotData['user_status'] as bool?;
    _subscriptionStatus = snapshotData['subscription_status'] as bool?;
    _donorBlood = snapshotData['donor_blood'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? whatsappNumber,
  DocumentReference? catName,
  String? jain,
  String? address,
  String? userCity,
  String? userAboutUs,
  DocumentReference? business,
  String? lastName,
  String? nativeCity,
  String? country,
  String? zipCode,
  String? fatherName,
  String? motherName,
  String? bloodDonor,
  String? bloodGroup,
  String? title,
  String? memberName,
  String? regNo,
  String? rglsiId,
  String? dateOfBirth,
  String? masterYear,
  String? rgRank,
  String? gRank,
  String? subscription,
  String? doi,
  String? dop,
  String? dor,
  DocumentReference? chapter,
  DocumentReference? ram,
  DocumentReference? conclave,
  DocumentReference? mark,
  String? weddingAnniversary,
  String? spouseName,
  String? children,
  String? spouseDob,
  String? spouseBloodgroup,
  String? children2,
  String? children3,
  bool? userStatus,
  bool? subscriptionStatus,
  bool? donorBlood,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'whatsapp_number': whatsappNumber,
      'catName': catName,
      'jain': jain,
      'address': address,
      'user_city': userCity,
      'user_aboutUs': userAboutUs,
      'business': business,
      'last_name': lastName,
      'native_city': nativeCity,
      'country': country,
      'zip_code': zipCode,
      'father_name': fatherName,
      'mother_name': motherName,
      'blood_donor': bloodDonor,
      'blood_group': bloodGroup,
      'title': title,
      'member_name': memberName,
      'reg_no': regNo,
      'rglsi_id': rglsiId,
      'date_of_birth': dateOfBirth,
      'master_year': masterYear,
      'rg_rank': rgRank,
      'g_rank': gRank,
      'subscription': subscription,
      'doi': doi,
      'dop': dop,
      'dor': dor,
      'chapter': chapter,
      'RAM': ram,
      'Conclave': conclave,
      'Mark': mark,
      'wedding_anniversary': weddingAnniversary,
      'spouse_name': spouseName,
      'children': children,
      'spouse_dob': spouseDob,
      'spouse_bloodgroup': spouseBloodgroup,
      'children2': children2,
      'children3': children3,
      'user_status': userStatus,
      'subscription_status': subscriptionStatus,
      'donor_blood': donorBlood,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.whatsappNumber == e2?.whatsappNumber &&
        e1?.catName == e2?.catName &&
        e1?.jain == e2?.jain &&
        e1?.address == e2?.address &&
        e1?.userCity == e2?.userCity &&
        e1?.userAboutUs == e2?.userAboutUs &&
        e1?.business == e2?.business &&
        e1?.lastName == e2?.lastName &&
        e1?.nativeCity == e2?.nativeCity &&
        e1?.country == e2?.country &&
        e1?.zipCode == e2?.zipCode &&
        e1?.fatherName == e2?.fatherName &&
        e1?.motherName == e2?.motherName &&
        e1?.bloodDonor == e2?.bloodDonor &&
        e1?.bloodGroup == e2?.bloodGroup &&
        e1?.title == e2?.title &&
        e1?.memberName == e2?.memberName &&
        e1?.regNo == e2?.regNo &&
        e1?.rglsiId == e2?.rglsiId &&
        e1?.dateOfBirth == e2?.dateOfBirth &&
        e1?.masterYear == e2?.masterYear &&
        e1?.rgRank == e2?.rgRank &&
        e1?.gRank == e2?.gRank &&
        e1?.subscription == e2?.subscription &&
        listEquality.equals(e1?.sideDegrees, e2?.sideDegrees) &&
        e1?.doi == e2?.doi &&
        e1?.dop == e2?.dop &&
        e1?.dor == e2?.dor &&
        e1?.chapter == e2?.chapter &&
        e1?.ram == e2?.ram &&
        e1?.conclave == e2?.conclave &&
        e1?.mark == e2?.mark &&
        e1?.weddingAnniversary == e2?.weddingAnniversary &&
        e1?.spouseName == e2?.spouseName &&
        e1?.children == e2?.children &&
        listEquality.equals(e1?.userList, e2?.userList) &&
        e1?.spouseDob == e2?.spouseDob &&
        e1?.spouseBloodgroup == e2?.spouseBloodgroup &&
        e1?.children2 == e2?.children2 &&
        e1?.children3 == e2?.children3 &&
        e1?.userStatus == e2?.userStatus &&
        e1?.subscriptionStatus == e2?.subscriptionStatus &&
        e1?.donorBlood == e2?.donorBlood;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.whatsappNumber,
        e?.catName,
        e?.jain,
        e?.address,
        e?.userCity,
        e?.userAboutUs,
        e?.business,
        e?.lastName,
        e?.nativeCity,
        e?.country,
        e?.zipCode,
        e?.fatherName,
        e?.motherName,
        e?.bloodDonor,
        e?.bloodGroup,
        e?.title,
        e?.memberName,
        e?.regNo,
        e?.rglsiId,
        e?.dateOfBirth,
        e?.masterYear,
        e?.rgRank,
        e?.gRank,
        e?.subscription,
        e?.sideDegrees,
        e?.doi,
        e?.dop,
        e?.dor,
        e?.chapter,
        e?.ram,
        e?.conclave,
        e?.mark,
        e?.weddingAnniversary,
        e?.spouseName,
        e?.children,
        e?.userList,
        e?.spouseDob,
        e?.spouseBloodgroup,
        e?.children2,
        e?.children3,
        e?.userStatus,
        e?.subscriptionStatus,
        e?.donorBlood
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
