import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:roulette/domain/user.dart';

class DatabaseServices {
  final usersColl = FirebaseFirestore.instance.collection('Users');
  Future<void> addUser(Users user) async {
    user.uid = usersColl.doc().id;

    final json = user.toJson();

    await usersColl.doc().set(json);
  }

  Stream<List<Users>> getUsers() {
    final users = FirebaseFirestore.instance.collection('Users');
    return users.snapshots().map(
          (snapshots) => snapshots.docs
              .map(
                (doc) => Users.fromJson(
                  doc.data(),
                ),
              )
              .toList(),
        );
  }

  Future<Users?> getUser() async {
    final snapshot = await usersColl.doc('Bd4EQfQ86IDWGrlEC9mx').get();

    if (snapshot.exists) {
      return Users.fromJson(snapshot.data()!);
    }
    return null;
  }

  void deleteUser() {
    usersColl.doc('Bd4EQfQ86IDWGrlEC9mx').delete();
  }

  void updateUser({
    required int chips,
    required int rating,
  }) {
    usersColl.doc('Bd4EQfQ86IDWGrlEC9mx').update(
      {
        'chips': chips,
        'rating': rating,
      },
    );
  }
}
