import 'package:flutter/material.dart';

class DynamicSliverAppBar extends StatefulWidget {
  final Widget child;
  final double maxHeight;

  const DynamicSliverAppBar(
      {super.key, required this.maxHeight, required this.child});

  @override
  DynamicSliverAppBarState createState() => DynamicSliverAppBarState();
}

class DynamicSliverAppBarState extends State<DynamicSliverAppBar> {
  final GlobalKey _childKey = GlobalKey();
  bool isHeightCalculated = false;
  double? height;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      if (!isHeightCalculated) {
        setState(() {
          height = (_childKey.currentContext!.findRenderObject() as RenderBox)
                  .size
                  .height +
              10;
          isHeightCalculated = true;
        });
      }
    });

    return SliverAppBar(
      // shape
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      floating: true,
      snap: false,
      elevation: 1,
      collapsedHeight: isHeightCalculated ? (height!) : widget.maxHeight,
      expandedHeight: isHeightCalculated ? (height!) : widget.maxHeight,
      flexibleSpace: Column(
        children: <Widget>[
          Container(
            key: _childKey,
            child: widget.child,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
