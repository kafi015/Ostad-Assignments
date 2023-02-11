import 'package:flutter/material.dart';

InputDecoration MyAppInputDecoration(){
  return InputDecoration(

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),

  );
}

ButtonStyle MyAppButtonStyle()
{
  return ElevatedButton.styleFrom(
    padding: EdgeInsets.all(8.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
  );
}

SizedBox SizedBox50(child)
{
  return SizedBox(
    width: double.infinity,
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(8.0),
      child: child,
    ),
  );
}

