
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_list/model/category_searchby_college_letter_model_model.dart';
import 'package:college_list/model/college_model.dart';

import 'package:flutter/material.dart';

import '../db/dbhelper.dart';

class CollegeProvider extends ChangeNotifier {
  List<CollegeModel> collegeList = [];
  List<SearchByCollegeLetterModel> categoryList = [];
  List<String> categoryNameList = [];

  getAllCategories() {
    DbHelper.getAllCategories().listen((snapshot) {
      categoryList = List.generate(snapshot.docs.length, (index) =>
          SearchByCollegeLetterModel.fromMap(snapshot.docs[index].data()));
      categoryNameList = List.generate(categoryList.length, (index) => categoryList[index].letter!);
      categoryNameList.insert(0, 'All');
      notifyListeners();
    });
  }


  getAllCollege() {
    DbHelper.getAllColleges().listen((snapshot) {
      collegeList = List.generate(snapshot.docs.length, (index) =>
          CollegeModel.fromMap(snapshot.docs[index].data()));
      notifyListeners();
    });
  }


  getAllCollegesByCategory(String category) {
    DbHelper.getAllCollegesByCategory(category).listen((snapshot) {
      collegeList = List.generate(snapshot.docs.length, (index) =>
          CollegeModel.fromMap(snapshot.docs[index].data()));
      notifyListeners();
    });
  }


  getAllSearchedCollegeByName(String searchProvider)  {
    DbHelper.getAllSearchedCollegeByName(searchProvider).listen((snapshot) {
      collegeList = List.generate(snapshot.docs.length, (index) =>
          CollegeModel.fromMap(snapshot.docs[index].data()));
      notifyListeners();
    });

  }


}