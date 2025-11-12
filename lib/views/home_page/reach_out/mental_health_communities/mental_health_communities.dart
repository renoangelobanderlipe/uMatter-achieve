import 'package:flutter/material.dart';
import 'package:umatter/components/app_bar_component.dart';

class MentalHealthCommunitiesPage extends StatefulWidget {
  const MentalHealthCommunitiesPage({Key? key}) : super(key: key);

  @override
  _MentalHealthCommunitiesPageState createState() =>
      _MentalHealthCommunitiesPageState();
}

class _MentalHealthCommunitiesPageState
    extends State<MentalHealthCommunitiesPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Mental Health Community',
            style: kAppBarTitle,
          ),
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.chevron_left,
              color: Colors.grey[600],
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Column(
          children: [
            communityCardWiget(
              title: "asd",
              subtitle: "asdasd",
              size: size,
              cardColor: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}

Widget communityCardWiget({
  required title,
  required subtitle,
  required size,
  required cardColor,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
    child: Container(
        height: size.height * 0.15,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Text(subtitle),
          ],
        )),
  );
}
