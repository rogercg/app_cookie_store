import 'package:app_cookie_store/cookie_detail.dart';
import 'package:flutter/material.dart';

class CookiePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 50.0,
            child: Wrap(
              children: <Widget>[
                _buildCard('Cookie mint', '\$3.99', 'assets/images/cookiemint.jpg', false, false, context),
                _buildCard('Cookie cream', '\$5.99', 'assets/images/cookiecream.jpg', true, false, context),
                _buildCard('Cookie classic', '\$1.99','assets/images/cookieclassic.jpg', false, true, context),
                _buildCard('Cookie choco', '\$2.99', 'assets/images/cookiechoco.jpg', false, false, context)
              ],
            ),
          );
        },


          
            // child: GridView.count(
            //   crossAxisCount: 2,// 2 x 2
            //   primary: false,
            //   crossAxisSpacing: 10.0,// Espacios entre columnas
            //   mainAxisSpacing: 15.0,// Espacios emtre filas
            //   childAspectRatio: 0.95,// Radio de los hijos(termina afectando a la altura)
            //   children: <Widget>[
            //     _buildCard('Cookie mint', '\$3.99', 'assets/images/cookiemint.jpg', false, false, context),
            //     _buildCard('Cookie cream', '\$5.99', 'assets/images/cookiecream.jpg', true, false, context),
            //     _buildCard('Cookie classic', '\$1.99','assets/images/cookieclassic.jpg', false, true, context),
            //     _buildCard('Cookie choco', '\$2.99', 'assets/images/cookiechoco.jpg', false, false, context),
            //     _buildCard('Cookie classic', '\$1.99','assets/images/cookieclassic.jpg', false, true, context),
            //     _buildCard('Cookie choco', '\$2.99', 'assets/images/cookiechoco.jpg', false, false, context)
            //   ],
            // )
          


      ),
    );
  }

  Widget _buildCard(String name, String price, String imgPath, bool added, bool isFavorite, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CookieDetail(
                    assetPath: imgPath,
                    cookieprice:price,
                    cookiename: name
                  )));
            },
            child: Container(
                width: (MediaQuery.of(context).size.width * 0.5) - 27.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3.0,
                      blurRadius: 5.0)
                  ],
                  color: Colors.white
                ),
                child: Column(
                  children: [
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        isFavorite
                          ? Icon(Icons.favorite, color: Color(0xFFEF7532))
                          : Icon(Icons.favorite_border,
                              color: Color(0xFFEF7532))
                      ]
                    )
                  ),
                  Hero(
                    tag: imgPath,
                    child: Container(
                        height: 75.0,
                        width: 75.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(imgPath),
                                fit: BoxFit.contain)))),
                  SizedBox(height: 7.0),
                  Text(price,
                      style: TextStyle(
                          color: Color(0xFFCC8053),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Text(name,
                      style: TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                  Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            (!added)?_rowAddToCart():_rowAddCantity(),
                          ])),
                  SizedBox(height: 15)
                ]))));
  }

  Widget _rowAddCantity() {
    return Row(
      children: <Widget>[
        Icon(Icons.remove_circle_outline,
            color: Color(0xFFD17E50), size: 12.0),
        SizedBox(width: 5),
        Text('3',
            style: TextStyle(
                fontFamily: 'Varela',
                color: Color(0xFFD17E50),
                fontWeight: FontWeight.bold,
                fontSize: 12.0)),
        SizedBox(width: 5),
        Icon(Icons.add_circle_outline,
            color: Color(0xFFD17E50), size: 12.0)
      ],
    );
  }

  Widget _rowAddToCart() {
    return Row(
      children: <Widget>[
        Icon(Icons.shopping_basket,
          color: Color(0xFFD17E50), size: 12.0),
        SizedBox(width: 5),
        Text('Add to cart',
            style: TextStyle(
                fontFamily: 'Varela',
                color: Color(0xFFD17E50),
                fontSize: 12.0))
      ],
    );
  }
}