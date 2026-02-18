import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/task_model.dart';
import 'package:evently_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFunction {
  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection("users")
        .withConverter<UserModel>(
          fromFirestore: (snapshot, options) {
            return UserModel.fromJson(snapshot.data()!);
          },
          toFirestore: (value, options) {
            return value.toJson();
          },
        );
  }

  static createUserDB(UserModel user) {
    var collection = getUsersCollection();
    var docRef = collection.doc(user.id);
    return docRef.set(user);
  }

  static CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection("tasks")
        .withConverter<TaskModel>(
          fromFirestore: (snapshot, options) {
            return TaskModel.fromJson(snapshot.data()!);
          },
          toFirestore: (value, options) {
            return value.toJson();
          },
        );
  }

  static Future<void> createTask(TaskModel task) {
    var collection = getTaskCollection();
    var doc = collection.doc();
    task.id = doc.id;
    return doc.set(task);
  }

  static Future<void> deleteTask(TaskModel task) {
    var collection = getTaskCollection();
    return collection.doc(task.id).delete();
  }

  static Future<void> updateTask(TaskModel task) {
    var collection = getTaskCollection();
    return collection.doc(task.id).update(task.toJson());
  }

  static Stream<QuerySnapshot<TaskModel>> getFavoriteTasks() {
    var collection = getTaskCollection();
    return collection.where("isFav", isEqualTo: true).snapshots();
  }

  static Stream<QuerySnapshot<TaskModel>> getStreamTasks({String? category}) {
    var collection = getTaskCollection();

    if (category != null) {
      return collection
          .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .where("category", isEqualTo: category)
          .snapshots();
    }
    return collection
        .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }

  static Future<QuerySnapshot<TaskModel>> getTasks() {
    var collection = getTaskCollection();
    return collection.get();
  }

  static Future<void> createUser(
    String email,
    String password,
    String name,
    Function onSuccess,
    Function onError,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      createUserDB(
        UserModel(
          name: name,
          email: email,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          id: credential.user!.uid,
        ),
      );
      // credential.user!.sendEmailVerification();
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onError(e.message);
    } catch (e) {
      onError("SomeThing Went Wrong");
    }
  }

  static Future<void> login(
    String email,
    String password,
    Function onSuccess,
    Function onError,
  ) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      onSuccess();
      // if (credential.user!.emailVerified) {
      //   onSuccess();
      // } else {
      //   onError("Please verify your email");
      // }
    } on FirebaseAuthException catch (e) {
      onError(e.message);
    }
  }
}
