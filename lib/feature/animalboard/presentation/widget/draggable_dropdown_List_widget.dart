import 'package:flutter/material.dart';

class DropDownListDraggable extends StatelessWidget {
  const DropDownListDraggable(
      {Key? key, required this.items, required this.isOpacity, this.color})
      : super(key: key);

  final List<int> items;
  final bool isOpacity;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
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
        width: 80,
        height: 300,
        // color: Colors.white,
        child: ListView.separated(
          separatorBuilder: (context, index) => Container(
            height: 5,
            color: Colors.white,
          ),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return LongPressDraggable(
              data: (isOpacity == true) ? items[index] / 100 : items[index],
              feedback: OptionBoxDragged(
                  item: items[index], isOpacityBox: isOpacity, color: color),
              childWhenDragging: OptionBoxDraggable(
                  item: items[index], isOpacityBox: isOpacity, color: color),
              child: OptionBoxDraggable(
                  item: items[index], isOpacityBox: isOpacity, color: color),
            );
          },
        ));
  }
}

class OptionBoxDraggable extends StatelessWidget {
  const OptionBoxDraggable({
    Key? key,
    required this.item,
    required this.isOpacityBox,
    this.color,
  }) : super(key: key);

  final int item;
  final bool isOpacityBox;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(5),
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: isOpacityBox
            ? OpacityOptionBox(
                color: color ?? Colors.white,
                item: item,
              )
            : SizeOptionBox(
                item: item,
              ),
      ),
    );
  }
}

class SizeOptionBox extends StatelessWidget {
  const SizeOptionBox({
    Key? key,
    required this.item,
  }) : super(key: key);

  final int item;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        'assets/dottedSize.png',
        color: Colors.grey,
      ),
      Center(
        child: Text(
          '$item%',
        ),
      ),
    ]);
  }
}

class OpacityOptionBox extends StatelessWidget {
  const OpacityOptionBox({Key? key, required this.item, required this.color})
      : super(key: key);
  final int item;
  final Color color;

  @override
  Widget build(BuildContext context) {
    double opacityValue = item / 100;
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          color: color.withOpacity(opacityValue),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
      ),
      Center(
        child: Text(
          '$item%',
        ),
      ),
    ]);
  }
}

class OptionBoxDragged extends StatelessWidget {
  const OptionBoxDragged({
    Key? key,
    required this.item,
    required this.isOpacityBox,
    this.color,
  }) : super(key: key);

  final int item;
  final bool isOpacityBox;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(5),
        height: 65.0,
        width: 65.0,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Material(
          color: Colors.transparent,
          child: isOpacityBox
              ? OpacityOptionBox(
                  color: color ?? Colors.white,
                  item: item,
                )
              : SizeOptionBox(
                  item: item,
                ),
        ),
      ),
    );
  }
}
