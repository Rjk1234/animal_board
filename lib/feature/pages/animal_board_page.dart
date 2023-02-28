import 'package:flutter/material.dart';
import 'dart:io';
import 'package:audioplayers/audio_cache.dart';
import 'package:provider/provider.dart';
import '../../config/app_constant.dart';
import '../../core/widget/icon_button_widget.dart';
import '../../data/model.dart';
import '../animalboard/application/controller.dart';
import '../animalboard/presentation/background_layout.dart';
import '../../core/widget/draggable_dropdown_List_widget.dart';
import '../header/presentation/header_view.dart';
import '../header/presentation/image_picker.dart';
import 'chat_page.dart';

class AnimalBoardPage extends StatefulWidget {
  const AnimalBoardPage({super.key});

  @override
  State<AnimalBoardPage> createState() => _AnimalBoardPageState();
}

class _AnimalBoardPageState extends State<AnimalBoardPage> {
  File? animalImage;
  bool showSizeList = false;
  bool showAnimalList = false;
  bool showOpacityList = false;
  static AudioCache player = AudioCache();

  @override
  void initState() {
    super.initState();
    final postModel = Provider.of<UIThemeDataProvider>(context, listen: false);
    postModel.getPostData();
  }

  @override
  Widget build(BuildContext context) {
    final uiModel = Provider.of<UIThemeDataProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => AnimalProvider(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: Consumer<AnimalProvider>(
              builder: ((context, value, child) {
                return Center(
                  child: Column(
                    children: <Widget>[
                      HeaderView(
                        animalImage: value.spiritAnimalSquare.animalImage,
                        onTap: () {
                          touchDetected();
                          showImagePicker(context, value);
                        },
                        onTapChat: () {
                          touchDetected();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ChatPage()));
                        },
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          const BackgroundLayout(),
                          _buildAnimalBoard(context, value, uiModel),
                          if (showSizeList == true) ...[
                            Positioned(
                              left: 10,
                              top: 80,
                              child: DropDownListDraggable(
                                items: sizeOptionList,
                                isOpacity: false,
                              ),
                            ),
                          ],
                          _animalText(
                              name: value.spiritAnimalSquare.animalName,
                              size: value.spiritAnimalSquare.size),
                          if (showAnimalList == true) ...[
                            Positioned(
                              bottom: 70,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 100,
                                child: _horizontalAnimalList(animalList, value),
                              ),
                            ),
                          ],
                          if (showOpacityList == true) ...[
                            Positioned(
                              right: 15,
                              top: 80,
                              child: DropDownListDraggable(
                                items: opacityOptionList,
                                isOpacity: true,
                                color: value.spiritAnimalSquare.color,
                              ),
                            )
                          ]
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }

  Column _animalText({required String name, required int size}) {
    return Column(
      children: [
        Text(
          name,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          '$size%',
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Padding _buildAnimalBoard(BuildContext context, AnimalProvider provider,
      UIThemeDataProvider uiModel) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: () {
          touchDetected();
          setState(() {});
        },
        onDoubleTap: () {
          touchDetected();
          showOpacityList = !showOpacityList;
          setState(() {});
        },
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          height: MediaQuery.of(context).size.height * 0.65,
          width: MediaQuery.of(context).size.width * 0.9,
          // color: Colors.red.withOpacity(0.1),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _buildTopRow(context, uiModel),
            _buildCentralSquare(provider),
            const Spacer(),
            _buildPickAnimalButton(uiModel),
          ]),
        ),
      ),
    );
  }

  Center _buildPickAnimalButton(UIThemeDataProvider uiModel) {
    return Center(
      child: Container(
        height: 40,
        width: 130,
        decoration: const BoxDecoration(
          color: Color(0xff44EC87),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: TextButton.icon(
          icon: const Icon(
            Icons.home_outlined, // uiModel.post?.buttonDetail[3].value.iconURL
            size: 18,
            color: Colors.black,
          ), // Your icon here
          label: Text(
            uiModel.post?.buttonDetail[3].value.title ?? pickAnimalButtonTitle,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ), // Your text here
          onPressed: () {
            touchDetected();
            showAnimalList = !showAnimalList;
            setState(() {});
          },
        ),
      ),
    );
  }

  Padding _buildTopRow(BuildContext context, UIThemeDataProvider uiModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            buttonIcon: Icons.stacked_line_chart,
            onTapHandler: () {
              touchDetected();
              showSizeList = !showSizeList;
              setState(() {});
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(uiModel.post?.textTheme.animalBoardTitle ?? animalBoardTitle,
                  style: Theme.of(context).textTheme.headline2),
              const SizedBox(height: 4),
              Text(
                  uiModel.post?.textTheme.animalBoardSubtitle ??
                      animalBoardSubTitle,
                  style: Theme.of(context).textTheme.subtitle1),
            ],
          ),
          CustomIconButton(
            buttonIcon: Icons.arrow_circle_left,
            onTapHandler: () {
              touchDetected();
              showSizeList = !showSizeList;
              setState(() {});
            },
          )
        ],
      ),
    );
  }

  DragTarget<Object> _buildCentralSquare(AnimalProvider provider) {
    var maxCentralSquareSize = MediaQuery.of(context).size.width * 0.85;
    return DragTarget(
      builder: (
        BuildContext context,
        List accepted,
        List rejected,
      ) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: Center(
              child: SizedBox(
                height: maxCentralSquareSize,
                width: maxCentralSquareSize,
                child: Center(
                  child: Container(
                    height: maxCentralSquareSize *
                        (provider.spiritAnimalSquare.size / 100),
                    width: maxCentralSquareSize *
                        (provider.spiritAnimalSquare.size / 100),
                    decoration: BoxDecoration(
                        color: provider.spiritAnimalSquare.color.withOpacity(
                            provider.spiritAnimalSquare.opacityValue),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      onAccept: (data) {
        debugPrint('hi $data');
        if (data is int) {
          provider.spiritAnimalSquare.size = data;
        } else if (data is double) {
          provider.spiritAnimalSquare.opacityValue = data;
        }
        player.play(alarmAudioPath);
      },
      onWillAccept: (data) {
        return true;
      },
    );
  }

  Container _horizontalAnimalList(
      List<AnimalOption> list, AnimalProvider provider) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListView.separated(
        separatorBuilder: (context, index) => Container(
          width: 5,
          color: Colors.white,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: GestureDetector(
              onTap: () {
                provider.setSquareAnimal(list[index].animalName);
                provider.setSquareColor(list[index].color);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: list[index].color,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                width: 60,
                height: 70,
                alignment: Alignment.center,
                child: Text(
                  list[index].animalName.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void showImagePicker(BuildContext context, AnimalProvider provider) {
    ImagePickerWidget.displayPicker(
      context,
      onCompletion: (imageFile) {
        provider.setAnimalImage(imageFile);
      },
      onCancel: () {
        // Handle Image Picker Cancel
      },
    );
  }

  void touchDetected() {
    showSizeList = false;
    showAnimalList = false;
    showOpacityList = false;
    setState(() {});
  }
}
