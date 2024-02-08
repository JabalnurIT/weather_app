import 'package:flutter/material.dart';

import '../../res/colours.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    this.title,
    this.icon,
    this.buttonAction,
    this.size = 20,
    this.isBackButton = false,
    this.centerTitle = false,
    this.height = 72,
    this.onPressed,
  });

  final Icon? icon;
  final Widget? title;
  final Widget? buttonAction;
  final double? size;
  final bool? isBackButton;
  final bool centerTitle;
  final double height;
  final Function()? onPressed;

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      actions: [
        buttonAction ??
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.info_outline,
                size: 52,
                color: Colours.successColour,
              ),
            ),
      ],
      centerTitle: centerTitle,
      backgroundColor: Colors.transparent,
      foregroundColor: Colours.whiteColour,
      toolbarHeight: height,
      elevation: 0,
      leadingWidth: 82,
      leading: isBackButton == true
          ? IconButton(
              icon: Icon(
                Theme.of(context).platform == TargetPlatform.iOS
                    ? Icons.arrow_back_ios_new
                    : Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.pop(context);
                onPressed?.call();
              },
              color: Colours.secondaryColour,
              iconSize: 30,
            )
          : null,
      title: title,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
