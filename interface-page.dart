import 'package:car_store_online/home_page.dart';
import 'package:flutter/material.dart';

class InterfacePage extends StatefulWidget {
  const InterfacePage({super.key});

  @override
  State<InterfacePage> createState() => _InterfacePageState();
}

class _InterfacePageState extends State<InterfacePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Container(
        decoration:const BoxDecoration(
          image: DecorationImage(
              image:AssetImage("images/interface-car.png"),
            fit: BoxFit.fill
          ),
        ),
        child: ListView(
          children: [
            Container(
              margin:const EdgeInsets.only(left:15,top: 30),
              child:const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.car_repair,color: Colors.deepPurple,size:45),
                  Text("CAR",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                  Text("s ",style: TextStyle(color: Colors.deepPurple,fontSize: 30,fontWeight: FontWeight.bold),),
                  Text("W",style: TextStyle(color: Colors.orange,fontSize: 25,fontWeight: FontWeight.bold),),
                  Text("O",style: TextStyle(color: Colors.deepPurple,fontSize: 30,fontWeight: FontWeight.bold),),
                  Text("RLD",style: TextStyle(color: Colors.orange,fontSize: 20,fontWeight: FontWeight.bold),)
                ],
              ),
            ) ,

              Container(
                height: 200,
                margin:const EdgeInsets.only(left: 20,top: 40),
                child:const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("The Largest",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 14,color: Colors.black)),
                    Text("CARs MarketPlace",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 26,color: Colors.deepPurple)),
                    Text("In The World",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 14,color: Colors.orange)),
                  ],
                ),
              ),

            Container(
              margin:const EdgeInsets.only(right: 220,left: 15),
              child: MaterialButton(onPressed: () {
                setState(() {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage(),));
                });
              },
                padding:const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                textColor:Colors.black ,
                splashColor: Colors.grey[800],
                color: Colors.deepPurple,
                child:const Text("Entry Into The Market",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15)),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
