import 'package:flutter/material.dart';
import 'package:reservation_app/routes/route_named.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      AppBar(
      backgroundColor: Color(0xFFF6EFE8),
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_on_outlined,
            color: Color(0xFFAD3F32),
          ),
          Text(
            'Dong Khoi St, District 1',
            style: TextStyle(
                color: Color(0xFF483332),
                fontSize: 13,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
      centerTitle: true,
      actions: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(50)),
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNamed.notificationPage);
            },
            icon: const Icon(Icons.notifications_outlined),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
