import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rpsp_main/app/data/providers/user_provider.dart';
import 'avatar_image.dart';
import 'starts_level.dart';

class UserDataLogo extends StatelessWidget {
  final _userProvider = Get.put(UserProvider());

  UserDataLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final user = _userProvider.user;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: AvatarImage(
              bigRadius: 35,
              smallRadius: 30,
              externalColor: Colors.white,
              file: File(''),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 15),
              Wrap(
                direction: Axis.vertical,
                spacing: -5, // <-- Spacing between children
                children: <Widget>[
                  Text(
                    user.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    user.lastName,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const StarsLevel(),
            ],
          ),
          const Spacer(),
          Wrap(
            direction: Axis.vertical,
            spacing: -5, // <-- Spacing between children
            crossAxisAlignment: WrapCrossAlignment.end,
            children: <Widget>[
              Text(
                'RPSP',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              const Text(
                '2021',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }
}
