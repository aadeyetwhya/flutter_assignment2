import 'package:flutter/material.dart';
class Test extends StatelessWidget {
  String img="https://th.bing.com/th/id/OIP.6nCVjA0S936UiBlDUsov4QHaE9?pid=Api&rs=1";
  @override
  Widget build(BuildContext context) {
    return Image(image:NetworkImage(img));
  }
}
