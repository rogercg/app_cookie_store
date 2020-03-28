import 'package:app_cookie_store/cookie_page.dart';
import 'package:flutter/material.dart';

import 'bottom_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /* IMPORTANTE: El Material App en ciertos casos(como el actual) debe ir separado del Scaffold para evitar conflicto. Recordemos que cada pagina/vista maneja un scaffold diferente, pero un solo materialApp */
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAppHome(),
    );
  }
}

class MyAppHome extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppHome> with SingleTickerProviderStateMixin{
  TabController _tabController;
  ScrollController _scrollController;
  bool fixedScroll;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _tabController.addListener(_smoothScrollToTop);
  }

  _scrollListener() {
    if (fixedScroll) {
      _scrollController.jumpTo(0);
    }
  }

  _smoothScrollToTop() {
    try {
      _scrollController?.animateTo( 0, duration: Duration(microseconds: 300), curve: Curves.ease);
    } catch (e) {
      print('Controlando error');
    }
    

    setState(() {
      fixedScroll = _tabController.index == 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)), 
            onPressed: (){}
          ),
          title: Text(
            'Pickup',
            style: TextStyle(fontFamily: 'Varela', fontSize: 20.0, color: Color(0xFF545D68)),
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.notifications_none, color:  Color(0xFF545D68)), onPressed: null)
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, value){
            return [];
          },
          body: ListView(
            padding: EdgeInsets.only(left: 20.0),
            children: <Widget>[
              SizedBox(height: 15.0),
              Text(
                'Categories', 
                style: TextStyle(fontFamily: 'Varela', fontSize: 42.0, fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 15.0),
              TabBar(
                controller: _tabController,
                indicatorColor: Colors.transparent,
                labelColor: Color(0xFFC88D67),
                isScrollable: true,
                labelPadding: EdgeInsets.only(right: 45.0),
                unselectedLabelColor: Color(0xFFCDCDCD),
                tabs: [// Tabs Header
                  Tab(
                    child: Text('Cookies', style: TextStyle(fontFamily: 'Varela', fontSize: 21)),
                  ),
                  Tab(
                    child: Text('Cookie Cake', style: TextStyle(fontFamily: 'Varela', fontSize: 21)),
                  ),
                  Tab(
                    child: Text('Ice Cream', style: TextStyle(fontFamily: 'Varela', fontSize: 21)),
                  )
                ],
              ),
              Container(
                  height: MediaQuery.of(context).size.height - 50.0,
                  width: double.infinity,
                  child: TabBarView(// Tabs Views
                  physics: ScrollPhysics(),
                    controller: _tabController,
                    children: [
                      CookiePage(),
                      Container(),
                      Container(),
                    ]
                  )
                )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          backgroundColor: Color(0xFFF17532),
          child: Icon(Icons.fastfood),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,// Ubicamos un botón flotante a medio salir de nuestro bottomNavigationBar
        bottomNavigationBar: BottomBar(),
      );
  }

  
}