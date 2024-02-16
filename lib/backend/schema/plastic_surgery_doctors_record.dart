import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlasticSurgeryDoctorsRecord extends FirestoreRecord {
  PlasticSurgeryDoctorsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "jobName" field.
  String? _jobName;
  String get jobName => _jobName ?? '';
  bool hasJobName() => _jobName != null;

  // "jobDescription" field.
  String? _jobDescription;
  String get jobDescription => _jobDescription ?? '';
  bool hasJobDescription() => _jobDescription != null;

  // "drNumber" field.
  String? _drNumber;
  String get drNumber => _drNumber ?? '';
  bool hasDrNumber() => _drNumber != null;

  // "drPhoto" field.
  String? _drPhoto;
  String get drPhoto => _drPhoto ?? '';
  bool hasDrPhoto() => _drPhoto != null;

  void _initializeFields() {
    _jobName = snapshotData['jobName'] as String?;
    _jobDescription = snapshotData['jobDescription'] as String?;
    _drNumber = snapshotData['drNumber'] as String?;
    _drPhoto = snapshotData['drPhoto'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('plasticSurgery_doctors');

  static Stream<PlasticSurgeryDoctorsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => PlasticSurgeryDoctorsRecord.fromSnapshot(s));

  static Future<PlasticSurgeryDoctorsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PlasticSurgeryDoctorsRecord.fromSnapshot(s));

  static PlasticSurgeryDoctorsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlasticSurgeryDoctorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlasticSurgeryDoctorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlasticSurgeryDoctorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlasticSurgeryDoctorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlasticSurgeryDoctorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlasticSurgeryDoctorsRecordData({
  String? jobName,
  String? jobDescription,
  String? drNumber,
  String? drPhoto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'jobName': jobName,
      'jobDescription': jobDescription,
      'drNumber': drNumber,
      'drPhoto': drPhoto,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlasticSurgeryDoctorsRecordDocumentEquality
    implements Equality<PlasticSurgeryDoctorsRecord> {
  const PlasticSurgeryDoctorsRecordDocumentEquality();

  @override
  bool equals(
      PlasticSurgeryDoctorsRecord? e1, PlasticSurgeryDoctorsRecord? e2) {
    return e1?.jobName == e2?.jobName &&
        e1?.jobDescription == e2?.jobDescription &&
        e1?.drNumber == e2?.drNumber &&
        e1?.drPhoto == e2?.drPhoto;
  }

  @override
  int hash(PlasticSurgeryDoctorsRecord? e) => const ListEquality()
      .hash([e?.jobName, e?.jobDescription, e?.drNumber, e?.drPhoto]);

  @override
  bool isValidKey(Object? o) => o is PlasticSurgeryDoctorsRecord;
}
