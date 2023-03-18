import 'package:flutter/material.dart';


class Categorychat extends StatefulWidget {
  const Categorychat({
    Key key,
    @required this.navBar,
  }) : super(key: key);

  final List<String> navBar;

  @override
  _CategorychatState createState() => _CategorychatState();
}

class _CategorychatState extends State<Categorychat> {
  int selectedIndex=0;
  
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90,
        color:Theme.of(context).primaryColor,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: ClampingScrollPhysics(),
          itemCount: widget.navBar.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                   setState(() {
                    selectedIndex=index;
                   });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 30),
                child: Text(
                  widget.navBar[index],
                  style: TextStyle(
                    color:selectedIndex==index ?
                    Colors.white:Colors.white.withOpacity(0.5),
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            );
          },
        ));
  }
}
