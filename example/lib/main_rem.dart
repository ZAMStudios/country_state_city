import 'package:country_state_city/models/country.dart';
import 'package:country_state_city/utils/city_utils.dart';
import 'package:country_state_city/utils/country_utils.dart';
import 'package:country_state_city/utils/state_utils.dart';
import 'package:flutter/material.dart';

void main() => runApp(MySample());


class MySample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MySampleState();
  }
}

class MySampleState extends State<MySample> {
  List<Country> _countryList = [];
 Country? selectedCountry;

  @override
  void initState() {
    getAllCountriesData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Credit Card View Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(children: [
          Container(
            height: 43,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              border: Border.all(),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<Country>(
                isExpanded: true,
                // Initial Value
                value: selectedCountry,
                hint: const Text('Please choose country'),

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: _countryList.map((Country items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items.name),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (newVal) {
                  selectedCountry = newVal;
                  print(selectedCountry!.name);
                  setState(() {

                  });

                }
              ),
            ),
          ),


        ],),
      ),
      // home: ExistingCardsPage(),
    );
  }

  Future<void> getAllCountriesData() async {
    // Get all countries
    _countryList = await getAllCountries();

  }

}
