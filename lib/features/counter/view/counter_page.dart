import 'package:auto_route/annotations.dart';
import 'package:edtech_app/features/counter/controller/counter_state_pod.dart';
import 'package:edtech_app/features/theme_segmented_btn/view/theme_segmented_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage(
  deferredLoading: true,
)
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CounterView();
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const CounterAppBarTitle(),
      //   actions: const [
      //     AppLocalePopUp(),
      //   ],
      // ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CounterText(),
            ThemeSegmentedBtn(),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Consumer(
            builder: (context, ref, child) {
              return FloatingActionButton(
                heroTag: 'add',
                onPressed: () => ref.read(counterPod.notifier).increment(),
                child: const Icon(Icons.add),
              );
            },
          ),
          const SizedBox(height: 8),
          Consumer(
            builder: (context, ref, child) {
              return FloatingActionButton(
                heroTag: 'subtract',
                onPressed: () => ref.read(counterPod.notifier).decrement(),
                child: const Icon(Icons.remove),
              );
            },
          ),
        ],
      ),
    );
  }
}

// class CounterAppBarTitle extends StatelessWidget {
//   const CounterAppBarTitle({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final l10n = context.l10n;
//     return Text(l10n.counterAppBarTitle);
//   }
// }

class CounterText extends ConsumerWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final count = ref.watch(counterPod);
    return Text('$count', style: theme.textTheme.displayLarge);
  }
}
