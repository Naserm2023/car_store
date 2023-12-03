import 'package:car_store_online/item_details.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List categories = [
    {"image-logo" : "images/bmw-logo.png" , "title" : "B M W"},
    {"image-logo" : "images/volvo-logo.png" , "title" : "Volvo"},
    {"image-logo" : "images/honda-logo.png" , "title" : "Honda"},
    {"image-logo" : "images/merc-logo.png" , "title" : "Mercedes"},
  ];

  List bestselling = [
    {"image":"images/bmw-car.png", "title":"BMW Car", "subtitle":"BMW M2 2017", "price":"38.000\$"},
    {"image":"images/merc-car.png", "title":"Mercedes-Benz Car", "subtitle":"A-Class CLA 200 D", "price":"40.000\$"},
    {"image":"images/honda-car.png", "title":"Honda Car", "subtitle":"Honda Accord 2014", "price":"26.200\$"},
    {"image":"images/volvo-car.png", "title":"Volvo Car", "subtitle":"Volvo V90 AB", "price":"33.700\$"},
    {"image":"images/volvo-bigcar.png", "title":"Volvo Car Truck", "subtitle":"Volvo FH AB", "price":"18.000\$"},
    {"image":"images/merc-bigcar.png", "title":"Mercedes-Benz Truck", "subtitle":"Mercedes Actros", "price":"21.000\$"},
  ];

  int navegationindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          backgroundColor: Colors.orange,
          child: const Icon(Icons.search,size: 30),
          onPressed: () async {
            await showSearch(
              context: context,
              delegate: CustomSearchDelegate(),
            );
          },
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex:navegationindex ,
        onTap: (value) {
          setState(() {
            navegationindex = value;
          });
        },
        iconSize: 40,
        selectedItemColor: Colors.orange,

        items:const [
          BottomNavigationBarItem(
              icon:Icon(Icons.home_outlined),
              label: ""
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.shopping_bag_outlined),
              label: ""
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.person_2_outlined),
              label: ""
          ),
        ],
      ),


      body: Container(
        padding:const EdgeInsets.all(20),

        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.grey[200],
                        filled: true,
                        hintText: "Search",
                        prefixIcon:const Icon(Icons.search,size: 30,),
                        prefixIconColor: Colors.grey[800],
                      ),
                    )),
                Padding(
                  padding:const EdgeInsets.only(left: 10),
                    child: IconButton(
                      onPressed: (){},
                     icon:const Icon(Icons.menu,size: 40)
                    ),
                ),
              ]
            ),

            Container(
              margin:const EdgeInsets.symmetric(vertical: 30,horizontal: 10),
              child:const Text("Categories",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),
            ),

            Container(
              height: 100,
              margin:const EdgeInsets.only(left: 10),

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:categories.length ,
                  itemBuilder: (context, index) {
                    return  Container(
                      margin:const EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(100),
                             // border: Border.all(width: 3,color: Colors.orange)
                            ),
                            height: 70,
                            width: 70,
                            child: Image.asset(categories[index]['image-logo']),
                          ),
                          Container(
                            margin:const EdgeInsets.only(top: 10),
                            child: Text(categories[index]['title'],style:const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black )),
                          ),
                        ],
                      ),
                    );
                  },
              ),
            ),

            Container(
              margin:const EdgeInsets.symmetric(vertical: 30,horizontal: 10),
              child:const Text("Best Selling",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),
            ),

            GridView.builder(
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent:300,
                ),
              physics:const NeverScrollableScrollPhysics(),
              shrinkWrap: true,

                itemCount:bestselling.length ,
                itemBuilder: (context, index) {
                  return  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ItemDetails(data:bestselling[index] )));
                      });
                    },
                    child: Card(
                      margin:const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                           // padding:const EdgeInsets.all(1),
                            height: 200,
                            color: Colors.grey[200],
                            child: Image.asset(bestselling[index]['image'],fit: BoxFit.fill),
                          ),
                          Container(
                            margin:const EdgeInsets.only(top: 10,bottom: 5),
                            padding:const EdgeInsets.only(left: 10),
                            child: Text(bestselling[index]['title'],style:const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)),
                          ),
                          Container(
                            margin:const EdgeInsets.only(bottom: 8),
                            padding:const EdgeInsets.only(left: 10),
                            child: Text(bestselling[index]['subtitle'],style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold,fontSize: 14)),
                          ),
                          Container(
                            padding:const EdgeInsets.only(left: 10),
                            child: Text(bestselling[index]['price'],style:const TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,fontSize: 15)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
            ),


          ],
        ),
      ),

    );
  }
}


class CustomSearchDelegate extends SearchDelegate<String> {
  // Dummy list
  final List<String> searchList = [
 "bmw car",
 "mercedes car",
 "mercedes truck",
 "honda car",
 "volvo car",
 "volvo truck",
  ];

  // These methods are mandatory you cannot skip them.

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          // When pressed here the query will be cleared from the search bar.
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
      // Exit from the search screen.
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<String> searchResults = searchList
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index]),
          onTap: () {
            // Handle the selected search result.
            close(context, searchResults[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestionList = query.isEmpty
        ? []
        : searchList
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            query = suggestionList[index];
            // Show the search results based on the selected suggestion.
          },
        );
      },
    );
  }
}
