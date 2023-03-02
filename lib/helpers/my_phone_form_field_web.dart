// ignore_for_file: avoid_dynamic_calls,

import 'dart:developer';

import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
// import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';

class MyPhoneField extends StatefulWidget {
  const MyPhoneField({
    Key? key,
    this.hintText,
    required this.controller,
    this.countryCodeController,
    this.title,
    this.doNotValidate = false,
    this.isRequired = true,
  }) : super(key: key);

  final String? hintText;
  final TextEditingController controller;
  final String? title;
  final TextEditingController? countryCodeController;
  final bool? doNotValidate;
  final bool? isRequired;

  @override
  State<MyPhoneField> createState() => _MyPhoneFieldState();
}

class _MyPhoneFieldState extends State<MyPhoneField> {
  String countryCode = '+234';
  String phoneNumber = '';
  String initialCountryCode = '+234';
  String initialCountryCodeFormatter = 'NG';
  PhoneCountryData? _initialCountryData;

  // CountryWithPhoneCode get _countryWithPhoneCode {
  //   return CountryWithPhoneCode.getCountryDataByPhone(phoneNumber) ??
  //       const CountryWithPhoneCode.us();
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: CountryDropdown(
            printCountryName: true,
            initialCountryCode: 'NG',
            decoration: inputDecoration,
            onCountrySelected: (PhoneCountryData countryData) {
              setState(() {
                countryCode = countryData.phoneCode ?? '+234';
                widget.countryCodeController?.text = countryCode;
                _initialCountryData = countryData;
              });
            },
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          flex: 5,
          child: TextFormField(
            key: ValueKey(_initialCountryData ?? 'country'),
            decoration: phoneNumberInputDecoration.copyWith(
              hintText: _initialCountryData?.phoneMaskWithoutCountryCode,
            ),
            controller: widget.controller,
            keyboardType: TextInputType.phone,
            inputFormatters: [
              PhoneInputFormatter(
                allowEndlessPhone: false,
                defaultCountryCode: _initialCountryData?.countryCode,
              )
            ],
            onChanged: (value) {
              if (value.contains(countryCode)) {
                setState(() {
                  phoneNumber = value;
                  log(phoneNumber);
                });
              } else {
                setState(() {
                  phoneNumber = countryCode + value;
                  log(phoneNumber);
                });
              }
            },
          ),
        )
        // Expanded(
        //   child: TextFormField(
        //     keyboardType: TextInputType.phone,
        //     controller: widget.controller,
        //     style: satoshiMedium14,
        //     validator: widget.doNotValidate!
        //         ? null
        //         : (value) {
        //             if (value!.isEmpty) {
        //               return 'Enter a valid phone number';
        //             }
        //             return null;
        //           },
        //     // inputFormatters: [
        //     //   LibPhonenumberTextFormatter(
        //     //     country: _countryWithPhoneCode,
        //     //   )
        //     // ],
        //     inputFormatters: [
        //       // PhoneInputFormatter(
        //       //   onCountrySelected: initialCountryCodeFormatter,
        //       //   allowEndlessPhone: true,
        //       // )
        //     ],
        //     decoration: phoneNumberInputDecoration.copyWith(
        //       prefixIcon: FittedBox(
        //         fit: BoxFit.fitWidth,
        //         child: CountryCodePicker(
        //           onInit: (value) {
        //             countryCode = value!.dialCode!;
        //             initialCountryCode = value.dialCode!;
        //             widget.countryCodeController?.text = value.dialCode!;
        //           },
        //           // showDropDownButton: true,
        //           onChanged: (value) {
        //             countryCode = value.dialCode!;
        //             log(value.code!);
        //             widget.countryCodeController?.text = countryCode;
        //             setState(() {
        //               log('countryCode: $countryCode');
        //             });
        //           },

        //           // Initial selection and favorite can be
        //           //one of code ('IT') OR dial_code('+39')
        //           initialSelection: widget.countryCodeController?.text != ''
        //               ? widget.countryCodeController?.text
        //               : 'NG',
        //           textStyle: satoshiMedium14.copyWith(color: oneA1A1A),
        //           favorite: const [
        //             'NG',
        //             'GH',
        //             'US',
        //             'UG',
        //             'RW',
        //           ],
        //           padding: const EdgeInsets.all(8),

        //           // flagWidth: 24,
        //           dialogTextStyle: satoshiMedium14,
        //         ),
        //       ),
        //     ),
        //     onChanged: (value) async {
        //       if (value.contains(countryCode)) {
        //         setState(() {
        //           phoneNumber = value;
        //           //log(phoneNumber);
        //         });
        //       } else {
        //         setState(() {
        //           phoneNumber = countryCode + value;
        //           //log(phoneNumber);
        //         });
        //       }
        //     },
        //     textInputAction: TextInputAction.next,
        //   ),
        // ),
      ],
    );
  }
}
