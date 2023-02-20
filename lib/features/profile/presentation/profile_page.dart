import 'package:flutter/material.dart';
import 'package:flutter_base/core/core.dart';
import 'package:flutter_base/core/resource/string.dart';
import 'package:flutter_base/core/utils/extensions/widget_util.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Loadable(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text16WhiteBold("Profile"),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 120,
                        child: CircleAvatar(
                          radius: 110,
                          backgroundImage: NetworkImage(
                              'https://media.licdn.com/dms/image/C4D03AQG_XI30zyGliQ/profile-displayphoto-shrink_400_400/0/1653044958127?e=1682553600&v=beta&t=SLpwlP50mZchSmPbV_9b7nhNINoCg5YDa2UpY_xr4VE'),
                        ),
                      ).padded16(),
                    ],
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.15),
                          spreadRadius: 0,
                        ),
                      ],
                      color: Colors.yellow,
                    ),
                    child: Center(child: Text11BlackF45Medium("Platinum")),
                  ).padded16()
                ],
              ),
              Text22BlackBold(
                    "Miftahul Jihad",
                  ).padded16(),
              Text12GreyDefaultRegular(
                summary,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
              ).padded16()
            ],
          ),
        ),
      ),
    );
  }
}
