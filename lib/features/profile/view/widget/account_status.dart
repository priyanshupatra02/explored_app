import 'package:edtech_app/features/home/controller/pod/get_profile_pod.dart';
import 'package:edtech_app/features/profile/view/widget/custom_animated_container.dart';
import 'package:edtech_app/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountStatus extends ConsumerWidget {
  const AccountStatus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final getProfileAsync = ref.watch(getProfileProvider);
    return getProfileAsync.easyWhen(
      data: (profileResponse) {
        return profileResponse.isPaid ?? false
            ? CustomAnimatedContainer(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF3E0),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Color(0xFFFFB74D),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Color(0xFFFF9800),
                        size: 24,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Free Account',
                              style: textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFE65100),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Upgrade to unlock premium features',
                              style: textTheme.bodyMedium?.copyWith(
                                color: Color(0xFFBF360C),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : SizedBox.shrink();
      },
    );
  }
}
