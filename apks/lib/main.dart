// main.dart

import 'dart:convert';

import 'package:apks/convert/convert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Data"),
        backgroundColor: Colors.amber,
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text("TRENDING......"),
        
            Container(
              height: 400,
        
              child: FutureBuilder(future:jsondata() , builder: (context,snapshort)
              {
              
                if(snapshort.connectionState==ConnectionState.done&&snapshort.hasData)
                {
                  List<dynamic>newdata=snapshort.data!;
                  return ListView.builder( scrollDirection: Axis.horizontal,
                    itemCount: newdata.length,
                    itemBuilder: (context,index)
                  {
                     UserModel newitem=newdata[index];
                     return Container(
                   decoration: BoxDecoration(color: Colors.grey[300],
                   borderRadius: BorderRadius.circular(15)
                   ),
                      width: MediaQuery.of(context).size.width*0.7,
                      height: MediaQuery.of(context).size.height*0.4,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.network(newitem.image_url,height: 300,width: 300,),
                          Text(newitem.name!,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          Text("Size:${newitem.size}",style:TextStyle(color: Colors.blueAccent,fontSize: 20),)
                        ],
                      ),
                     );
                  });
                }
                
                return Center(child: CircularProgressIndicator(),);
              }
              
              ),
            ),
            SizedBox(
              height: 20,
            )
        
            ,Container(
              height: 400,
              child:FutureBuilder(future:jsondata() , builder: (context,snapshort)
              {
              
                if(snapshort.connectionState==ConnectionState.done&&snapshort.hasData)
                {
                  List<dynamic>newdata=snapshort.data!;
                  return ListView.builder( scrollDirection: Axis.vertical,
                    itemCount: newdata.length,
                    itemBuilder: (context,index)
                  {
                     UserModel newitem=newdata[index];
                     return Container(
                   decoration: BoxDecoration(color: Colors.black26,
                   borderRadius: BorderRadius.circular(15)
                   ),
                      width: MediaQuery.of(context).size.width*0.5,
                      height: MediaQuery.of(context).size.height*0.7,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.network(newitem.image_url,height: 300,width: 300,),
                          Text(newitem.name!,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          Text("Size:${newitem.size}",style:TextStyle(color: Colors.blueAccent,fontSize: 20),)
                        ],
                      ),
                     );
                  });
                }
                
                return Center(child: CircularProgressIndicator(),);
              }
              
              )  ,
             )
  
        
        ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()
      {
        jsondata();
      }),
    );
  }
  Future<List<dynamic>>jsondata()async
  {
        final jsondata = await rootBundle.rootBundle.loadString('json/image.json');
        //  print(jsondata);

    List<dynamic> mapdata=jsonDecode(jsondata);
     
   
      // UserModel newdata=UserModel.FromMap(mapdata);

      // print(newdata.name);
      
    return mapdata.map((e) => UserModel.FromMap(e)).toList();
  }
}
