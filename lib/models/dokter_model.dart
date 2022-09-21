import 'package:flutter/material.dart';

class DokterModel {
  final int? id;
  final String? name;
  final String? spesialis;
  final String? imageUrl;
  final double? rating;
  final int? price;

  DokterModel(
      {required this.id,
       this.name,
       this.spesialis,
       this.imageUrl,
       this.price,
       this.rating});
}
