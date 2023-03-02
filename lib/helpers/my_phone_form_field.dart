// ignore_for_file: avoid_dynamic_calls,

import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';

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

  CountryWithPhoneCode get _countryWithPhoneCode {
    return CountryWithPhoneCode.getCountryDataByPhone(phoneNumber) ??
        const CountryWithPhoneCode.us();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.phone,
            controller: widget.controller,
            style: satoshiMedium14,
            validator: widget.doNotValidate!
                ? null
                : (value) {
                    if (value!.isEmpty) {
                      return 'Enter a valid phone number';
                    }
                    return null;
                  },
            inputFormatters: [
              LibPhonenumberTextFormatter(
                country: _countryWithPhoneCode,
              )
            ],
            decoration: phoneNumberInputDecoration.copyWith(
              prefixIcon: FittedBox(
                fit: BoxFit.fitWidth,
                child: CountryCodePicker(
                  onInit: (value) {
                    countryCode = value!.dialCode!;
                    initialCountryCode = value.dialCode!;
                    widget.countryCodeController?.text = value.dialCode!;
                  },
                  // showDropDownButton: true,
                  onChanged: (value) {
                    countryCode = value.dialCode!;
                    widget.countryCodeController?.text = countryCode;
                    setState(() {});
                  },

                  // Initial selection and favorite can be
                  //one of code ('IT') OR dial_code('+39')
                  initialSelection: widget.countryCodeController?.text != ''
                      ? widget.countryCodeController?.text
                      : 'NG',
                  textStyle: satoshiMedium14.copyWith(color: oneA1A1A),
                  favorite: const [
                    'NG',
                    'GH',
                    'US',
                    'UG',
                    'RW',
                  ],
                  padding: const EdgeInsets.all(8),

                  // flagWidth: 24,
                  dialogTextStyle: satoshiMedium14,

                  // optional. Shows only country name and flag
                  // showCountryOnly: false,

                  // optional. Shows only country name
                  //and flag when popup is closed.
                  // showOnlyCountryWhenClosed: false,
                  // optional. aligns the flag and the Text left
                  // alignLeft: false,
                ),
              ),
            ),
            onChanged: (value) async {
              if (value.contains(countryCode)) {
                setState(() {
                  phoneNumber = value;
                  //log(phoneNumber);
                });
              } else {
                setState(() {
                  phoneNumber = countryCode + value;
                  //log(phoneNumber);
                });
              }
            },
            textInputAction: TextInputAction.next,
          ),
        ),
      ],
    );
  }
}
