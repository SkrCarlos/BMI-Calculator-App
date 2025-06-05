import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class HeightSelector extends StatefulWidget {
  final double selectedHeight;
  final Function(double) onHeightChanged;

  const HeightSelector({
    super.key,
    required this.selectedHeight,
    required this.onHeightChanged,
  });

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 10.0,
        bottom: 10.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('Altura'.toUpperCase(), style: TextStyles.bodyText),
              Text(
                '${widget.selectedHeight.toStringAsFixed(0)} cm',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Slider(
                value: widget.selectedHeight,
                min: 100.0,
                max: 220.0,
                divisions: 120,
                activeColor: AppColors.primary,
                label: '${widget.selectedHeight.toStringAsFixed(0)} cm',
                onChanged: (double newHeight) {
                  setState(() {
                    widget.onHeightChanged(newHeight);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
