import 'package:animal_board/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:provider/provider.dart';
import '../../../../config/app_constant.dart';
import '../../../../config/string_constant.dart';
import '../../../../core/widget/icon_button_widget.dart';
import '../../../chat/presentation/page/chat_page.dart';
import '../../application/animal_provider.dart';
import '../../../../core/schema/application/schema_provider.dart';
import '../../domain/model/animal_option.dart';
import '../widget/background_layout.dart';
import '../widget/drop_down_list_draggable.dart';
import '../widget/header_view.dart';
import '../widget/image_picker.dart';

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

  var animalList = [
    AnimalOption(id: 0, name: 'Wolf', color: kColorRed),
    AnimalOption(id: 1, name: 'Wolf', color: kColorPink),
    AnimalOption(id: 2, name: 'Cat', color: kColorIndigo),
    AnimalOption(id: 3, name: 'Cat', color: kColorPurple),
    AnimalOption(id: 4, name: 'Penguin', color: kColorBlue),
    AnimalOption(id: 5, name: 'Penguin', color: kColorGrey),
    AnimalOption(id: 6, name: 'Koala', color: kColorYellow),
    AnimalOption(id: 7, name: 'Koala', color: kColorTeal),
    AnimalOption(id: 8, name: 'Leopard', color: kColorGreen),
    AnimalOption(id: 9, name: 'Leopard', color: kColorLime),
  ];

  @override
  void initState() {
    super.initState();
    final postModel = Provider.of<SchemaProvider>(context, listen: false);
    postModel.getPostData();
  }

  @override
  Widget build(BuildContext context) {
    final uiModel = Provider.of<SchemaProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => AnimalProvider(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: kBackgroundColor,
            body: Consumer<AnimalProvider>(
              builder: ((context, value, child) {
                return Center(
                  child: Column(
                    children: <Widget>[
                      HeaderView(
                        animalImage: value.spiritAnimalSquare.image,
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
                              name: value.spiritAnimalSquare.name,
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
          style: TextStyle(
              color: kWhiteColor, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          '$size%',
          style: TextStyle(color: kWhiteColor),
        ),
      ],
    );
  }

  GestureDetector _buildAnimalBoard(
      BuildContext context, AnimalProvider provider, SchemaProvider uiModel) {
    return GestureDetector(
      onTap: () {
        touchDetected();
        setState(() {});
      },
      onDoubleTap: () {
        touchDetected();
        showOpacityList = !showOpacityList;
        setState(() {});
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.62,
            child: Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              _buildTopRow(context, uiModel),
              _buildCentralSquare(provider),
            ]),
          ),
          _buildPickAnimalButton(uiModel),
        ]),
      ),
    );
  }

  Center _buildPickAnimalButton(SchemaProvider uiModel) {
    return Center(
      child: Container(
        height: 40,
        width: 130,
        decoration: BoxDecoration(
          color: kButtonColor,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: TextButton.icon(
          icon: Icon(
            Icons.home_outlined,
            size: 18,
            color: kColorBlack,
          ),
          label: Text(
            uiModel.post?.buttonDetail[3].value.title ?? pickAnimalButtonTitle,
            style: TextStyle(color: kWhiteColor, fontSize: 12),
          ),
          onPressed: () {
            touchDetected();
            showAnimalList = !showAnimalList;
            setState(() {});
          },
        ),
      ),
    );
  }

  Padding _buildTopRow(BuildContext context, SchemaProvider uiModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            buttonIcon: Icons.layers_sharp,
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
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 4),
              Text(
                  uiModel.post?.textTheme.animalBoardSubtitle ??
                      animalBoardSubTitle,
                  style: Theme.of(context).textTheme.labelSmall),
            ],
          ),
          CustomIconButton(
            buttonIcon: Icons.redo_rounded,
            onTapHandler: () {
              touchDetected();
              setState(() {});
              share();
            },
          )
        ],
      ),
    );
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Spirit Animal',
        text: 'I am sharing my spirit animal',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Spirit Animal');
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
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: kColorGrey.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      onAccept: (data) {
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
        color: kWhiteColor,
        boxShadow: [
          BoxShadow(
            color: kColorGrey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListView.separated(
        separatorBuilder: (context, index) => Container(
          width: 5,
          color: kWhiteColor,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: GestureDetector(
              onTap: () {
                provider.setSquareAnimal(list[index].name);
                provider.setSquareColor(list[index].color);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: list[index].color,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: kColorGrey.withOpacity(0.2),
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
                  list[index].name.toString(),
                  style: TextStyle(color: kWhiteColor),
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
