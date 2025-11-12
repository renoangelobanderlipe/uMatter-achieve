import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../../controllers/reach_out_controller/external_directories_controller.dart';

class CampusProfessionalProfilePage extends StatefulWidget {
  final controller;
  final index;

  // final
  const CampusProfessionalProfilePage({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  @override
  State<CampusProfessionalProfilePage> createState() =>
      _CampusProfessionalProfilePageState();
}

class _CampusProfessionalProfilePageState
    extends State<CampusProfessionalProfilePage> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.chevron_left,
              color: Colors.grey[500],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.close,
                color: Colors.grey[500],
              ),
            )
          ],
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            FractionallySizedBox(
              alignment: Alignment.topCenter,
              heightFactor: 0.68,
              child: Image.asset(
                widget.controller[widget.index].imgAsset,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
            FractionallySizedBox(
              alignment: Alignment.bottomCenter,
              heightFactor: 0.3,
              child: Container(
                color: Colors.white,
              ),
            ),
            SlidingUpPanel(
              minHeight: _height * 0.38,
              maxHeight: _height * 0.5,
              // borderRadius: const BorderRadius.only(
              //   topRight: Radius.circular(30.0),
              //   topLeft: Radius.circular(30.0),
              // ),
              panelBuilder: (ScrollController controller) =>
                  SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40.0,
                      ),
                      height: _height * 0.35,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            height: 4,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey,
                            ),
                          ),
                          const Spacer(),
                          // Name
                          Text(
                            widget.controller[widget.index].name,
                            // widget.controller[widget.index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                            ),
                          ),
                          const Spacer(),
                          // Profession
                          Text(
                            widget.controller[widget.index].profession,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text("${widget.controller[widget.index].email}"),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Office Start
                              Column(
                                children: [
                                  Text(
                                    "Office Start",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    "${widget.controller[widget.index].officeStart} AM",
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                              // Office End
                              Column(
                                children: [
                                  Text(
                                    "Office End",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[700],
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    "${widget.controller[widget.index].officeEnd} PM",
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const Spacer(),
                          OutlinedButton(
                            onPressed: () => launchUrl(
                                widget.controller[widget.index].formLink),
                            // onPressed: () {
                            //   // Navigator.of(context).push(
                            //   //   MaterialPageRoute(
                            //   //       builder: (context) =>
                            //   //           const ScheduleCounsellingPage()
                            // },
                            style: OutlinedButton.styleFrom(
                              primary: Colors.grey[800],
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 15.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: const Text('Schedule Counselling'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // Room No.
                              Text(
                                "Room No. \n${widget.controller[widget.index].roomNo}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.grey[700],
                                ),
                              ),
                              Container(
                                height: 50.0,
                                width: 1,
                                color: Colors.grey,
                              ),
                              // Floor No.

                              Text(
                                "Floor No. \n${widget.controller[widget.index].floor}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          // Text(
                          //   widget.controller[widget.index].bio,
                          //   textAlign: TextAlign.justify,
                          //   style: TextStyle(
                          //     fontSize: 14.0,
                          //     color: Colors.grey[700],
                          //     fontWeight: FontWeight.bold,
                          //     letterSpacing: 1.0,
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 50.0,
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
