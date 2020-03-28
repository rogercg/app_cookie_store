import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),// Le damos forma circular, evitando cualquier match o colision
      notchMargin: 6.0,// Margen del notch/endidura
      color: Colors.transparent,// Fondo transparente
      elevation: 9.0,// Elevacion para sombra
      clipBehavior: Clip.antiAlias,// Activamos el borde e nidicamos que es sin pixelear
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),// bordes del contorno
            topRight: Radius.circular(25.0)// bordes del contorno
          ),
          color: Colors.white
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width /2 - 40.0,// Ancho del container sera menos de la mitad del ancho
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.home, color: Color(0xFFEF7532)),
                  Icon(Icons.person_outline, color: Color(0xFF676E79))
                ],
              )
            ),
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width /2 - 40.0,// Ancho del container sera menos de la mitad del ancho
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.search, color: Color(0xFF676E79)),
                  Icon(Icons.shopping_basket, color: Color(0xFF676E79))
                ],
              )
            ),
          ]
        )
      )
    );
  }
}