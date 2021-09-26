class PackagesModel {
 late  String id;
 late String englishName;
  late String arabicName;
 late  String projectNo;
  late String price;

  PackagesModel(
      {required this.id, required this.englishName, required this.arabicName, required this.projectNo, required this.price});

  PackagesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    englishName = json['english name'];
    arabicName = json['arabic name'];
    projectNo = json['project_no'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['english name'] = this.englishName;
    data['arabic name'] = this.arabicName;
    data['project_no'] = this.projectNo;
    data['price'] = this.price;
    return data;
  }
}