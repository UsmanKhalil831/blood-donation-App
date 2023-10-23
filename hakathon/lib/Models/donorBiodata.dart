abstract class DonorBiodata{
  String? name;
  String? location;
  String? phone;
  String? date;

  DonorBiodata({required this.name,required this.location, required this.phone,required this.date});

  DonorBiodata.fromMap(Map<String,dynamic> map){
    name = map['name'];
    location = map['location'];
    phone = map['phone'];
    date = map['date'];
  }

  Map<String,dynamic> toMap(){
    return{
      'name':name,
      'location':location,
      'phone':phone,
      'date':date
    };
  }
}