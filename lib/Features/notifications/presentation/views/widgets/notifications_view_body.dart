import 'package:colt_shop/Features/notifications/presentation/views/widgets/notification_listview.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class NotificationsViewBody extends StatelessWidget {
  const NotificationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 40),
          const Text(
            'Notifications',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      // const SizedBox(
                      //   height: 200,
                      //   child: Center(
                      //     child: Icon(
                      //       FontAwesomeIcons.bell,
                      //       size: 100,
                      //       color: Colors.grey,
                      //     ),
                      //   ),
                      // ),
                      // CustomButton(
                      //   onPressed: () {
                      //     GoRouter.of(context).push(AppRouter.kCategories);
                      //   },
                      //   text: 'Explore Categories',
                      // ).marginAll(40),
                      // const SizedBox(height: 40),
                      NotificationListview(),
                    ],
                  ),
                ),
               
              ],
            ),
          ),
        ],
      ),
    );
  }
}






