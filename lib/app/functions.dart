import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../presentation/resource_data/assets_manager.dart';
import '../presentation/resource_data/color_manager.dart';
import '../presentation/resource_data/strings_manager.dart';
import '../presentation/resource_data/style_manager.dart';
import '../presentation/resource_data/values_managers.dart';

void showSectionPopup(BuildContext context, String sectionName) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(AppStrings.selectedSection),
        content: Text(sectionName),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the popup
            },
            child: const Text(AppStrings.ok),
          ),
        ],
      );
    },
  );
}

//-----------------------------------------

//check if any dialog open or not
_isCurrentDialogShowing(BuildContext context) {
  return ModalRoute.of(context)?.isCurrent != true;
}

dismissDialog(BuildContext context) {
  if (_isCurrentDialogShowing(context)) {
    Navigator.of(context, rootNavigator: true).pop(true);
  }
}

showCustomDialogOfRequests(BuildContext cxt, Widget returnDialog) async {
  await showDialog(
      barrierDismissible: false,
      context: cxt,
      builder: (BuildContext context) {
        return returnDialog;
      });
}

List<Widget> popUpErrorChildren(BuildContext context, String message) {
  return [
    getAnimatedImage(JsonAssets.error),
    getMessage(message),
    getOkButton(AppStrings.ok, context),
  ];
}

Widget getErrorPopupDialog(BuildContext context, List<Widget> children) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.s14),
    ),
    elevation: AppSize.s1_5,
    backgroundColor: Colors.white,
    child: Container(
      decoration: BoxDecoration(
          color: ColorManager.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(AppSize.s14),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
            ),
          ]),
      child: getDialogContent(context, children),
    ),
  );
}

Widget getDialogContent(BuildContext context, List<Widget> children) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: children,
  );
}

Widget getAnimatedImage(String animationName) {
  return SizedBox(
    height: AppSize.s100,
    width: AppSize.s100,
    child: Lottie.asset(animationName),
  );
}

Widget getMessage(String message) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: getRegularStyle(
          color: ColorManager.black,
          fontSize: AppSize.s18,
        ),
      ),
    ),
  );
}

Widget getOkButton(String buttonTitle, BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(AppPadding.p18),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            //Popup Error State
            Navigator.of(context).pop();
          },
          child: Text(buttonTitle),
        ),
      ),
    ),
  );
}
