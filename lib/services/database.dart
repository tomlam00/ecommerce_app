import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/model.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference dataCollection =
      Firestore.instance.collection('data');

  final CollectionReference modelCollection =
      Firestore.instance.collection('model');

  List<ModelData> _modelDataFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return ModelData(
        mid: doc.data['mid'] ?? 0,
        name: doc.data['name'] ?? '',
        price: doc.data['price'] ?? 0,
        imageUrl: doc.data['imageUrl'] ?? '',
      );
    }).toList();
  }

  Stream<List<ModelData>> get models {
    return modelCollection.snapshots().map(_modelDataFromSnapshot);
  }
}
