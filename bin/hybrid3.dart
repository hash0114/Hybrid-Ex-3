import 'dart:convert';

class Students {
  List<Map<String, String>> people;

  Students(this.people);


  void output() {
    for (var person in people) {
      print("First: ${person['first']}, Last: ${person['last']}, Email: ${person['email']}");
    }
  }

  void output2(String title) {
    print(title);
    output();
    print("--------");
  }

  void plus(Map<String, String> person) {
    people.add(person);
  }

  void sort(String field) {
    people.sort((a, b) => (a[field]?.compareTo(b[field] ?? "") ?? -1));
  }
  void remove(String email) {
    people.removeWhere((person) => (person["email"] == email));
  }
}

void main() {
  
  String json = '''
  [
    {"first":"Steve", "last":"Griffith", "email":"griffis@algonquincollege.com"},
    {"first":"Adesh", "last":"Shah", "email":"shaha@algonquincollege.com"},
    {"first":"Tony", "last":"Davidson", "email":"davidst@algonquincollege.com"},
    {"first":"Adam", "last":"Robillard", "email":"robilla@algonquincollege.com"}
  ]
  ''';

  // Converts the JSON string to a List<Map<String, dynamic>>
  List<dynamic> dataDecoded = jsonDecode(json);

  // Converts the List<dynamic> to a List<Map<String, String>>
  List<Map<String, String>> listData = dataDecoded.map((item) => Map<String, String>.from(item)).toList(); 

  var students = Students(listData);

 
  print("Original list:"); // Invokes output to show the list before sorting
  students.output();
  print("--------");

 
  students.sort("last"); // Arranges the list by the 'last' name and show the sorted list.
  students.output2("Sorted by last name");

 
  students.plus({"first": "John", "last": "Doe", "email": "john.doe@example.com"}); // Inserts a new person into the list
  students.output2("Added New Person");

  
  students.remove("shaha@algonquincollege.com"); // Takes a person out of the list using their email
  students.output2("Removed Person");
}
