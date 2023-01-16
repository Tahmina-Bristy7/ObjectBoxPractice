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

// class Owner {
//   @Id()
//   int id = 0;

//   String name;

//   Owner(this.name, {this.id = 0});
// }
