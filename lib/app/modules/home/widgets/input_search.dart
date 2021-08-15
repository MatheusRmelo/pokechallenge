import 'package:flutter/material.dart';

Widget inputSearch(Function onChanged) {
  return Container(
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
          color: Colors.black26,
          blurRadius: 6,
          offset: Offset.fromDirection(1, 1),
          spreadRadius: 0),
    ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
    margin: EdgeInsets.all(16),
    child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(16),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: 'Pesquise pelo nome',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            suffixIcon: Icon(
              Icons.search,
              size: 32,
            )),
        onChanged: (text) {
          onChanged(text);
        }),
  );
}
