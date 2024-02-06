import 'package:flutter/material.dart';
import 'package:tobetomobileapp/models/catalog_page/catalog_item.dart';

abstract class CatalogState {}

class Initialize extends CatalogState {}

class LoadedPage extends CatalogState {
  final List<Widget> catalogWidgets;
  final List<CatalogItem> catalogItems;
  final List<String> categoryList;
  final List<String> educationList;
  final List<String> eduLevelList;
  final List<String> eduTopicList;
  final List<String> eduTypeList;
  final List<String> eduSoftwareList;
  final List<String> instructiorsList;
  final List<String> statusList;
  LoadedPage(
      this.catalogWidgets,
      this.catalogItems,
      this.categoryList,
      this.educationList,
      this.eduLevelList,
      this.eduTopicList,
      this.eduTypeList,
      this.eduSoftwareList,
      this.instructiorsList,
      this.statusList);
}
