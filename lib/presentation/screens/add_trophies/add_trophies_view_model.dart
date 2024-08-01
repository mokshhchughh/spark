part of 'add_trophies_imports.dart';

class AddTrophiesViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> incrementTrophies(String uid) async {
    DocumentReference userDoc = _firestore.collection('users').doc(uid);

    try {
      await _firestore.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(userDoc);

        if (!snapshot.exists) {
          throw Exception("User does not exist!");
        }

        int newTrophiesCount = snapshot.get('trophies') + 1;

        transaction.update(userDoc, {'trophies': newTrophiesCount});
      });

      log("Trophies count increased by 1.");
    } catch (e) {
      log("Failed to increase trophies count: $e");
    }
  }
}
