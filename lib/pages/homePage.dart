import 'package:assignment/pages/dummybuttonpage.dart';
import 'package:assignment/pages/movieDetail.dart';
import 'package:assignment/components/moviecomp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import '../StateManagement/poviderStateM.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  TextEditingController controller = new TextEditingController();
  bool isLoading = true;

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();

  int _index = 0;

  initState() {
    super.initState();
    context.read<Notifiers>().fetchMovies(context);
  }

  Widget build(BuildContext context) {


    return  SafeArea(
      child: Scaffold(key: _scaffoldState,
          endDrawer: Drawer(child: Text("Drawer"),),
          bottomNavigationBar: Material(
        child: BottomNavigationBar(type: BottomNavigationBarType.fixed,onTap: (newIndex){
          setState(() {
            _index = newIndex;
            if(_index==0)
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
              }
            if(_index==1)
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DummyPage(pageName: 'favorite',)));
            }
            if(_index==2)
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DummyPage(pageName: 'bookmark',)));
            }
            if(_index==3)
            {
              _scaffoldState.currentState!.openEndDrawer();
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>DummyPage(pageName: 'menu',)));
            }
          });

        },
          currentIndex:  _index,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.orange,
          items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,semanticLabel: 'home',),label: 'home',),
          BottomNavigationBarItem(icon: Icon(Icons.favorite,semanticLabel: 'favorite',),label: 'favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark,semanticLabel: 'bookmark',),label: 'bookmark'),
          BottomNavigationBarItem(icon: Icon(Icons.menu,semanticLabel: 'menu',),label: 'menu'),
        ],),
      ) ,
          backgroundColor: Colors.black,
          body:  Consumer<Notifiers>(
            builder: (context, notifier, child){
              print("error is ${notifier.error}");
              WidgetsBinding.instance!.addPostFrameCallback((_){

                (notifier.error!='')?_scaffoldState.currentState!.showSnackBar(SnackBar(content: Text(notifier.error))):Text("");

              });

              return !notifier.isProcessing?SingleChildScrollView(
                  child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Container(
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(flex:2,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:  new CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: ClipRect(
                                      child: Image.network(
                                        'clock.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                ),
                                Text(
                                  "Mahdi Parekh",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),

                           Expanded(
                             child: Container(width: 200,height: 40,
                                color: Colors.grey[900],
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.search,color: Colors.grey[700],),
                                  ),
                                  Text("Search",style: TextStyle(color: Colors.grey[700],),)

                                ],)),
                           ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder:(context)=>DummyPage(pageName: "Movie Page")));
                              },
                                child: Container(width: 100,height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.white),
                                  child: Center(child: Text("Movies")),),
                              ),
                            ),
                          ),
                           Expanded(
                             child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(width: 100,height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.pink),
                                child: Center(child: Text("Shows")),),
                          ),
                           ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder:(context)=>DummyPage(pageName: "Moss Page")));
                              },
                                child: Container(width: 100,height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.white),
                                  child: Center(child: Text("Moss")),),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text("NEW",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          ),


                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height/2.5,width: MediaQuery.of(context).size.width,
                              child: ListView.builder(itemCount: notifier.movielist.length,scrollDirection: Axis.horizontal ,
                                  itemBuilder:(context,index){
                                 return Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: GestureDetector(onTap: (){
                                     Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetail(index: index,)));
                                   },
                                       child: MovieComp(imageUrl: notifier.movielist[index].posterurl)),
                                 );
                              }),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Container(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text("POPULAR",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          ),


                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height/2.5,width: MediaQuery.of(context).size.width,
                              child: ListView.builder(itemCount: notifier.movielist.length,scrollDirection: Axis.horizontal ,
                                  itemBuilder:(context,index){
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetail(index: index,)));
                                      },
                                          child: MovieComp(imageUrl: notifier.movielist[index].posterurl)),
                                    );
                              }),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Container(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text("TRENDING",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height/2.5,width: MediaQuery.of(context).size.width,
                              child: ListView.builder(itemCount: notifier.movielist.length,scrollDirection: Axis.horizontal ,
                                  itemBuilder:(context,index){
                                 return Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: GestureDetector(onTap: (){
                                     Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetail(index: index,)));
                                   },
                                       child: MovieComp(imageUrl: notifier.movielist[index].posterurl)),
                                 );
                              }),
                            ),
                          ),

                        ],
                      ),
                    ),

                  ],
                ),
              )):Center(child: CircularProgressIndicator());
            },
          )

    ));
  }
}
