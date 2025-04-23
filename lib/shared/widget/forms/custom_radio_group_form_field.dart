import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomRadioGroupFormField<T> extends StatelessWidget {
  final String name;
  final List<FormBuilderFieldOption<T>> options;
  final InputDecoration? decoration;
  final String? Function(T?)? validator;
  final void Function(T?)? onChanged;
  final Axis direction; // New parameter for controlling layout direction
  final double? borderRadius;

  const CustomRadioGroupFormField({
    super.key,
    required this.name,
    required this.options,
    this.decoration,
    this.validator,
    this.onChanged,
    this.direction = Axis.vertical, this.borderRadius, // Default to vertical (column) layout
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<T>(
      name: name,
      validator: validator,
      builder: (FormFieldState<T?> field) {
        final optionWidgets = options.map(
          (option) {
            final isSelected = field.value == option.value;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
              child: GestureDetector(
                onTap: () {
                  field.didChange(option.value);
                  if (onChanged != null) {
                    onChanged!(option.value);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.kPrimaryColor : AppColors.kSecondaryColor,
                    borderRadius: BorderRadius.circular(borderRadius ?? 100), // Pill shape
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Radio button indicator
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                        child: Container(
                          width: 13,
                          height: 13,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.kPrimaryWhiteColor,
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.kPrimaryColor
                                  : AppColors.kPrimaryWhiteColor,
                              width: 0.0,
                            ),
                          ),
                          child: isSelected
                              ? Center(
                                  child: Container(
                                    width: 6,
                                    height: 6,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.kPrimaryColor,
                                    ),
                                  ),
                                )
                              : null,
                        ),
                      ),
                      // Wrap the option.child with a DefaultTextStyle to control text color
                      DefaultTextStyle(
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              letterSpacing: 0.3,
                              fontWeight: FontWeight.w500,
                              color: isSelected
                                  ? AppColors.kLightSecondaryColor
                                  : AppColors.kPrimaryColor,
                            ),
                        child: option.child!,
                      ).pOnly(right: 40),
                    ],
                  ),
                ),
              ),
            );
          },
        ).toList();

        // Use either Column or Row based on the direction parameter
        if (direction == Axis.vertical) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: optionWidgets,
          );
        } else {
          return Wrap(
            direction: Axis.horizontal,
            children: optionWidgets,
          );
        }
      },
    );
  }
}
