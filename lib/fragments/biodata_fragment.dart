import 'package:flutter/material.dart';

class BiodataFragment extends StatefulWidget {
  const BiodataFragment({super.key});

  @override
  State<BiodataFragment> createState() => _BiodataFragmentState();
}

class _BiodataFragmentState extends State<BiodataFragment> {
  // Controllers untuk text field
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();

  // Variables untuk dropdown, radio, dan calendar
  String? _selectedJurusan;
  String _selectedGender = 'Laki-laki';
  DateTime? _selectedDate;

  // Variable untuk validasi email
  String? _emailError;

  final List<String> _jurusanList = [
    'Informatika',
    'Sistem Informasi',
    'Teknik Elektro',
    'Teknik Mesin',
    'Teknik Sipil',
  ];

  // Fungsi untuk format NIM otomatis (XX-XXXX-XXX)
  void _formatNIM(String value) {
    // Hapus semua karakter non-digit
    String digitsOnly = value.replaceAll(RegExp(r'[^\d]'), '');

    // Batasi maksimal 9 digit
    if (digitsOnly.length > 9) {
      digitsOnly = digitsOnly.substring(0, 9);
    }

    String formatted = '';

    // Format: XX-XXXX-XXX
    if (digitsOnly.length <= 2) {
      formatted = digitsOnly;
    } else if (digitsOnly.length <= 6) {
      formatted = '${digitsOnly.substring(0, 2)}-${digitsOnly.substring(2)}';
    } else {
      formatted =
          '${digitsOnly.substring(0, 2)}-${digitsOnly.substring(2, 6)}-${digitsOnly.substring(6)}';
    }

    // Update controller tanpa trigger listener lagi
    _nimController.value = TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  // Regex untuk validasi email
  bool _validateEmail(String email) {
    // Regex pattern untuk email
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }

  @override
  void initState() {
    super.initState();

    // Isi data default menggunakan WidgetsBinding agar dipanggil setelah widget dibuild
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _namaController.text = 'Muhammad Hasby As-shiddiqy';
        _nimController.text = '15-2023-072';
        _emailController.text = 'muhammad.hasby@mhs.itenas.ac.id';
        _selectedJurusan = 'Informatika';
        _selectedGender = 'Laki-laki';
        _selectedDate = DateTime(2006, 1, 11); // 11 Januari 2006
        _alamatController.text =
            'Jl. Terusan Pasteur (Garunggang Kulon) No.22/65 Bandung, Jawa Barat';
      });
    });
  }

  // Method untuk validasi email saat user mengetik
  void _onEmailChanged(String value) {
    setState(() {
      if (value.isEmpty) {
        _emailError = 'Email tidak boleh kosong';
      } else if (!_validateEmail(value)) {
        _emailError = 'Format email tidak valid';
      } else {
        _emailError = null;
      }
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2010),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Profile Photo Section
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue.shade700, width: 3),
            ),
            child: const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blue,
              backgroundImage: AssetImage('assets/images/hasby.jpg'),
              // child: Icon(
              //   Icons.person,
              //   size: 60,
              //   color: Colors.white,
              // ),
            ),
          ),

          const SizedBox(height: 30),

          // Card untuk form biodata
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Informasi Pribadi',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Nama Lengkap
                  TextField(
                    controller: _namaController,
                    decoration: InputDecoration(
                      labelText: 'Nama Lengkap',
                      prefixIcon: const Icon(Icons.person_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // NIM
                  TextField(
                    controller: _nimController,
                    keyboardType: TextInputType.number,
                    onChanged: _formatNIM,
                    decoration: InputDecoration(
                      labelText: 'NIM',
                      prefixIcon: const Icon(Icons.badge_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'XX-XXXX-XXX',
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Email dengan validasi regex
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: _onEmailChanged,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: _emailError != null ? Colors.red : Colors.grey,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: _emailError != null ? Colors.red : Colors.blue,
                          width: 2,
                        ),
                      ),
                      errorText: _emailError,
                      errorStyle: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                      suffixIcon: _emailController.text.isNotEmpty
                          ? Icon(
                              _emailError == null
                                  ? Icons.check_circle
                                  : Icons.error,
                              color: _emailError == null
                                  ? Colors.green
                                  : Colors.red,
                            )
                          : null,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Dropdown Jurusan
                  DropdownButtonFormField<String>(
                    value: _selectedJurusan,
                    decoration: InputDecoration(
                      labelText: 'Jurusan',
                      prefixIcon: const Icon(Icons.school_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    items: _jurusanList.map((String jurusan) {
                      return DropdownMenuItem<String>(
                        value: jurusan,
                        child: Text(jurusan),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedJurusan = newValue;
                      });
                    },
                  ),

                  const SizedBox(height: 20),

                  // Radio Button untuk Gender (2 Kolom)
                  const Text(
                    'Jenis Kelamin',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text(
                            'Laki-laki',
                            style: TextStyle(fontSize: 14),
                          ),
                          value: 'Laki-laki',
                          groupValue: _selectedGender,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                          activeColor: Colors.blue,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text(
                            'Perempuan',
                            style: TextStyle(fontSize: 14),
                          ),
                          value: 'Perempuan',
                          groupValue: _selectedGender,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                          activeColor: Colors.blue,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // Tanggal Lahir dengan Calendar Picker
                  InkWell(
                    onTap: () => _selectDate(context),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Tanggal Lahir',
                        prefixIcon: const Icon(Icons.calendar_today_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        _selectedDate == null
                            ? 'Pilih Tanggal'
                            : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                        style: TextStyle(
                          color: _selectedDate == null
                              ? Colors.grey
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Alamat
                  TextField(
                    controller: _alamatController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: 'Alamat',
                      prefixIcon: const Icon(Icons.home_outlined),
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Tombol Simpan
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Validasi semua field sebelum menyimpan
                        if (_namaController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Nama tidak boleh kosong'),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }

                        if (_emailController.text.isEmpty ||
                            _emailError != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Email tidak valid'),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }

                        if (_selectedJurusan == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Pilih jurusan terlebih dahulu'),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }

                        // Jika semua validasi lolos
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Data berhasil disimpan!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Simpan',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _emailController.dispose();
    _alamatController.dispose();
    super.dispose();
  }
}
