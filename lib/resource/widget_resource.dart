import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stark_expense/resource/image_resource.dart';

import '../provider/common_provider.dart';

AlertDialog _loader = const AlertDialog(
  surfaceTintColor: Colors.transparent,
  backgroundColor: Colors.transparent,
  content: Center(
    child: CircularProgressIndicator(
      color: Colors.white,
      strokeWidth: 5.0,
    ),
  ),
);

class WidgetResource {
  static Orientation getOrientation(context) =>
      MediaQuery.orientationOf(context);

  static Widget getLogo(context) => _getAppLogo(context);

  static BoxDecoration getAppTheme() => _appTheme();

  static Widget getAppBottomBar(context) => _appBottomBar(context);

  static tapOutside(context) => () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      };

  static AlertDialog getLoader(context) => _loader;

  static getBalance(String currency, double totalBalance, Color color,
          FontWeight fontWeight, double fontSize,
          {MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start}) =>
      _getBalance(currency, totalBalance, color, fontWeight, fontSize,
          mainAxisAlignment: mainAxisAlignment);
}

Widget _getBalance(String currency, double totalBalance, Color color,
    FontWeight fontWeight, double fontSize,
    {MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start}) {
  return Row(
    mainAxisAlignment: mainAxisAlignment,
    children: [
      Text(
        "$currency ",
        style: TextStyle(
            fontSize: fontSize, fontWeight: fontWeight, color: Colors.white),
      ),
      Text(totalBalance.toStringAsFixed(2),
          style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: fontWeight,
              fontSize: fontSize,
              color: color)),
    ],
  );
}

Widget _getAppLogo(BuildContext context) {
  var screenWidth = MediaQuery.of(context).size.width;
  return ConstrainedBox(
      constraints:
          BoxConstraints.tightForFinite(height: 240, width: screenWidth),
      child: SizedBox(child: ImageResource.cita));
}

BoxDecoration _appTheme() {
  Image image = ImageResource.background;
  return const BoxDecoration(
      /*image: DecorationImage(
        image: image.image,

    ),*/
      /*gradient: RadialGradient(colors: [
      Colors.blue.shade700,
      Colors.blue.shade700,
      Colors.blue.shade600,
      Colors.blue.shade600,
      const Color.fromARGB(255, 8, 43, 74),
      const Color.fromARGB(255, 8, 43, 74),
      const Color.fromARGB(255, 8, 43, 74),
      const Color.fromARGB(255, 8, 43, 74),
    ], center: Alignment.topCenter, radius: 1.8),*/
      gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF002140), Color(0xFF002140), // Dark blue
      Color(0xFF264683), // Medium blue
      Color(0xFF4C6DBF), // Light blue
    ],
  ));
}

class LoginField extends StatelessWidget {
  const LoginField(
      {super.key,
      required this.fieldName,
      this.textInputType = TextInputType.name,
      this.obscure = false});

  final String fieldName;
  final TextInputType textInputType;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Text(
        fieldName,
        style: TextStyle(
            color: Colors.blue.shade200,
            fontSize: 15.0,
            fontWeight: FontWeight.w900),
      ),
      Container(
        height: MediaQuery.of(context).size.height * 0.045,
        margin: const EdgeInsets.symmetric(vertical: 12.0),
        child: TextField(
          keyboardType: textInputType,
          obscureText: obscure,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(6.0)),
            fillColor: Colors.white,
            filled: true,
          ),
        ),
      ),
    ]);
  }
}

Widget _appBottomBar(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.065,
    padding: const EdgeInsets.all(8.0),
    width: MediaQuery.of(context).size.width,
    alignment: AlignmentDirectional.bottomCenter,
    decoration:
        const BoxDecoration(shape: BoxShape.rectangle, color: Colors.white),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [ImageResource.citaName, ImageResource.bi2Logo],
    ),
  );
}

Widget getSampleBottomBar(BuildContext context) {
  CommonProvider commonProvider = context.read<CommonProvider>();
  return BottomNavigationBar(
    currentIndex: commonProvider.index,
    onTap: (currentIndex) {
      commonProvider.updateIndex(currentIndex);
    },
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
    ],
    selectedItemColor: Colors.blueAccent,
    showUnselectedLabels: false,
  );
}

/*
class TextInput extends StatelessWidget {
  const TextInput({super.key, required this.fieldName, this.textInputType = TextInputType.name, this.obscure = false});

  final String fieldName;
  final TextInputType textInputType;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          obscureText: obscure,
          keyboardType: textInputType,
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white70, width: 2.0),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 2.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3.0),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 5.0),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: fieldName,
              labelStyle: const TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w500)),
        ),
      ],
    );
  }
}*/
