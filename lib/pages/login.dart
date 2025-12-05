import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final/controllers/auth_controller.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    
    return Scaffold(
      backgroundColor: const Color(0xFF141518),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: authController.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo/Título
                  Container(
                    margin: const EdgeInsets.only(bottom: 48.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.games,
                          size: 80,
                          color: const Color(0xFF8162FF),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Catálogo de Jogos',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Faça login para continuar',
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),

                  // Campo Email
                  Container(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    child: TextFormField(
                      controller: authController.emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: const TextStyle(color: Colors.white70),
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Color(0xFF8162FF),
                        ),
                        filled: true,
                        fillColor: const Color(0xFF26272B),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF8162FF),
                            width: 2,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira seu email';
                        }
                        if (!value.contains('@')) {
                          return 'Por favor, insira um email válido';
                        }
                        return null;
                      },
                    ),
                  ),

                  // Campo Senha
                  Container(
                    margin: const EdgeInsets.only(bottom: 24.0),
                    child: Obx(() => TextFormField(
                      controller: authController.passwordController,
                      obscureText: !authController.isPasswordVisible.value,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        labelStyle: const TextStyle(color: Colors.white70),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color(0xFF8162FF),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            authController.isPasswordVisible.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.white70,
                          ),
                          onPressed: authController.togglePasswordVisibility,
                        ),
                        filled: true,
                        fillColor: const Color(0xFF26272B),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF8162FF),
                            width: 2,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira sua senha';
                        }
                        if (value.length < 6) {
                          return 'A senha deve ter pelo menos 6 caracteres';
                        }
                        return null;
                      },
                    )),
                  ),

                  // Botão Login
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: Obx(() => ElevatedButton(
                      onPressed: authController.isLoading.value 
                          ? null 
                          : authController.login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8162FF),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: authController.isLoading.value
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              'Entrar',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
