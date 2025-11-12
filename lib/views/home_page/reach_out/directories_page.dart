import 'package:flutter/material.dart';
import 'package:umatter/components/app_bar_component.dart';
import 'package:umatter/controllers/professionals_page_controller/external_directories_controller.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';

import '../../../components/widgets/professional_page/professional_card_widget.dart';

import '../../../controllers/reach_out_controller/directories_controller.dart';
import '../nav_bar/navbar_page.dart';

class ReachOutPage extends StatefulWidget {
  const ReachOutPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ReachOutPage> createState() => _ProfessionalDirectoriesPage();
}

class _ProfessionalDirectoriesPage extends State<ReachOutPage> {
  final interventionPage = InterventionPageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Directories',
            style: kAppBarTitle,
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const NavBarPage())),
            icon: Icon(Icons.chevron_left, color: Colors.grey[600]),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: ListView.builder(
          itemCount: professionalInfoController.length,
          itemBuilder: (context, index) => professionalCardWidget(
            context: context,
            width: double.infinity,
            title: professionalInfoController[index].title,
            subtitle: professionalInfoController[index].subtitle,
            cardColor: Color(professionalInfoController[index].color),
            btnText: "Take me there",
            btnColor: kPrimary,
            route: professionalInfoController[index].route,
          ),
        ),
      ),
    );
  }
}
