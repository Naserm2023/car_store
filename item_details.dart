import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget {
  final data;
  const ItemDetails({super.key, this.data});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {

  int navegationindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

      endDrawer:const Drawer(),
 appBar: AppBar(
  backgroundColor: Colors.grey[200],
  iconTheme:const IconThemeData(
    color: Colors.black,
    size: 30,
  ),
  title:const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.car_repair,color: Colors.deepPurple,size:45),
      Text("CAR",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
      Text("s ",style: TextStyle(color: Colors.deepPurple,fontSize: 30,fontWeight: FontWeight.bold),),
      Text("W",style: TextStyle(color: Colors.orange,fontSize: 25,fontWeight: FontWeight.bold),),
      Text("O",style: TextStyle(color: Colors.deepPurple,fontSize: 30,fontWeight: FontWeight.bold),),
      Text("RLD",style: TextStyle(color: Colors.orange,fontSize: 20,fontWeight: FontWeight.bold),)
    ],
  ) ,
),

      body: Container(
        padding:const EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              height: 350,
              margin:const EdgeInsets.only(bottom: 20),
              child: Image.asset(widget.data['image'],fit: BoxFit.fill),
            ),

            Container(
              margin:const EdgeInsets.only(bottom: 10),
              child: Text(widget.data['title'],textAlign: TextAlign.center,style:const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25)),
            ),

            Container(
              margin:const EdgeInsets.only(bottom: 20),
              child: Text(widget.data['subtitle'],textAlign: TextAlign.center,style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold,fontSize: 17)),
            ),

            Container(
              margin:const EdgeInsets.only(bottom: 25),
              child: Text(widget.data['price'],textAlign: TextAlign.center,style:const TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,fontSize: 22)),
            ),

            Row(
              children: [
                Container(
                  margin:const EdgeInsets.only(left: 30),
                    child: Text("COLOR : ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey[600]),),
                ),

                Container(
                  width: 20,
                  height: 20,
                  margin:const EdgeInsets.only(left: 10,right: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.circular(100)
                  ),
                ),

                Text("Grey",style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold,fontSize: 18),),

                Container(
                  width: 20,
                  height: 20,
                  margin:const EdgeInsets.only(left: 20,right: 5),
                  decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(100)
                  ),
                ),

                Text("Blue",style: TextStyle(color: Colors.blue[600],fontWeight: FontWeight.bold,fontSize: 18),),

                Container(
                  width: 20,
                  height: 20,
                  margin:const EdgeInsets.only(left: 20,right: 5),
                  decoration: BoxDecoration(
                      color: Colors.red[800],
                      borderRadius: BorderRadius.circular(100)
                  ),
                ),

                Text("Red",style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold,fontSize: 18),),
              ],
            ),

            Container(
              margin:const EdgeInsets.symmetric(vertical: 25,horizontal: 50),
              child: MaterialButton(onPressed: () {},
              color: Colors.black,
                padding:const EdgeInsets.all(15),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)) ,
                child:const Text("+Add To Cart",style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold)),
              ),
            ),

          ],

        ),
      ),
    );
  }
}
