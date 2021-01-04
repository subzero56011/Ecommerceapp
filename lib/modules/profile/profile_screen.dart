import 'package:ecommerce_app/shared/colors/color_common.dart';
import 'package:ecommerce_app/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/shared/components/components.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/user.png'),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '3abdo 3li',
                  style: black18Bold(),
                ),
                IconButton(
                    icon: Icon(
                      Icons.edit,
                      size: 17,
                      color: kDefaultColor,
                    ),
                    onPressed: () {}),
              ],
            ),

            Text(
              '3abdo@gmail.com',
              style: black18Bold(),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  BuildProfileItem(
                    title: 'My Courses',
                    function: () {},
                    shape: Text(
                      'data',
                      style: black20Bold(),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  BuildProfileItem(
                    title: 'My favorite',
                    function: () {},
                    shape: Icon(Icons.favorite),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  BuildProfileItem(
                    title: 'My Cart',
                    function: () {},
                    shape: Text(
                      'data',
                      style: black20Bold(),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  BuildProfileItem(
                    title: 'My Reviews',
                    function: () {},
                    shape: Icon(Icons.favorite),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  BuildProfileItem(
                      title: 'Invite a friend',
                      function: () {},
                      shape: Icon(Icons.share)),
                  SizedBox(
                    width: 20,
                  ),
                  BuildProfileItem(
                    title: 'Help and Support',
                    function: () {},
                    shape: Icon(Icons.help_center_outlined),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // Text(
            //   'data',
            //   style: TextStyle(fontSize: 30),
            // ),
            // Text('data'),
            // SizedBox(
            //   height: 10,
            // ),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Cards(),
            //         SizedBox(
            //           width: 30,
            //         ),
            //         Cards(),
            //         SizedBox(
            //           width: 30,
            //         ),
            //       ],
            //     ),
            //     SizedBox(
            //       height: 15,
            //     ),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Cards(),
            //         SizedBox(
            //           width: 30,
            //         ),
            //         Cards(),
            //         SizedBox(
            //           width: 30,
            //         ),
            //       ],
            //     ),
            //     SizedBox(
            //       height: 15,
            //     ),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Cards(),
            //         SizedBox(
            //           width: 30,
            //         ),
            //         Cards(),
            //         SizedBox(
            //           width: 30,
            //         ),
            //       ],
            //     ),
            //     SizedBox(
            //       height: 15,
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
