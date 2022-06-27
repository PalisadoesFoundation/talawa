class RequestModel {



  static List<Request> items=[];

  //get item by id
   Request getById(int id) =>
      items.firstWhere((element) => element.id == id);

  //get item by position
   Request getByPosition(int pos) => items[pos];
}

class Request {

  Request({ required this.id, required this.name, required this.desc, required this.image, required this.datetime});

  factory Request.fromMap(Map<String, dynamic> map) {
    return Request(
      id: map["id"] as int,
      name: map["name"] as String,
      desc: map["desc"] as String,
      image: map["image"] as String, 
      datetime: map["datetime"] as DateTime,
    );
  }
  final int id;
  final String name;
  final String desc;
  final DateTime datetime;
  final String image;
  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "image": image,
        "datetime": datetime,
      };
}
