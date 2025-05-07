import 'package:flutter/material.dart';

class HomeContentPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeContentPage> {
  int days = 1;
  String? selectedLocation;
  bool showError = false;
  String? selectedSize ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body:
      SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  child:Center(
                      child:
                      Text("Book Dumpsters",
                        style: TextStyle(
                            color: Colors.green[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),)),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Create Request",
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                Text("Start date"),
                TextField(
                  readOnly: true,
                  controller: TextEditingController(text: "16-04-2025"),
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                const SizedBox(height: 20),
                Text("Select number of days"),
                Row(
                  children: [
                    IconButton(
                      onPressed: () =>
                          setState(() => days = days > 1 ? days - 1 : 1),
                      icon: Icon(Icons.remove),
                    ),
                    Text("$days", style: TextStyle(fontSize: 18)),
                    IconButton(
                      onPressed: () => setState(() => days++),
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text("Delivery Location"),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    // Implement location picker logic
                    setState(() {
                      selectedLocation = "Sample Location";
                      showError = false;
                    });
                  },
                  child: InputDecorator(
                    decoration: InputDecoration(
                      hintText: "Select location",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.location_on, color: Colors.green),
                    ),
                    child: Text(selectedLocation ?? ""),
                  ),
                ),
                if (showError)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text("Please select an address",
                        style: TextStyle(color: Colors.red)),
                  ),
                const SizedBox(height: 20),

                const SizedBox(height: 20),
                Row(
                  children: [
                    Image.asset('assets/GWS logo.png',
                        width: 100), // Replace with real image
                    const SizedBox(width: 10),
                    Text("40 Yard Size\n450 USD",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Spacer(),
                    Radio<String>(
                      value: "40",
                      groupValue: selectedSize,
                      onChanged: (value) {
                        setState(() {
                          selectedSize = value;
                        });
                      },
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset('assets/GWS logo.png',
                        width: 100), // Replace with real image
                    const SizedBox(width: 10),
                    Text("30 Yard Size \n350 USD",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Spacer(),
                    Radio<String>(
                      value: "30",
                      groupValue: selectedSize,
                      onChanged: (value) {
                        setState(() {
                          selectedSize = value;
                        });
                      },
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset('assets/GWS logo.png',
                        width: 100), // Replace with real image
                    const SizedBox(width: 10),
                    Text("20 Yard Size \n250 USD",
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                    Spacer(),
                    Radio<String>(
                      value: "20",
                      groupValue: selectedSize,
                      onChanged: (value) {
                        setState(() {
                          selectedSize = value;
                        });
                      },
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 100),
                      child: ElevatedButton(
                        onPressed: () {
                          if (selectedLocation == null) {
                            setState(() => showError = true);
                          } else {
                            showDialog(context: context, builder: (context) => AlertDialog(actions: [
                              TextButton(onPressed: (){
                                Navigator.of(context).pop();
                              }, child: Text("Close")),
                            ],
                            title: Text("Booked"),),);
                            // Submit logic
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade100,
                        ),
                        child: Center(
                          child: Text("Book Now",
                              style: TextStyle(color: Colors.green)),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
