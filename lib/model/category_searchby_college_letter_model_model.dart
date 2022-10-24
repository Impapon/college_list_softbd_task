
const String searchCategoryId = 'id';
const String searchCategoryLetter = 'letter';

class SearchByCollegeLetterModel{
  String? id, letter;

  SearchByCollegeLetterModel({this.id, this.letter});

  Map<String, dynamic> toMap(){
    return <String, dynamic> {
      searchCategoryId : id,
      searchCategoryLetter : letter,

    };
  }

  factory SearchByCollegeLetterModel.fromMap(Map<String, dynamic> map){
    return SearchByCollegeLetterModel(
      id: map[searchCategoryId],
      letter: map[searchCategoryLetter],
    );
  }
}