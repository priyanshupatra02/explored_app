import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomRadioGroupFormField<T> extends StatefulWidget {
  final String name;
  final List<FormBuilderFieldOption<T>> options;
  final InputDecoration? decoration;
  final String? Function(T?)? validator;
  final void Function(T?)? onChanged;
  final Axis direction; // Parameter for controlling layout direction
  final double? borderRadius;
  final TextEditingController? controller; // Optional TextEditingController

  const CustomRadioGroupFormField({
    super.key,
    required this.name,
    required this.options,
    this.decoration,
    this.validator,
    this.onChanged,
    this.direction = Axis.vertical,
    this.borderRadius,
    this.controller, // Add controller parameter
  });

  @override
  State<CustomRadioGroupFormField<T>> createState() => _CustomRadioGroupFormFieldState<T>();
}

class _CustomRadioGroupFormFieldState<T> extends State<CustomRadioGroupFormField<T>> {
  late TextEditingController _controller;
  T? _currentValue;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();

    // If controller is provided externally, set up listener
    if (widget.controller != null) {
      _controller.addListener(_handleControllerChanged);
    }
  }

  @override
  void dispose() {
    // Only dispose the controller if we created it internally
    if (widget.controller == null) {
      _controller.dispose();
    } else {
      _controller.removeListener(_handleControllerChanged);
    }
    super.dispose();
  }

  // Handle changes from the controller
  void _handleControllerChanged() {
    // If the controller has a value that can be parsed to set the radio value
    if (_controller.text.isNotEmpty) {
      // This is a simplified approach. You'll need to implement proper conversion
      // from text to T value based on your specific needs
      try {
        // Find option that matches the controller text
        final matchingOption = widget.options.firstWhere(
          (option) => option.value.toString() == _controller.text,
          orElse: () => widget.options.first,
        );

        if (_currentValue != matchingOption.value) {
          setState(() {
            _currentValue = matchingOption.value;
          });

          if (widget.onChanged != null) {
            widget.onChanged!(_currentValue);
          }
        }
      } catch (e) {
        // Handle parsing errors
        debugPrint('Error parsing controller value: $e');
      }
    }
  }

  // Update controller when radio selection changes
  void _updateController(T? value) {
    if (_currentValue != value) {
      _currentValue = value;

      // Update controller text to reflect the new value
      if (value != null && _controller.text != value.toString()) {
        _controller.text = value.toString();
      }

      if (widget.onChanged != null) {
        widget.onChanged!(value);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<T>(
      name: widget.name,
      validator: widget.validator,
      initialValue: _currentValue,
      builder: (FormFieldState<T?> field) {
        // If field has a value but current value doesn't, sync them
        if (field.value != null && _currentValue == null) {
          _currentValue = field.value;
          // Update controller if needed
          if (_controller.text != field.value.toString()) {
            _controller.text = field.value.toString();
          }
        }

        final optionWidgets = widget.options.map(
          (option) {
            final isSelected = field.value == option.value;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
              child: GestureDetector(
                onTap: () {
                  field.didChange(option.value);
                  _updateController(option.value);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.kPrimaryColor : AppColors.kSecondaryColor,
                    borderRadius: BorderRadius.circular(widget.borderRadius ?? 100), // Pill shape
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
                      // Fixed text styling for better contrast
                      DefaultTextStyle(
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              letterSpacing: 0.3,
                              fontWeight: FontWeight.w500,
                              color: isSelected
                                  ? AppColors
                                      .kSecondaryColor // Use white for selected text for better contrast
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
        if (widget.direction == Axis.vertical) {
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
