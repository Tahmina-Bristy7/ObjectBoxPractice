import 'package:objectbox/objectbox.dart';

@Entity()
class Task {
  @Id()
  int id;

  String? text;
  int? subText1;
  String? subText2;
  bool status;
  Task({
    this.text,
    this.subText1,
    this.subText2,
    this.id = 0,
    this.status = false,
  });
  //final owner = ToOne<Owner>();

  bool setFinished() {
    status = !status;
    return status;
  }
}

@Entity()
class School {
  @Id()
  int id = 0;
  //String? name;
  School(
    this.id,
  );
}

@Entity()
class Student {
  @Id()
  int id = 0;
  //String? name;
  final school = ToOne<School>();
  Student(
    this.id,
  );
}




// class Owner {
//   @Id()
//   int id = 0;

//   String name;

//   Owner(this.name, {this.id = 0});
// }
