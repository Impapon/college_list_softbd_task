import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/college_model.dart';

class DbHelper {
  static const String collectionCategory = 'SearchByCollageLetter';
  static const String collectionCollege = 'CollegeList';

  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllCategories() =>
      _db.collection(collectionCategory).snapshots();

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllColleges() =>
      _db.collection(collectionCollege).snapshots();

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllCollegesByCategory(
          String category) =>
      _db
          .collection(collectionCollege)
          .where(collegeCategory, isEqualTo: category)
          .snapshots();

  static Stream<QuerySnapshot<Map<String, dynamic>>>
      getAllSearchedCollegeByName(String searchProvider) =>
      _db
          .collection(collectionCollege)
          .where(collegeName, isEqualTo: searchProvider.toLowerCase())
          .orderBy('$collegeName asc')
          .snapshots();
}
