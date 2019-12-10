package load_json

class contacts {
    String location;
    String phone;

    contacts({this.location, this.phone});

    factory contacts.fromJson(Map<String, dynamic> json) {
        return contacts(
            location: json['location'], 
            phone: json['phone'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['location'] = this.location;
        data['phone'] = this.phone;
        return data;
    }
}