import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Provider/filterProvider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<Filter, bool> activeFilter = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      body: Column(
        children: [
          customSwitch(
              context,
              'Gluten-Free',
              'Only includes Gluten-free meals.',
              activeFilter[Filter.glutenFree]!,
              (bool value) => ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.glutenFree, value)),
          customSwitch(
              context,
              'Lactose-Free',
              'Only includes Lactose-free meals.',
              activeFilter[Filter.lactoseFree]!,
              (bool value) => ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.lactoseFree, value)),
          customSwitch(
              context,
              'Vegan',
              'Only includes Vegan meals.',
              activeFilter[Filter.vegan]!,
              (bool value) => ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegan, value)),
          customSwitch(
              context,
              'Vegetarian',
              'Only includes vegetarian meals.',
              activeFilter[Filter.vegetarian]!,
              (bool value) => ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegetarian, value)),
        ],
      ),
    );
  }

  SwitchListTile customSwitch(
    BuildContext context,
    String title,
    String subtitle,
    bool filter,
    Function(bool newVal) onChanged,
  ) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        subtitle,
        //'Only includes gluten-free meals.',
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
      value: filter,
      onChanged: onChanged,
    );
  }
}
