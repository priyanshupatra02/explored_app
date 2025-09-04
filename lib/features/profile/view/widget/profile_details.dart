import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/features/home/controller/pod/get_profile_pod.dart';
import 'package:edtech_app/features/profile/view/widget/detail_row.dart';
import 'package:edtech_app/shared/extension/app_extension.dart';
import 'package:edtech_app/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kPrimaryWhiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
          padding: EdgeInsets.all(24),
          child: Consumer(
            builder: (context, ref, child) {
              final getProfileAsync = ref.watch(getProfileProvider);
              return getProfileAsync.easyWhen(
                data: (profileResponse) {
                  return Column(
                    children: [
                      DetailRow(
                        icon: Icons.email_outlined,
                        label: 'Email',
                        value: profileResponse.email!,
                        delay: 0,
                      ),
                      // DetailRow(
                      //   icon: Icons.phone_outlined,
                      //   label: 'Phone',
                      //   value: "+91 ${profileResponse.phone!}",
                      //   delay: 100,
                      // ),
                      // DetailRow(
                      //   icon: Icons.school_outlined,
                      //   label: 'Career Choice',
                      //   value: profileResponse.careerChoice!,
                      //   delay: 200,
                      // ),
                      DetailRow(
                        icon: Icons.school_outlined,
                        label: 'Career Choice',
                        value: "Psychologist".hardCoded, //TODO: make this dynamic
                        delay: 200,
                      ),
                    ],
                  );
                },
              );
              // return ;
            },
          )),
    );
  }
}
