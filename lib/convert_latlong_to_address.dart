import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class ConverLatLantToAddress extends StatefulWidget {
  const ConverLatLantToAddress({super.key});

  @override
  State<ConverLatLantToAddress> createState() => _ConverLatLantToAddressState();
}

class _ConverLatLantToAddressState extends State<ConverLatLantToAddress> {

  String stAddres='',stAddresFromCoordinates='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Map"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(stAddres),
          Text(stAddresFromCoordinates),
          GestureDetector(
            onTap: () async{

              // from flutter_geocoder api.....

              // From coordinates
              //final coordinates= Coordinates(26.74661446532923, 83.88779316518662);
              /*var address=await Geocoder.local.findAddressesFromCoordinates(coordinates);
              var first =address.first;
              ("Address "+first.featureName.toString()+first.addressLine.toString());*/
              // From a query
              /*final query ="Gorakhpur, Uttar Pradesh, India";
              var addresFromQuery=await Geocoder.local.findAddressesFromQuery(query);
              var firstFromQuery=addresFromQuery.first;
              print("Address from query ${firstFromQuery.featureName} : ${firstFromQuery.addressLine}");*/
              // From a query
              //final query = "1600 Amphiteatre Parkway, Mountain View";
              /*final query = "Gorakhpur";
              var addresses = await Geocoder.local.findAddressesFromQuery(query);
              var first11 = addresses.first;
              print("${first11.featureName} : ${first11.coordinates}");*/

              // from geocoding api....
              List<Location> locations = await locationFromAddress("Gronausestraat 710, Enschede");
              List<Placemark> placemarks = await placemarkFromCoordinates(20.5937, 78.9629);
              //final query ="Gorakhpur, Uttar Pradesh, India";
              setState(() {
                // from flutter_geocoder api.....

                //stAddres =first.featureName.toString() + " " + first.addressLine.toString();
                //stAddres =first.postalCode.toString();
                stAddres=locations.last.longitude.toString() +""+locations.last.latitude.toString();
                stAddresFromCoordinates=placemarks.reversed.last.country.toString();
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: const BoxDecoration(color: Colors.green),
                child: const Center(
                  child: Text("Convert"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
