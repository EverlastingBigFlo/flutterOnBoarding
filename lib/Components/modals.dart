import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Mymodal {
  showMyModal(
    context,
    text,
  ) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('$text'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

// class MySecondModal {
//   showMySpinal(context, text) {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: true, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//             // title: const Text('AlertDialog Title'),
//             // backgroundColor: Colors.white,
//             content: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               child: LoadingAnimationWidget.fallingDot(
//                   size: 30, color: Colors.black),
//             ),
//             Text('$text')
//           ],
//         ));
//       },
//     );
//   }
// }


class MySecondModal {
  Function? dismissFunction; // Function to dismiss the dialog

  showMySpinal(context, text) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: LoadingAnimationWidget.fallingDot(
                  size: 30,
                  color: Colors.black,
                ),
              ),
              Text('$text'),
            ],
          ),
        );
      },
    ).then((_) {
      // Set the dismissFunction when the dialog is shown
      dismissFunction = () {
        Navigator.of(context).pop();
      };
    });
  }

  // Call this function to dismiss the dialog
  dismissMySpinal() {
    if (dismissFunction != null) {
      dismissFunction!();
    }
  }
}




