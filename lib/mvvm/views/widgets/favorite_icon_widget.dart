// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class FavoriteIconWidget extends StatefulWidget {
  FavoriteIconWidget(this.isFavorite, {Key? key}) : super(key: key);
  bool isFavorite;
  @override
  State<FavoriteIconWidget> createState() => _FavoriteIconWidgetState();
}

class _FavoriteIconWidgetState extends State<FavoriteIconWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.isFavorite
        ? const Icon(Icons.favorite)
        : const Icon(Icons.favorite_border);
  }
}
