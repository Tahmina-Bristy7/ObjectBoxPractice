import 'models.dart';
import 'objectbox.g.dart';

class ObjectBox {
  static late Store store;

  late Box<Task> taskBox;
  // late Box<Owner> ownerBox;
  static Future<void> createStore() async {
    store = await openStore();

    //return ObjectBox._create();
  }

  // void create() {
  //   taskBox = store.box<Task>();
  //   _putData();
  // }
  // static Future<Store> getStore(Store store) async {
  //   if (store != null) {
  //     print("StoreIsNotNull");
  //     return store!;
  //   } else {
  //     print("StoreIsNull");
  //     store = await openStore();
  //     return store!;
  //   }
  // }

  // void addTask(String taskText, Owner owner) {
  //   Task newTask = Task(taskText);
  //   newTask.owner.target = owner;
  //
  //   taskBox.put(newTask);
  //   debugPrint(
  //       "Adding new Task: ${newTask.text} assigned to ${newTask.owner.target?.name}");
  // }
  //
  // int addOwner(String newOwner) {
  //   Owner ownerToAdd = Owner(newOwner);
  //   int newObjectId = ownerBox.put(ownerToAdd);
  //   return newObjectId;
  // }
  //
  // Stream<List<Task>> getTasks() {
  //   final builder = taskBox.query()..order(Task_.id, flags: Order.descending);
  //   return builder.watch(triggerImmediately: true).map((query) => query.find());
  // }

  // ObjectBox._create() {
  //   taskBox = ObjectBox.store.box<Task>();
  //   //ownerBox = Box<Owner>(store);
  //   if (taskBox.isEmpty()) {
  //     print("object");
  //     //_putData;
  //   }
  // }

  // _putData() {
  //   // Owner owner1 = Owner("Tahmina");
  //   // Owner owner2 = Owner("Bristy");
  //   Task task1 = Task("My Task 1");
  //   // task1.owner.target = owner1;
  //   // Task task2 = Task("My Task 2");
  //   // task2.owner.target = owner2;
  //   taskBox.put(task1);
  // }
}
