import 'package:flutter/material.dart';

void main() {
  runApp(WineShopApp());
}

class WineShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wine Shop',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: WineShopHome(),
    );
  }
}

class WineShopHome extends StatefulWidget { // Change to StatefulWidget
  @override
  _WineShopHomeState createState() => _WineShopHomeState();
}

class _WineShopHomeState extends State<WineShopHome> {
  // Example state variable
  String criteria = ''; // Track if a button is pressed

  final List<WineCategory>wineTypes=[
  WineCategory(
    criteria: "Type",
    category:"Red Wines",
    imageUrl:"images/wine1.jpg",
  ),
  WineCategory(
    category:"White Wines",
    criteria: "Type",
    imageUrl:"images/win2.jpg",
  ),
  WineCategory(
    category:"Rose Wines",
    criteria: "Type",
    imageUrl:"images/wine3.jpg",
  ),
  WineCategory(
    category:"Style",
    criteria: "Young Wines",
    imageUrl:"images/wine4.jpg",
  ),
  WineCategory(
    category:"Matured Wines",
    criteria: "Style",
    imageUrl:"images/wine1.jpg",
  ),
  WineCategory(
    category:"Mix/Coupage",
    criteria: "Style",
    imageUrl:"images/wine1.jpg",
  ),
  WineCategory(
    category:"Romanians Wines",
    criteria: "Country",
    imageUrl:"images/wine1.jpg",
  ),
  WineCategory(
    category:"Italy",
    criteria: "Country",
    imageUrl:"images/wine1.jpg",
  ),
  WineCategory(
    category:"French Wines",
    criteria: "Country",
    imageUrl:"images/wine1.jpg",
  ),
   WineCategory(
    category:"German Wines",
    criteria: "Country",
    imageUrl:"images/wine1.jpg",
  ),
   WineCategory(
    category:"Sauvignon Blanc",
    criteria: "Grape",
    imageUrl:"images/wine1.jpg",
  ),
   WineCategory(
    category:"France",
    criteria: "Grape",
    imageUrl:"images/wine1.jpg",
  ),
  ];

  final List<Wine> wines = [
    Wine(
      name: "Ocone Bozzovich Beneventano Bianco IGT",
      type: "Red wine",
      price: "₹ 23,256,567",
      criticsScore: "94/100",
      availability: "Unavailable",
      imageUrl: "images/wine4.jpg",
    ),
    Wine(
      name: "Ocone Bozzovich Beneventano Bianco IGT",
      type: "Red wine",
      price: "₹ 23,256,678",
      criticsScore: "94/100",
      availability: "Available",
      imageUrl: "images/wine1.jpg",
    ),
    Wine(
      name: "Ocone Bozzovich Beneventano Bianco IGT",
      type: "Red wine",
      price: "₹ 23,256,865",
      criticsScore: "94/100",
      availability: "Unavailable",
      imageUrl: "images/win2.jpg",
    ),
    Wine(
      name: "Ocone Bozzovich Beneventano Bianco IGT",
      type: "Red wine",
      price: "₹ 23,,453,256",
      criticsScore: "94/100",
      availability: "Unavailable",
      imageUrl: "images/wine3.jpg",
    ),
    Wine(
      name: "Ocone Bozzovich Beneventano Bianco IGT",
      type: "Red wine",
      price: "₹ 23,123,256",
      criticsScore: "94/100",
      availability: "Available",
      imageUrl: "images/wine4.jpg",
    ),
    Wine(
      name: "Ocone Bozzovich Beneventano Bianco IGT",
      type: "Red wine",
      price: "₹ 23,123,256",
      criticsScore: "94/100",
      availability: "Available",
      imageUrl: "images/wine1.jpg",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Icon(Icons.location_on, color: Colors.grey), 
          SizedBox(width: 8.0), // Space between icon and text
          Column(
            children: [
              Text(
                "Donnerville Drive", 
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Fredoka',
                ),
              ),
            ],
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.only(left: 10.0), // Padding for the subtitle
        child: Text(
          "4 Donnerville Hall, Donnerville Drive, Adnaston..", // Small subtitle
          style: TextStyle(color: Colors.grey, fontSize: 14.0,  fontFamily: 'Fredoka',),
        ),
      ),
    ],
  ),
  
  actions: [
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.grey), 
      ),
      child: IconButton(
        icon: Icon(Icons.notifications), 
        onPressed: () {    
        },
      ),
    ),
  ],
),

     body: SingleChildScrollView( // Allows all contents to scroll
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search TextField
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          // Section Title
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Shop wines by',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Fredoka',),
            ),
          ),
          // Button Row
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 5, 10.0, 5),
            child: Row(
              children: [
                // Buttons for Type, Style, Country, Grape
                buildFilterButton('Type'),
                SizedBox(width: 10.0),
                buildFilterButton('Style'),
                SizedBox(width: 10.0),
                buildFilterButton('Country'),
                SizedBox(width: 10.0),
                buildFilterButton('Grape'),
              ],
            ),
          ),
          // Horizontal List of Wine Types
          Container(
            height: 194, // Set a specific height for the list
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: wineTypes.length,
              itemBuilder: (context, index) {
                return WineCategoryCard(category: wineTypes[index]);
              },
            ),
          ),
          // Row for Title and View All
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Wine",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Raleway',),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  "view all",
                  style: TextStyle(color: const Color.fromARGB(255, 169, 56, 48), fontFamily: 'Raleway',),
                ),
              ),
            ],
          ),
          // Vertical List of Wines
          ListView.builder(
            physics: NeverScrollableScrollPhysics(), // Disable scrolling for this ListView
            shrinkWrap: true, // Allow the ListView to take only the needed space
            itemCount: wines.length,
            itemBuilder: (context, index) {
              return WineCard(wine: wines[index]);
            },
          ),
        ],
      ),
    ),
  );
}

Widget buildFilterButton(String type) {
  return Container(
    child: Center(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            criteria = type; // Update the criteria based on the button pressed
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: criteria == type
              ? const Color.fromARGB(240, 237, 170, 170)
              : const Color.fromARGB(255, 255, 255, 255),
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(
              color: criteria == type
                  ? const Color.fromARGB(255, 186, 27, 16)
                  : const Color.fromARGB(255, 209, 151, 151),
              width: criteria == type ? 1 : 0,
            ),
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 9),
          child: Center(
            child: Text(
              type,
              style: TextStyle(
                color: criteria == type
                    ? const Color.fromARGB(255, 99, 13, 8)
                    : const Color.fromARGB(255, 63, 61, 61),
                fontWeight: criteria == type ? FontWeight.bold : FontWeight.normal,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
}

class Wine {
  final String name;
  final String type;
  final String price;
  final String criticsScore;
  final String availability;
  final String imageUrl;

  Wine({
    required this.name,
    required this.type,
    required this.price,
    required this.criticsScore,
    required this.availability,
    required this.imageUrl,
  });
}

class WineCard extends StatefulWidget {
  final Wine wine;

  WineCard({required this.wine});

  @override
  _WineCardState createState() => _WineCardState();
}

class _WineCardState extends State<WineCard> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)), // Match the card's top border radius
                  child: Image.network(
                    widget.wine.imageUrl, width: 100, height: 160,
                    fit: BoxFit.cover,
                     ),),
                     SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(3, 2, 3, 2),
                        //height: 24,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: widget.wine.availability == "Available"
                              ? const Color.fromARGB(40, 76, 175, 79)
                              : const Color.fromARGB(54, 244, 67, 54),),
                       child:Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                          child: Text(
                        widget.wine.availability,
                        style: TextStyle(
                          color: widget.wine.availability == "Available"
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                        ),
                        ],)
                                            
                      ),
                      SizedBox(height: 8),
                      Text(
                        widget.wine.name,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(widget.wine.type),
                      Text('Critics\' Scores: ${widget.wine.criticsScore}'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isAdded = !isAdded; 
                        });
                      },
                      child: Container(  
                        height: 29,  
                        width: 110,
                        decoration: BoxDecoration(
                          color: isAdded? const Color.fromARGB(255, 247, 105, 105):const Color.fromARGB(255, 255, 255, 255), 
                          borderRadius: BorderRadius.circular(15.0),
                        ),                                                                            
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Row(
                          children: [
                            Icon(
                              isAdded ? Icons.favorite : Icons.favorite_border,                              
                              color: isAdded? const Color.fromARGB(255, 255, 255, 255):const Color.fromARGB(255, 0, 0, 0),
                            ),
                            SizedBox(width: 7),
                            Text(
                              isAdded ? "Added" : "Favourite",
                              style: TextStyle(color: isAdded? const Color.fromARGB(255, 255, 255, 255):const Color.fromARGB(255, 0, 0, 0),fontSize: 13,fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(left: 20),
                child:Text(widget.wine.price, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)))
                ,
              ],
            ),
            SizedBox(height: 10), // Spațiu suplimentar între rânduri
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("Critics' scores: "),
                    Text(widget.wine.criticsScore),
                  ],
                ),
                Text("Bottle(750 ml)"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
 class WineCategory {
  final String criteria;
  final String category;
  final String imageUrl;

  WineCategory({
    required this.criteria,
    required this.category,
    required this.imageUrl,
  });
}  

//lista cu tipurile de vin dupa criterii(tip, stil, tara, varietate de struguri)
class WineCategoryCard extends StatefulWidget {
  final WineCategory category;

  WineCategoryCard({required this.category});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<WineCategoryCard>{
String criteria='';
@override
Widget build(BuildContext context) {
  return Container(
    constraints: BoxConstraints(maxHeight: 250),
    width: 160,
    child: Card(
      margin: const EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)), // Match the card's top border radius
            child: Image.network(
              widget.category.imageUrl,
              width: double.infinity,
              height: 140,
              fit: BoxFit.cover,
            ),),
          // Category text
          Padding(
            padding: const EdgeInsets.only(top:7.0),
            child:Text(
              widget.category.category,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}
