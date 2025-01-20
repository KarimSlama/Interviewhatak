import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';
import 'package:interviewhatak/interviewhatak/about_us/widget/about_us_row_widget.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  final List<String> aboutUsContent = [
    AppString.aboutUs1,
    AppString.aboutUs2,
    AppString.aboutUs3,
    AppString.aboutUs4,
  ];

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<String> displayItems = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 200), () {
      for (int i = 0; i < aboutUsContent.length; i++) {
        setState(() {
          displayItems.add(aboutUsContent[i]);
        });
        _listKey.currentState?.insertItem(i);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.aboutUs),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(IconBroken.Arrow___Left)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: AnimatedList(
          key: _listKey,
          initialItemCount: displayItems.length,
          itemBuilder: (context, index, animation) {
            return _buildListItem(displayItems[index], animation);
          },
        ),
      ),
    );
  }

  Widget _buildListItem(String title, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: AboutUsRowWidget(title: title),
      ),
    );
  }
}
