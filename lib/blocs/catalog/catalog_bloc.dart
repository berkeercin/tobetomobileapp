import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetomobileapp/blocs/catalog/catalog_event.dart';
import 'package:tobetomobileapp/blocs/catalog/catalog_state.dart';
import 'package:tobetomobileapp/models/catalog_page/catalog_item.dart';
import 'package:tobetomobileapp/repositories/catalog_repository.dart';
import 'package:tobetomobileapp/repositories/user_repository.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final FirebaseFirestore _firebaseFireStore;
  final UserRepostory userRepostory;
  CatalogBloc(
      {required this.userRepostory,
      FirebaseAuth? firebaseAuth,
      FirebaseFirestore? firebaseFirestore})
      : _firebaseFireStore = firebaseFirestore ?? FirebaseFirestore.instance,
        super(Initialize()) {
    List<dynamic> catalogArray = [];
    List<dynamic> filteredCatalogArray = [];
    List<CatalogItem> catalogItems = [];

    loadCatalogItems() async {
      final snapshot =
          await _firebaseFireStore.collection("catalogItems").get();
      for (var element in snapshot.docs) {
        CatalogItem item = CatalogItem.fromMap(element.data());
        catalogItems.add(item);
      }
    }

    on((LoadCatalog event, Emitter<CatalogState> emit) async {
      final CatalogRepository catalogRepository =
          CatalogRepository(brightness: event.brightness);

      if (event.filter == null) {
        catalogItems.clear();
        await loadCatalogItems();
        catalogArray = catalogRepository.loadCatalogItems("", catalogItems);
      } else {
        catalogItems.clear();
        await loadCatalogItems();
        catalogArray =
            catalogRepository.loadCatalogItems(event.filter!, catalogItems);
        catalogItems = catalogArray[9];
      }
      // print(catalogArray);
      emit(LoadedPage(
          catalogArray[0],
          catalogItems,
          catalogArray[1],
          catalogArray[2],
          catalogArray[3],
          catalogArray[4],
          catalogArray[5],
          catalogArray[6],
          catalogArray[7],
          catalogArray[8]));
    });
    on((LoadFilteredCatalog event, Emitter<CatalogState> emit) async {
      final CatalogRepository catalogRepository =
          CatalogRepository(brightness: event.brightness);
      catalogItems.clear();
      await loadCatalogItems();
      filteredCatalogArray = catalogRepository.loadFilteredCatalogItems(
          event.category,
          event.eduTitle,
          event.eduType,
          event.eduLevel,
          event.eduTopic,
          event.eduSoftware,
          event.instructor,
          event.status,
          catalogItems);
      // print(filteredCatalogArray.toString());

      emit(LoadedPage(
          filteredCatalogArray[0],
          catalogItems,
          catalogArray[1],
          catalogArray[2],
          catalogArray[3],
          catalogArray[4],
          catalogArray[5],
          catalogArray[6],
          catalogArray[7],
          catalogArray[8]));
    });
    on((RefreshCatalogPage event, Emitter<CatalogState> emit) {
      emit(Initialize());
    });
  }
}
