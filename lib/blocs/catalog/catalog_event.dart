import 'package:flutter/material.dart';

abstract class CatalogEvent {}

class LoadCatalog extends CatalogEvent {
  final Brightness brightness;
  final String? filter;
  LoadCatalog(this.brightness, this.filter);
}

class RefreshCatalogPage extends CatalogEvent {}

class LoadFilteredCatalog extends CatalogEvent {
  final String? category;
  final String? eduTitle;
  final String? eduType;
  final String? eduLevel;
  final String? eduTopic;
  final String? eduSoftware;
  final String? instructor;
  final String? status;
  final Brightness brightness;
  LoadFilteredCatalog(
      this.category,
      this.eduLevel,
      this.eduSoftware,
      this.eduTopic,
      this.eduTitle,
      this.eduType,
      this.instructor,
      this.status,
      this.brightness);
}
