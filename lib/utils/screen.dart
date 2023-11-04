import 'package:flutter/material.dart';


double screenSizePercent(BuildContext context, double percent) {
  double screenWidth = MediaQuery.of(context).size.width;
  return (screenWidth * percent) / 100;
}

double screenHeightPercent(BuildContext context, double percent) {
  double screenHeight = MediaQuery.of(context).size.height;
  return (screenHeight * percent) / 100;
}

// void pushToWidget([BuildContext context,])

// void addWidget({
//   @required BuildContext context,
//   StatefulWidget widget,
// }) {
//   // Utilise le context par défaut
//   Scaffold.of(context).add(widget);
// }

// my_functions.dart


// void maFonction(StatefulWidget widget) {
//   // Utilisez le context du widget appelant pour la navigation ou d'autres opérations spécifiques à l'écran.
//   BuildContext context = widget.context;

//   // Utilisez le StatefulWidget passé en paramètre.
  
//   // Par exemple, vous pouvez utiliser le context pour naviguer vers une autre page :
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => AutreWidget(),
//     ),
//   );
// }

