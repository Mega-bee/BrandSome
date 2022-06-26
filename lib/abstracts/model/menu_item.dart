import 'package:flutter/material.dart';

class ItemModel{
  final String title;
  final IconData icon;
  final Function onTap;

  ItemModel(this.title, this.icon, this.onTap);

}