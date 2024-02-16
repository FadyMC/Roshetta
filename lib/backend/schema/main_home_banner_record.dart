import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MainHomeBannerRecord extends FirestoreRecord {
  MainHomeBannerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _image = snapshotData['Image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mainHomeBanner');

  static Stream<MainHomeBannerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MainHomeBannerRecord.fromSnapshot(s));

  static Future<MainHomeBannerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MainHomeBannerRecord.fromSnapshot(s));

  static MainHomeBannerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MainHomeBannerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MainHomeBannerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MainHomeBannerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MainHomeBannerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MainHomeBannerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMainHomeBannerRecordData({
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class MainHomeBannerRecordDocumentEquality
    implements Equality<MainHomeBannerRecord> {
  const MainHomeBannerRecordDocumentEquality();

  @override
  bool equals(MainHomeBannerRecord? e1, MainHomeBannerRecord? e2) {
    return e1?.image == e2?.image;
  }

  @override
  int hash(MainHomeBannerRecord? e) => const ListEquality().hash([e?.image]);

  @override
  bool isValidKey(Object? o) => o is MainHomeBannerRecord;
}
