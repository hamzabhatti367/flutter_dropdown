import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class DropDownMenuButton extends StatefulWidget {
  DropDownMenuButton({super.key});

  @override
  State<DropDownMenuButton> createState() => _DropDownMenuButtonState();
}

class _DropDownMenuButtonState extends State<DropDownMenuButton> {
  final List<String> currency = [
    'USD',
    'EUR',
    'GBP',
    'BRL',
    'CAD',
    'AUD',
    'JPY',
    'CHF',
  ];

  String? selectedCurrency;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DropDownMenu Button'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: DropdownButtonFormField2(
              decoration: InputDecoration(
                //Add isDense true and zero Padding.
                //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  // borderRadius: BorderRadius.circular(15),
                ),
                //Add more decoration as you want here
                //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
              ),
              isExpanded: true,
              hint: Text(
                'Currency',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              items: currency
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
                            fontSize: 14,
                            //fontFamily: AppFont.interregular,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return 'Please select Currency';
                }
                return null;
              },
              value: selectedCurrency,
              onChanged: (value) {
                setState(() {
                  selectedCurrency = value;
                });
              },
              // onSaved: (value) {
              //   selectedCurrency = value.toString();
              // },
              buttonStyleData: ButtonStyleData(
                height: 47,
                padding: EdgeInsets.only(right: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    topLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  color: Colors.cyan,
                ),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.black,
                ),
                iconSize: 25,
              ),
              dropdownStyleData: const DropdownStyleData(
                maxHeight: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
