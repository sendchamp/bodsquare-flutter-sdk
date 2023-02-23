import 'package:flutter/material.dart';

// final _fallBacks = <String>[R.fontFamily.roboto];

const satoshiBold24 = TextStyle(
  //fontFamily: R.fontFamily.satoshi,
  height: 1.33,
  fontSize: 24,
  fontWeight: FontWeight.w700,
  //fontFamilyFallback: _fallBacks,
);

const satoshiBold20 = TextStyle(
  //fontFamily: R.fontFamily.satoshi,
  height: 1.2,
  fontSize: 20,
  fontWeight: FontWeight.w700,
  //fontFamilyFallback: _fallBacks,
);

const satoshiBold16 = TextStyle(
  //fontFamily: R.fontFamily.satoshi,
  height: 1.2,
  fontSize: 16,
  fontWeight: FontWeight.w700,
  //fontFamilyFallback: _fallBacks,
);
const satoshiMedium16 = TextStyle(
  //fontFamily: R.fontFamily.satoshi,
  height: 1.5,
  fontSize: 16,
  fontWeight: FontWeight.w500,
  //fontFamilyFallback: _fallBacks,
);

const satoshiMedium14 = TextStyle(
  //fontFamily: R.fontFamily.satoshi,
  height: 1.35,
  fontSize: 14,
  fontWeight: FontWeight.w500,
  //fontFamilyFallback: _fallBacks,
);

const satoshiRegular14 = TextStyle(
  //fontFamily: R.fontFamily.satoshi,
  height: 1.35,
  fontSize: 14,
  fontWeight: FontWeight.w400,
  //fontFamilyFallback: _fallBacks,
);

const satoshiRegular12 = TextStyle(
  //fontFamily: R.fontFamily.satoshi,
  height: 1.3,
  fontSize: 12,
  fontWeight: FontWeight.w400,

  //fontFamilyFallback: _fallBacks,
);

final RoundedRectangleBorder roundBox28 =
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(28));

final RoundedRectangleBorder roundBox4 =
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(4));

final borderRadius3 = BorderRadius.circular(3);
final borderRadius4 = BorderRadius.circular(4);

final borderRadius6 = BorderRadius.circular(6);

final borderRadius8 = BorderRadius.circular(8);
final borderRadius10 = BorderRadius.circular(10);
final borderRadius12 = BorderRadius.circular(12);
final borderRadius16 = BorderRadius.circular(16);
final borderRadius22 = BorderRadius.circular(22);
final borderRadius28 = BorderRadius.circular(28);

const borderRadiusTopLR32 = BorderRadius.only(
  topLeft: Radius.circular(32),
  topRight: Radius.circular(32),
);

const borderRadiusTopLR24 = BorderRadius.only(
  topLeft: Radius.circular(24),
  topRight: Radius.circular(24),
);

const borderRadiusTopRBottomR8 = BorderRadius.only(
  bottomRight: Radius.circular(8),
  topRight: Radius.circular(8),
);

final primaryButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: ffffff,
  backgroundColor: zero066FF,
  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
  disabledForegroundColor: zero066FF.withOpacity(0.48).withOpacity(0.38),
  disabledBackgroundColor: zero066FF.withOpacity(0.48).withOpacity(0.12),
  // shadowColor: mercury,
  textStyle: satoshiMedium16,
  elevation: 1,
  shape: roundBox4,
  // onSurface: primaryColor.withOpacity(.5),
);
final inputDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
  ),
  hintText: 'Enter your email address',
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(
      color: zero066FF,
    ),
  ),
);

final phoneNumberInputDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    // borderRadius: borderRadiusTopRBottomR8,
  ),
  hintText: 'Enter business phone number',
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(
      color: zero066FF,
    ),
  ),
);

const bottomsheetRadius = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
  topLeft: Radius.circular(24),
  topRight: Radius.circular(24),
));

// const oneA1A1A = Color(0xff1A1A1A);
// const ffffff = Color(0xffFFFFFF);
// const zer000000 = Color(0xff000000);
// const zero066FF = Color(0xff0066FF);
// const fourDAF3F = Color(0xff4DAF3F);
// const seven489AA = Color(0xff7489AA);
// const eight2B3FE = Color(0xff82B3FE);
// const c2DAFF = Color(0xffC2DAFF);
// const sevenE7E7E3D = Color(0xff7E7E7E);
// const f5f9ff = Color(0xffF5F9FF);
// const eD6C5A = Color(0xffED6C5A);
// // fDF6F5
// const fDF6F5 = Color(0xffFDF6F5);
// const f8F8F8 = Color(0xffF8F8F8);
// const f8FCF7 = Color(0xffF8FCF7);
// const five0555C = Color(0xff50555C);
// const d52108 = Color(0xffD52108);
// const f1F9F0 = Color(0xffF1F9F0);
// const one71D26 = Color(0xff171D26);

const ffffff = Color(0xffFFFFFF);
const zer000000 = Color(0xff000000);
const zero066FF = Color(0xff0066FF);
const oneA1A1A = Color(0xff1A1A1A);
const one71D26 = Color(0xff171D26);
const eight5B6FF = Color(0xff85B6FF);
const zero60606 = Color(0xff060606);
const aCB7C3 = Color(0xffACB7C3);
const six66666 = Color(0xff666666);
const six682A2 = Color(0xff6682A2);
const six67193 = Color(0xff667193);
const c2DAFF = Color(0xffC2DAFF);
const fourDAF3F = Color(0xff4DAF3F);
const eight2B3FE = Color(0xff82B3FE);
const five75A65 = Color(0xff575A65);
const five0555C = Color(0xff50555C);
const sevenE7E7E3D = Color(0xff7E7E7E);
const seven489AA = Color(0xff7489AA);
const eFF2F7 = Color(0xffEFF2F7);
const c4C4C4 = Color(0xffC4C4C4);
const e5E7EB = Color(0xffE5E7EB);
const f63115 = Color(0xffF63115);
const f8F8F8 = Color(0xffF8F8F8);
const f0F2F3 = Color(0xffF0F2F3);
const c6C6C8 = Color(0xffC6C6C8);
const f6F6F8 = Color(0xffF6F6F8);
const a2A2A2 = Color(0xffA2A2A2);
const eightE8D92 = Color(0xff8E8D92);
const zero08AFF = Color(0xff008AFF);
const oneBD13D = Color(0xff1BD13D);
const fEC200 = Color(0xffFEC200);
const fF5058 = Color(0xffFF5058);
const d8D8D8 = Color(0xffD8D8D8);
const fFF1C36 = Color(0xffFF1C36);
const nine99999 = Color(0xff999999);
const nine79797 = Color(0xff979797);
const eight98A8D = Color(0xff898A8D);
const two92D32 = Color(0xff292D32);
const f5f9ff = Color(0xffF5F9FF);
const f1F9F0 = Color(0xffF1F9F0);
const sixC6C6C6 = Color(0xffC6C6C6);
const e1e1e1 = Color(0xffE1E1E1);
const d52108 = Color(0xffD52108);
const f8FCF7 = Color(0xffF8FCF7);
const fDF6F5 = Color(0xffFDF6F5);
const d2D2D4 = Color(0xffD2D2D4);
const b2B2B2 = Color(0xffB2B2B2);
const one8622D = Color(0xff18622D);
const c8C7CC = Color(0xffC8C7CC);
const e0F1FF = Color(0xffE0F1FF);
const e4F9E8 = Color(0xffE4F9E8);
const fFF8E0 = Color(0xffFFF8E0);
const e16B61 = Color(0xffE16B61);
const eD6C5A = Color(0xffED6C5A);
