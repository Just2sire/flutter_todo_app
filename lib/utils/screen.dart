import 'package:flutter/material.dart';


double screenSizePercent(BuildContext context, double percent) {
  double screenWidth = MediaQuery.of(context).size.width;
  return (screenWidth * percent) / 100;
}

double screenHeightPercent(BuildContext context, double percent) {
  double screenHeight = MediaQuery.of(context).size.height;
  return (screenHeight * percent) / 100;
}

// String compareDate(DateTime inputDate) {
//   final now = DateTime.now();
//   final difference = inputDate.difference(now);

//   if (difference.inSeconds < 0) {
//     // Si la date est passée
//     return inputDate.toString();
//   } else if (difference.inMinutes < 60) {
//     // Si la différence est inférieure à 1 heure, renvoie en minutes
//     return '${difference.inMinutes} minutes';
//   } else if (difference.inDays >= 1) {
//     // Si la différence est d'au moins 1 jour, renvoie en jours
//     return '${difference.inDays} jours';
//   } else {
//     // Sinon, renvoie la date au format "Date Heure"
//     return inputDate.toString();
//   }
// }

// void main() {
//   final inputDate = DateTime(2023, 11, 1, 15, 30); // Date à comparer
//   print(compareDate(inputDate));
// }


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

