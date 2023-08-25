
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class custom_suffix extends StatelessWidget {
  String svgIcons;


  custom_suffix(this.svgIcons);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.fromLTRB(0, 18, 18, 18),
      child: SvgPicture.asset(svgIcons, height: 18,
      colorFilter: ColorFilter.mode(Colors.black45, BlendMode.srcIn),),);
  }
}
