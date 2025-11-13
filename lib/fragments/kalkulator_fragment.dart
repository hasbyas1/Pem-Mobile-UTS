import 'package:flutter/material.dart';
import 'dart:math';

class KalkulatorFragment extends StatefulWidget {
  const KalkulatorFragment({super.key});

  @override
  State<KalkulatorFragment> createState() => _KalkulatorFragmentState();
}

class _KalkulatorFragmentState extends State<KalkulatorFragment> {
  String _expression = '0'; // Ekspresi lengkap yang ditampilkan
  String _result = ''; // Preview hasil
  double _num1 = 0;
  String _operator = '';
  bool _shouldResetDisplay = false;

  // Fungsi untuk menghitung preview hasil
  void _calculatePreview() {
    if (_operator.isNotEmpty && _expression.isNotEmpty) {
      try {
        // Parse ekspresi untuk operator
        List<String> parts = _expression.split(_operator);
        if (parts.length == 2 && parts[1].isNotEmpty) {
          double num1 = double.parse(parts[0]);
          double num2 = double.parse(parts[1]);
          double result = 0;

          switch (_operator) {
            case '+':
              result = num1 + num2;
              break;
            case '-':
              result = num1 - num2;
              break;
            case '×':
              result = num1 * num2;
              break;
            case '÷':
              if (num2 != 0) {
                result = num1 / num2;
              } else {
                _result = 'Error';
                return;
              }
              break;
          }

          // Format hasil
          if (result == result.toInt()) {
            _result = result.toInt().toString();
          } else {
            _result = result.toStringAsFixed(2);
          }
        }
      } catch (e) {
        _result = '';
      }
    }
  }

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'AC') {
        // Clear semua
        _expression = '0';
        _result = '';
        _num1 = 0;
        _operator = '';
        _shouldResetDisplay = false;
      } else if (buttonText == '⌫') {
        // Backspace
        if (_expression.length > 1) {
          _expression = _expression.substring(0, _expression.length - 1);
          _calculatePreview();
        } else {
          _expression = '0';
          _result = '';
        }
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == '×' ||
          buttonText == '÷') {
        // Operator
        if (_operator.isEmpty) {
          _expression += buttonText;
          _operator = buttonText;
        } else {
          // Ganti operator jika sudah ada
          _expression =
              _expression.substring(0, _expression.length - 1) + buttonText;
          _operator = buttonText;
        }
        _shouldResetDisplay = false;
      } else if (buttonText == '=') {
        // Hitung hasil final
        if (_result.isNotEmpty && _result != 'Error') {
          _expression = _result;
          _result = '';
          _operator = '';
          _shouldResetDisplay = true;
        }
      } else if (buttonText == '√') {
        // Akar kuadrat - langsung hitung hasil
        try {
          double num = double.parse(_expression);
          if (num >= 0) {
            double result = sqrt(num);
            _expression = result == result.toInt()
                ? result.toInt().toString()
                : result.toStringAsFixed(2);
          } else {
            _expression = 'Error';
          }
          _result = '';
          _operator = '';
          _shouldResetDisplay = true;
        } catch (e) {
          _expression = 'Error';
        }
      } else if (buttonText == 'x²') {
        // Kuadrat
        try {
          double num = double.parse(_expression);
          double result = num * num;
          _expression = result == result.toInt()
              ? result.toInt().toString()
              : result.toStringAsFixed(2);
          _result = '';
          _operator = '';
          _shouldResetDisplay = true;
        } catch (e) {
          _expression = 'Error';
        }
      } else {
        // Angka dan titik desimal
        if (_shouldResetDisplay || _expression == '0') {
          _expression = buttonText;
          _shouldResetDisplay = false;
        } else {
          // Cek jika sudah ada titik desimal
          if (buttonText == '.') {
            String currentNumber = _expression.split(RegExp(r'[+\-×÷√]')).last;
            if (currentNumber.contains('.')) {
              return; // Jangan tambah titik lagi
            }
          }
          _expression += buttonText;
        }
        _calculatePreview();
      }
    });
  }

  Widget _buildButton(String buttonText, Color buttonColor, Color textColor) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: () => _buttonPressed(buttonText),
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(12), // Tombol kotak dengan radius kecil
            ),
            padding: const EdgeInsets.all(20),
            elevation: 0,
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
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
        // Display area
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Ekspresi lengkap (98×4) - Single line dengan scroll horizontal
                Container(
                  height: 60, // Tinggi tetap agar tidak bergeser
                  alignment: Alignment.centerRight,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    reverse: true, // Scroll dimulai dari kanan
                    child: Text(
                      _expression,
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Preview hasil (392)
                Container(
                  height: 45, // Tinggi tetap untuk hasil
                  alignment: Alignment.centerRight,
                  child: _result.isNotEmpty
                      ? SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          reverse: true,
                          child: Text(
                            _result,
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w400,
                              color: Colors.green.shade700,
                            ),
                            maxLines: 1,
                            textAlign: TextAlign.right,
                          ),
                        )
                      : const SizedBox(), // Placeholder kosong jika tidak ada hasil
                ),
              ],
            ),
          ),
        ),

        // Buttons area
        Expanded(
          flex: 5,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Column(
              children: [
                // Row 1: AC, √, x², ÷
                Expanded(
                  child: Row(
                    children: [
                      _buildButton('AC', Colors.red.shade400, Colors.white),
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

                // Row 5: 0, ., ⌫, =
                Expanded(
                  child: Row(
                    children: [
                      _buildButton('0', Colors.grey.shade300, Colors.black),
                      _buildButton('.', Colors.grey.shade300, Colors.black),
                      _buildButton('⌫', Colors.red.shade400, Colors.white),
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
