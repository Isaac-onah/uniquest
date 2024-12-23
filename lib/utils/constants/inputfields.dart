import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import 'color.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final Function(String) onChanged;
  final String? Function(String?)? validate;

  CustomTextField({
    required this.labelText,
    required this.onChanged,
    this.validate,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: TextFormField(
        validator: validate,
        cursorColor: TColors.primary,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical: height * 0.025, horizontal: width * 0.06),
          filled: true,
          // fillColor: kwhiteBackground,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(width: 1, color: TColors.inputBorder),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              color: TColors.primary,
            ),
          ),
          labelText: labelText,
          // Pass the label text here
          labelStyle:const TextStyle(
            color: TColors.inputBorder,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}

// class CustomPhoneNumberInput extends StatelessWidget {
//   final ValueChanged<PhoneNumber>? onChanged;
//
//   CustomPhoneNumberInput({required this.onChanged});
//
//   FocusNode focusNode = FocusNode();
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
//       child: IntlPhoneField(
//         disableLengthCheck: false,
//         showDropdownIcon: false,
//         flagsButtonMargin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
//         flagsButtonPadding: const EdgeInsets.only(left: 14),
//         dropdownDecoration: BoxDecoration(
//             border:
//             Border(right: BorderSide(width: 1, color: kwhiteBackground))),
//         dropdownTextStyle: TextStyle(color: kwhiteBackground),
//         showCountryFlag: false,
//         style: TextStyle(color: kwhiteBackground),
//         initialCountryCode: 'NG',
//         onCountryChanged: (country) {
//           print('Country changed to: ' + country.code);
//         },
//         languageCode: "en",
//         decoration: InputDecoration(
//           filled: true,
//           fillColor: kFormBColor,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//             borderSide: BorderSide.none,
//           ),
//           focusedBorder: const OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(10.0)),
//             borderSide: BorderSide(
//               color: TColors.primary,
//             ),
//           ),
//           labelText: 'Phone Number',
//           labelStyle: const TextStyle(
//             color: Colors.white,
//             fontFamily: 'Roboto',
//             fontWeight: FontWeight.w400,
//             fontSize: 16,
//           ),
//         ),
//         onChanged: onChanged,
//       ),
//     );
//   }
// }

// class CustomPasswordField extends StatefulWidget {
//   final String labelText;
//   final Function(String) onChanged;
//   final String? Function(String?)? validate;
//
//   CustomPasswordField({required this.labelText,required this.onChanged, this.validate});
//
//   @override
//   State<CustomPasswordField> createState() => _CustomPasswordFieldState();
// }

// class _CustomPasswordFieldState extends State<CustomPasswordField> {
//   bool _passwordVisible = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _passwordVisible = false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Padding(
//       padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text('Password'),
//           TextFormField(
//             validator: widget.validate,
//             cursorColor: TColors.primary,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//               fontFamily: 'Roboto',
//               fontWeight: FontWeight.w400,
//             ),
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.symmetric(
//                   vertical: height * 0.025, horizontal: width * 0.06),
//               filled: true,
//               fillColor: kwhiteBackground,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//                 borderSide: BorderSide(width: 1, color: inputBorder),
//               ),
//               focusedBorder: const OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                 borderSide: BorderSide(
//                   color: TColors.primary,
//                 ),
//               ),
//               labelText: widget.labelText,
//               // Pass the label text here
//               labelStyle: TextStyle(
//                 color: inputBorder,
//                 fontFamily: 'Roboto',
//                 fontWeight: FontWeight.w400,
//                 fontSize: 16,
//               ),
//               suffixIcon: IconButton(
//                 icon: Icon(
//                   // Based on passwordVisible state choose the icon
//                   _passwordVisible ? Icons.visibility : Icons.visibility_off,
//                   color: iconcolor,
//                 ),
//                 onPressed: () {
//                   // Update the state i.e. toogle the state of passwordVisible variable
//                   setState(() {
//                     _passwordVisible = !_passwordVisible;
//                   });
//                 },
//               ), // Show suffix icon only if password is true
//             ),
//             obscureText: !_passwordVisible,
//             onChanged: widget.onChanged,
//           ),
//         ],
//       ),
//
//     );
//   }
// }