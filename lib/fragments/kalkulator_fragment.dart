import 'package:flutter/material.dart';
import 'dart:math';

class KalkulatorFragment extends StatefulWidget {
  const KalkulatorFragment({super.key});

  @override
  State<KalkulatorFragment> createState() => _KalkulatorFragmentState();
}

class _KalkulatorFragmentState extends State<KalkulatorFragment> {
  String _output = '0';
  String _currentInput = '';
  double _num1 = 0;
  double _num2 = 0;
  String _operator = '';

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        // Clear/Reset
        _output = '0';
        _currentInput = '';
        _num1 = 0;
        _num2 = 0;
        _operator = '';
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == '×' ||
          buttonText == '÷') {
        // Operator
        _num1 = double.parse(_output);
        _operator = buttonText;
        _currentInput = '';
      } else if (buttonText == '=') {
        // Calculate result
        _num2 = double.parse(_output);

        if (_operator == '+') {
          _output = (_num1 + _num2).toString();
        } else if (_operator == '-') {
          _output = (_num1 - _num2).toString();
        } else if (_operator == '×') {
          _output = (_num1 * _num2).toString();
        } else if (_operator == '÷') {
          if (_num2 != 0) {
            _output = (_num1 / _num2).toString();
          } else {
            _output = 'Error';
          }
        }

        // Format output jika desimal tidak diperlukan
        if (_output.contains('.') &&
            double.parse(_output) == double.parse(_output).toInt()) {
          _output = double.parse(_output).toInt().toString();
        }

        _num1 = 0;
        _num2 = 0;
        _operator = '';
        _currentInput = _output;
      } else if (buttonText == '√') {
        // Akar kuadrat
        double num = double.parse(_output);
        if (num >= 0) {
          _output = sqrt(num).toString();
        } else {
          _output = 'Error';
        }
      } else if (buttonText == 'x²') {
        // Kuadrat
        double num = double.parse(_output);
        _output = (num * num).toString();

        // Format output
        if (_output.contains('.') &&
            double.parse(_output) == double.parse(_output).toInt()) {
          _output = double.parse(_output).toInt().toString();
        }
      } else {
        // Angka
        if (_output == '0' || _currentInput == '') {
          _output = buttonText;
        } else {
          _output = _output + buttonText;
        }
        _currentInput = _output;
      }
    });
  }

  Widget _buildButton(String buttonText, Color buttonColor, Color textColor) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5),
        child: ElevatedButton(
          onPressed: () => _buttonPressed(buttonText),
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(20),
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Display output
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomRight,
            child: Text(
              _output,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),

        // Buttons
        Expanded(
          flex: 5,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                // Row 1: C, √, x², ÷
                Expanded(
                  child: Row(
                    children: [
                      _buildButton('C', Colors.red.shade400, Colors.white),
                      _buildButton('√', Colors.blue.shade400, Colors.white),
                      _buildButton('x²', Colors.blue.shade400, Colors.white),
                      _buildButton('÷', Colors.orange.shade400, Colors.white),
                    ],
                  ),
                ),

                // Row 2: 7, 8, 9, ×
                Expanded(
                  child: Row(
                    children: [
                      _buildButton('7', Colors.grey.shade300, Colors.black),
                      _buildButton('8', Colors.grey.shade300, Colors.black),
                      _buildButton('9', Colors.grey.shade300, Colors.black),
                      _buildButton('×', Colors.orange.shade400, Colors.white),
                    ],
                  ),
                ),

                // Row 3: 4, 5, 6, -
                Expanded(
                  child: Row(
                    children: [
                      _buildButton('4', Colors.grey.shade300, Colors.black),
                      _buildButton('5', Colors.grey.shade300, Colors.black),
                      _buildButton('6', Colors.grey.shade300, Colors.black),
                      _buildButton('-', Colors.orange.shade400, Colors.white),
                    ],
                  ),
                ),

                // Row 4: 1, 2, 3, +
                Expanded(
                  child: Row(
                    children: [
                      _buildButton('1', Colors.grey.shade300, Colors.black),
                      _buildButton('2', Colors.grey.shade300, Colors.black),
                      _buildButton('3', Colors.grey.shade300, Colors.black),
                      _buildButton('+', Colors.orange.shade400, Colors.white),
                    ],
                  ),
                ),

                // Row 5: 0, ., =
                Expanded(
                  child: Row(
                    children: [
                      _buildButton('0', Colors.grey.shade300, Colors.black),
                      _buildButton('.', Colors.grey.shade300, Colors.black),
                      _buildButton('=', Colors.green.shade400, Colors.white),
                      _buildButton('=', Colors.green.shade400, Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
