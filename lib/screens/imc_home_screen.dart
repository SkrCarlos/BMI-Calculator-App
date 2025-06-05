import 'package:flutter/material.dart';
import 'package:imc_calculator/components/gender_selector.dart';
import 'package:imc_calculator/components/height_selector.dart';
import 'package:imc_calculator/components/number_selector.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';
import 'package:imc_calculator/screens/imc_result_screen.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  double selectedHeight = 170.0;
  int selectedAge = 20;
  int selectedWeight = 70;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(),
        HeightSelector(
          selectedHeight: selectedHeight,
          onHeightChanged: (newHeight) {
            setState(() {
              selectedHeight = newHeight;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: NumberSelector(
                  title: 'Edad',
                  value: selectedAge,
                  onIncrement: () {
                    setState(() {
                      selectedAge++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      if (selectedAge > 0) {
                        selectedAge--;
                      }
                    });
                  },
                ),
              ),
              Expanded(
                child: NumberSelector(
                  title: 'Peso',
                  value: selectedWeight,
                  onIncrement: () {
                    setState(() {
                      selectedWeight++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      if (selectedWeight > 0) {
                        selectedWeight--;
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 32.0,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImcResultScreen(
                      selectedHeight: selectedHeight,
                      selectedWeight: selectedWeight,
                      selectedAge: selectedAge,
                    ),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(AppColors.primary),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: Text('Calcular IMC', style: TextStyles.bodyText),
            ),
          ),
        ),
      ],
    );
  }
}
