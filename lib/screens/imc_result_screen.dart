import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class ImcResultScreen extends StatelessWidget {
  final double selectedHeight;
  final int selectedWeight;
  final int selectedAge;

  const ImcResultScreen({
    super.key,
    required this.selectedHeight,
    required this.selectedWeight,
    required this.selectedAge,
  });

  @override
  Widget build(BuildContext context) {
    double imcResult =
        selectedWeight / ((selectedHeight / 100) * (selectedHeight / 100));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: toolbarResult(),
      body: bodyResult(imcResult, context),
    );
  }

  Padding bodyResult(double imcResult, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Tú resultado',
            style: TextStyle(
              fontSize: 38,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 32,
                right: 16,
                bottom: 16,
                left: 16,
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      getTitleByImc(imcResult).toUpperCase(),
                      style: TextStyles.bodyText.copyWith(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: getColorByImc(imcResult),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'IMC: ${imcResult.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 128),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        getDescriptionByImc(imcResult),
                        textAlign: TextAlign.center,
                        style: TextStyles.bodyText.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(AppColors.primary),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: Text('Finalizar', style: TextStyles.bodyText),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar toolbarResult() {
    return AppBar(
      title: Text('Resultado del IMC'),
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      centerTitle: false,
    );
  }

  Color getColorByImc(double imcResult) {
    switch (imcResult) {
      case < 18.5:
        return Colors.blue;
      case >= 18.5 && < 24.9:
        return Colors.green;
      case >= 24.9 && < 29.9:
        return Colors.yellow;
      default:
        return Colors.red;
    }
  }

  String getTitleByImc(double imcResult) {
    if (imcResult < 18.5) {
      return 'Bajo peso';
    } else if (imcResult >= 18.5 && imcResult < 24.9) {
      return 'Peso normal';
    } else if (imcResult >= 24.9 && imcResult < 29.9) {
      return 'Sobrepeso';
    } else {
      return 'Obesidad';
    }
  }

  String getDescriptionByImc(double imcResult) {
    if (imcResult < 18.5) {
      return 'Tu IMC indica que tienes un bajo peso. Es importante consultar a un profesional de la salud para evaluar tu situación.';
    } else if (imcResult >= 18.5 && imcResult < 24.9) {
      return 'Tu IMC está en el rango normal. ¡Buen trabajo manteniendo un peso saludable!';
    } else if (imcResult >= 24.9 && imcResult < 29.9) {
      return 'Tu IMC indica sobrepeso. Considera adoptar hábitos más saludables.';
    } else {
      return 'Tu IMC indica obesidad. Es recomendable buscar orientación médica para mejorar tu salud.';
    }
  }
}
