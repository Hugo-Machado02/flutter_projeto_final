import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final/controllers/auth_controller.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141518),
      appBar: AppBar(
        backgroundColor: const Color(0xFF141518),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Perfil',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: const Border(
          bottom: BorderSide(color: Color(0xFF26272B), width: 1.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 32),
            // Avatar
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF26272B),
                border: Border.all(color: const Color(0xFF8162FF), width: 3),
              ),
              child: const Icon(
                Icons.person,
                size: 60,
                color: Color(0xFF8162FF),
              ),
            ),
            const SizedBox(height: 24),
            // Nome
            Text(
              'Hugo Machado',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const SizedBox(height: 40),
            // Opções do perfil
            _buildProfileOption(
              icon: Icons.edit,
              title: 'Editar Perfil',
              onTap: () {},
            ),
            _buildProfileOption(
              icon: Icons.lock_reset,
              title: 'Alterar Senha',
              onTap: () {},
            ),
            _buildProfileOption(
              icon: Icons.logout,
              title: 'Sair',
              onTap: () {
                final AuthController authController =
                    Get.find<AuthController>();
                authController.logout();
              },
              isDestructive: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: const Color(0xFF26272B),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: isDestructive ? Colors.red : const Color(0xFF8162FF),
                  size: 24,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: isDestructive ? Colors.red : Colors.white,
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
