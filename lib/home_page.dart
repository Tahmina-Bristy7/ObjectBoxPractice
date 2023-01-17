import 'package:flutter/material.dart';
import 'package:obejctbox/objectbox.dart';
import 'package:obejctbox/objectbox.g.dart';

import 'models.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Box<Task> box1 = ObjectBox.store.box<Task>();
  @override
  Widget build(BuildContext context) {
    //print("Bristy                         ..................");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("OBJECT BOX")),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        List getAllData = [];
                        box1.getAll().forEach((element) {
                          var a = element.text;
                          getAllData.add(a);
                        });
                        print("Get All data=$getAllData");
                        // var a = box1.get(0)?.text;
                        // print("object=====================$a");
                      },
                      child: const Text("Get All")),
                  ElevatedButton(
                      onPressed: () {
                        List listData = [];
                        Query<Task> b = box1
                            .query()
                            .order(Task_.subText1, flags: Order.descending)
                            .build();
                        List<Task> objects = b.find();

                        objects.forEach((element) {
                          listData.add(element.subText1);
                        });
                        print("Descending Order Data =$listData");
                      },
                      child: const Text("Descending Order")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        List allPutdata = [];
                        box1.put(Task(text: "Bristy", subText1: 1970));
                        final a = box1.getAll();
                        a.forEach((element) {
                          allPutdata.add(element.text);
                        });

                        print("Putting all data= $allPutdata");
                      },
                      child: const Text("Put Data")),
                  ElevatedButton(
                      onPressed: () {
                        List listData = [];
                        Query<Task> b = box1
                            .query()
                            .order(
                              Task_.subText1,
                            )
                            .build();
                        List<Task> objects = b.find();

                        objects.forEach((element) {
                          listData.add(element.subText1);
                        });
                        print("Ascending Order Data =$listData");
                      },
                      child: const Text("Ascending Order")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        var a = box1.get(1);
                        print("Specific one data =$a");
                      },
                      child: const Text("Get one")),
                  ElevatedButton(
                      onPressed: () {
                        List listData = [];
                        Query<Task> b = box1
                            .query()
                            .order(Task_.subText1, flags: Order.caseSensitive)
                            .build();
                        List<Task> objects = b.find();

                        objects.forEach((element) {
                          listData.add(element.subText1);
                        });
                        print("CaseSensitive Order Data =$listData");
                      },
                      child: const Text("CaseSensitive Order")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        var a = box1.count();
                        print("Box Count=$a");
                      },
                      child: const Text("Box Count")),
                  ElevatedButton(
                      onPressed: () {
                        Query<Task> queryBuilder =
                            box1.query(Task_.subText1.equals(1970)).build();
                        // var a = queryBuilder.findFirst();
                        // print("findFirst=${a?.id}");
                        String describeData = queryBuilder.describeParameters();

                        print("Box Count=$describeData");
                      },
                      child: const Text("Describe which type")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Query<Task> queryBuilder =
                            box1.query(Task_.subText1.equals(1970)).build();
                        var a = queryBuilder.findFirst()?.id;

                        print("First Index id which subtitle 1970=${a}");
                      },
                      child: const Text(" To Get \nfirst Index")),
                  ElevatedButton(
                      onPressed: () {
                        List taskName = [];
                        List<Task> a = box1
                            .query(Task_.text.equals("Bristy"))
                            .build()
                            .find();

                        a.forEach((element) {
                          taskName.add(element.text);
                        });
                        print(
                            "After searching 'Bristy',all TaskList =${taskName}");
                      },
                      child: const Text("Specific query")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        List taskName = [];
                        List<Task> a = box1
                            .query(Task_.text.equals("Bristy") &
                                Task_.subText1.equals(1998))
                            .build()
                            .find();
                        a.forEach((element) {
                          taskName.add(element.text);
                        });

                        print("Task =$taskName");
                      },
                      child: const Text("Multiple query\n for equals")),
                  ElevatedButton(
                      onPressed: () {
                        // Query<Task> queryBuilder =
                        //     box1.query(Task_.id).build();
                        // var a = queryBuilder.findUnique();
                        //
                        // print("First Index id which subtitle 1970=$a");
                      },
                      child: const Text(" To Get \nUnique Index")),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    List taskName = [];
                    List<Task> a = box1
                        .query(Task_.text.equals("Bristy") &
                            Task_.subText1.greaterOrEqual(1990))
                        .build()
                        .find();
                    a.forEach((element) {
                      taskName.add(element.text);
                    });
                    print("Task for Multiple query =$taskName");
                  },
                  child: const Text("Multiple query \nfor greaterOrEqual")),
              ElevatedButton(
                  onPressed: () {
                    var a;
                    final objects = box1
                        .query(Task_.text.startsWith("B") &
                            Task_.subText1.greaterOrEqual(1990))
                        .build()
                        .find();
                    objects.forEach((element) {
                      a = element.text;
                    });
                    print("Task =$a");
                  },
                  child: const Text("Multiple query \nfor startWith")),
              ElevatedButton(
                  onPressed: () {
                    var a;
                    final objects = box1
                        .query(Task_.text.startsWith("B") &
                            Task_.subText1.oneOf([1998]))
                        .build()
                        .find();
                    objects.forEach((element) {
                      a = element.text;
                    });
                    print("Task =$a");
                  },
                  child: const Text("Multiple query \nfor startWith")),
              ElevatedButton(
                  onPressed: () {
                    var a;
                    final objects = box1
                        .query(Task_.text.startsWith("B") &
                            Task_.subText1.oneOf([1998]))
                        .build()
                        .find();
                    objects.forEach((element) {
                      a = element.text;
                    });
                    print("Task =$a");
                  },
                  child: const Text("Multiple query \nfor startWith")),
              ElevatedButton(
                  onPressed: () {
                    var a;
                    final objects = box1
                        .query(Task_.subText1.between(1990, 1998))
                        .build()
                        .find();

                    objects.forEach((element) {
                      a = element.text;
                    });
                    print("Task =$a");
                  },
                  child: const Text("Multiple query \nfor Between ")),
              Center(child: const Text("******RELATIONAL DATABASE********")),
              ElevatedButton(
                  onPressed: () {
                    School school = School();
                    Student student = Student();
                    student.school.target = school;

                    int studentId = ObjectBox.store.box<Student>().put(student);
                    final getStudentIdfromSchool =
                        ObjectBox.store.box<School>().get(studentId);
                    School? getStudentINSchool = getStudentIdfromSchool;
                    print(
                        "After getting StudentId IN School Database=======${getStudentINSchool!.id}");

                    final getStudent = student.school.target;
                    // print(
                    //     "After getting target IN School Database=======${getStudent}");
                  },
                  child:
                      const Text(" To add one to one \n Relation & get data")),
              ElevatedButton(
                  onPressed: () {
                    Orders orders = Orders();
                    Customer customer = Customer();
                    late Box<Orders> orderBox = ObjectBox.store.box<Orders>();
                    late Box<Customer> customerBox =
                        ObjectBox.store.box<Customer>();

                    customer.orders.add(Orders());
                    customer.orders.add(Orders());
                    customer.orders.add(Orders());

                    final putCustomerId = customerBox.put(customer);
                    for (int i = 0; i <= orderBox.count(); i++) {
                      Orders? getCustomerId = orderBox.get(putCustomerId);
                      print(
                          "Get Customer Id from Orders Database : ${getCustomerId!.id}");
                    }

                    Orders? getCustomerId =
                        ObjectBox.store.box<Orders>().get(putCustomerId);

                    print(
                        "Get Customer Id from Orders Database : ${getCustomerId!.id}");
                    Customer? getOrderId =
                        ObjectBox.store.box<Customer>().get(getCustomerId.id);

                    print(
                        "asdcvbnm,sdfghjkjhgfds=${ObjectBox.store.box<Orders>().count()}");
                    print(
                        "Get Order Id from Customer database : ${getOrderId!.id}");

                    // print("After getting target IN School Database=======${getStudent}");
                  },
                  child:
                      const Text(" To add one to many \n Relation & get data")),
              ElevatedButton(
                  onPressed: () {
                    School school = School();
                    Student student = Student();
                    student.school.target = null;
                  },
                  child: const Text("Remove Relation")),
            ],
          ),
        ),
      ),
    );
  }
}
