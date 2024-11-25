class ProductModel {
  int? id ;
  String? name;
  num? price;
  String? description;
  String? image;


  ProductModel({this.id, this.name, this.price, this.description, this.image});

  Map<String, dynamic> toJson(){//function convert from model to json map
    Map<String,dynamic> json = {}; // json variable
    //json['id'] = id;  bsc itss auto icrement
    json['name']= name;
    json['price']=price;
    json['description']=description;
    json['image']=image;
    return json;

  }

  ProductModel.fromjson(Map<String,dynamic> json){
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    image = json['image'];

  }


}