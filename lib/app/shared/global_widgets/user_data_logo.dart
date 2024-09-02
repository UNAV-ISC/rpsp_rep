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
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          AvatarImage(
            bigRadius: 35,
            smallRadius: 30,
            externalColor: Colors.white,
            file: File(''),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                direction: Axis.vertical,
                children: user.name
                    .split(' ')
                    .map((e) => Text(
                          e,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                    .toList(),
              ),
              const StarsLevel(),
            ],
          ),
          const Spacer(),
          Container(
            alignment: Alignment.centerRight,
            child: const Text(
              'RPSP',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
