import 'dart:convert';

void main() {
//Question 1
  var q1 = Question1();
  q1.validateEmail("+ab.c@gmail.com");
  q1.validateEmail("anil@gmail.com");

// Question 2
  var q2 = Question2();
  q2.findNotMatching();

//Question 3
  var q3 = Question3();
  q3.enterDates("Anil", "2022-01-01");
  q3.enterDates("James", "2022-01-01");
  q3.enterDates("Tina", "2022-01-01");

  print("Dob is: " + q3.findFriend("Anil"));
  print("Dob is: " + q3.findFriend("James2"));

//Question 4
  var r = Rectangle();
  r.getArea();
  r.setDimension(-10, 20);
  r.getArea();
}

class Question1 {
  void validateEmail(String email) {
    var emailValidator =
        RegExp("[A-Za-z0-9._]{1,}@[a-z]{3,}[.][A-Za-z.]{3,6}\$");
    var isValid = emailValidator.hasMatch(email);
    if (isValid) {
      print("Valid Email");
    } else {
      print("Invalid Email");
    }
  }
}

class Question2 {
  final firstList = [10, 15, 2, 5];
  final secondList = [2, 15, 6, 7];

  void findNotMatching() {
    var tempList = [];
    for (var first in firstList) {
      var hasFirst = secondList.contains(first);
      var isAdded = tempList.contains(first);
      if (!hasFirst && !isAdded) {
        tempList.add(first);
      }
    }
    for (var second in secondList) {
      var hasSecond = firstList.contains(second);
      var isAdded = tempList.contains(second);
      if (!hasSecond && !isAdded) {
        tempList.add(second);
      }
    }
    print(tempList);
  }
}

class Question3 {
  List<FriendModel> friendList = [];
  void enterDates(String name, String dob) {
    friendList.add(FriendModel(name, dob));
  }

  String findFriend(String name) {
    FriendModel? current;

    friendList.map((e) {
      if (e.name == name) {
        current = e;
      }
    }).toList();
    if (current != null) {
      return current!.dob;
    } else {
      return "Friend not found";
    }
  }
}

class FriendModel {
  final String name;
  final String dob;

  FriendModel(this.name, this.dob);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dob': dob,
    };
  }

  factory FriendModel.fromMap(Map<String, dynamic> map) {
    return FriendModel(
      map['name'] ?? '',
      map['dob'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FriendModel.fromJson(String source) =>
      FriendModel.fromMap(json.decode(source));
}

class Rectangle {
  var length = 0.0;
  var bredth = 0.0;

  void setDimension(double l, double b) {
    length = l;
    bredth = b;
  }

  void getArea() {
    if (length == 0.0 || bredth == 0) {
      print("Please enter dimension");
      return;
    }
    var area = length * bredth;
    print("Area: $area");
  }
}
