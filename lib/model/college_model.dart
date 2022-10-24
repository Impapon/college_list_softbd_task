const String collegeId = 'id';
const String collegeName = 'name';
const String collegeCategory = 'category';
const String collegeLocation = 'location';
const String collegeImageUrl = 'imageUrl';


class CollegeModel {
  String? id, name, category, location,imageUrl;

  CollegeModel({
    this.id,
    this.name,
    this.category,
    this.location,
    this.imageUrl,
  });

  factory CollegeModel.fromMap(Map<String, dynamic> map) {
    return CollegeModel(
      id: map[collegeId],
      name: map[collegeName],
      category: map[collegeCategory],
      location: map[collegeLocation],
      imageUrl: map[collegeImageUrl],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      collegeId: id,
      collegeName: name,
      collegeCategory: category,
      collegeLocation: location,
      collegeImageUrl: imageUrl,
    };
  }
}
