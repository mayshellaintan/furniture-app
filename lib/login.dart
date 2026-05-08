import 'package:flutter/material.dart';
import 'home.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const SizedBox(height: 80),
              
              // 1. Header: Garis dekoratif dengan Logo Kursi di tengah
              Row(
                children: [
                  const Expanded(child: Divider(thickness: 1, color: Color(0xFFBDBDBD))),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFBDBDBD)),
                      ),
                      child: const Icon(
                        Icons.chair_outlined,
                        size: 30,
                        color: Color(0xFF242424),
                      ),
                    ),
                  ),
                  const Expanded(child: Divider(thickness: 1, color: Color(0xFFBDBDBD))),
                ],
              ),
              
              const SizedBox(height: 30),
              
              // 2. Judul Selamat Datang
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello !',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey[600],
                        fontFamily: 'Georgia', // Gaya Serif agar elegan
                      ),
                    ),
                    const Text(
                      'WELCOME BACK',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF242424),
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // 3. Card Putih (Form Input)
              Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Field Email
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.grey),
                        suffixIcon: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF242424)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    
                    // Field Password
                    TextFormField(
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: Colors.grey),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible ? Icons.visibility : Icons.visibility_off_outlined,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF242424)),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 35),
                    
                    // Teks Lupa Password
                    GestureDetector(
                      onTap: () {
                        // Aksi lupa password
                      },
                      child: const Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: Color(0xFF242424),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 35),

                    // Tombol Log in
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigasi ke Home
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const HomePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF242424),
                          foregroundColor: Colors.white,
                          elevation: 10,
                          shadowColor: Colors.black.withOpacity(0.3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Log in',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Tombol Sign up
                    GestureDetector(
                      onTap: () {
                        // Navigasi ke Sign Up
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignupPage()),
                        );
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          color: Color(0xFF242424),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}