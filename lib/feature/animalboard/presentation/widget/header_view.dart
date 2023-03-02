import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/string_constant.dart';
import '../../../../core/widget/icon_button_widget.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({
    Key? key,
    this.animalImage,
    required this.onTap,
    this.headerTitle,
    this.headerSubtitle,
    this.chatIcon,
    required this.onTapChat,
  }) : super(key: key);

  final File? animalImage;
  final Function() onTap;
  final Function() onTapChat;
  final String? headerTitle;
  final String? headerSubtitle;
  final IconData? chatIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(color: kBlackShadow, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: onTap,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10), // Image border
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(25), // Image radius
                        child: (animalImage != null)
                            ? Image.file(
                                animalImage!,
                                fit: BoxFit.fitHeight,
                              )
                            : const Image(
                                image: AssetImage('assets/images/noPhoto.png')),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(headerTitle ?? headerTitleText,
                        style: Theme.of(context).textTheme.titleLarge),
                    Text(headerSubtitle ?? headerSubTitleText,
                        style: Theme.of(context).textTheme.titleSmall)
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: CustomIconButton(
                    buttonIcon: chatIcon ?? Icons.chat_bubble_outline,
                    onTapHandler: onTapChat,
                  ),
                )
              ]),
            ],
          ),
        ));
  }
}
