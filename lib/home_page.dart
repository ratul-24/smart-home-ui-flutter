import 'package:flutter/material.dart';
import 'package:my_home/devices_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List devices=[
    ["Smart AC", 'lib/pics/air-conditioner.png', false],
    ["Smart Light", 'lib/pics/light-bulb.png', true],
    ["Smart TV", 'lib/pics/smart-tv.png', false],
    ["Smart Fan", 'lib/pics/fan.png', false],
  ];
  void toggle(bool value, int index){
    setState(() {
      devices[index][2]=value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 146, 166, 178),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Image.asset('lib/pics/menu.png', height: 60, color: Colors.black,),
            const Icon(Icons.person, size: 60, color: Colors.black,),
          ],
          ),
          ),
          const SizedBox(height: 40,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome Home!", style: TextStyle(fontWeight: FontWeight.bold),),
                Text("Ratul", 
                style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Divider(
              thickness: 1,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20,),
          const Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Text("Smart Devices", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          ),
          Expanded(
            child: GridView.builder(
            padding: const EdgeInsets.all(20 ),
            itemCount: devices.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1/1.25),
            itemBuilder: (context, index) {
              return DeviceBox(
                name: devices[index][0],
                path: devices[index][1],
                power: devices[index][2],
                onChanged: (value)=>toggle(value,index),
              );
            },
            ),
          ),

          
        ],
        ),
        
        
      ),
     
    );
  }
}