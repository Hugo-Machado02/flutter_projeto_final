import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final/controllers/user_controller.dart';
import 'package:projeto_final/controllers/navigation_controller.dart';
import 'package:projeto_final/shared/custom_app_bar.dart';
import 'package:projeto_final/shared/custom_menu.dart';
import 'package:projeto_final/pages/operation_users.dart';

class ListUsers extends StatelessWidget {
  const ListUsers({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(
      UserController(),
      permanent: true,
    );
    final NavigationController navController = Get.find<NavigationController>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      navController.setCurrentIndex(0);
    });

    return Scaffold(
      appBar: CustomAppBar(),

      body: Container(
        padding: const EdgeInsets.all(16),
        color: Color(0xFF141518),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24, top: 8),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF8162FF), Color(0xFF9575FF)],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF8162FF).withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.people,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Usuários',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                        Text(
                          'Gerenciar usuários do sistema',
                          style: TextStyle(fontSize: 14, color: Colors.white60),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                if (userController.users.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.1),
                          ),
                          child: Icon(
                            Icons.person_add,
                            size: 48,
                            color: Colors.white38,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Nenhum usuário encontrado',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: userController.users.length,
                  itemBuilder: (context, index) {
                    final user = userController.users[index];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF26272B),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFF8162FF).withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: ListTile(
                        onTap: () => Get.to(() => OperationUsers(user: user)),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 15,
                        ),
                        leading: CircleAvatar(
                          backgroundColor: const Color(0xFF8162FF),
                          child: Text(
                            user.name[0].toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(
                          user.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          user.username,
                          style: const TextStyle(color: Colors.white70),
                        ),
                        trailing: IconButton(
                          onPressed: () => _showDeleteDialog(
                            context,
                            userController,
                            user.id,
                            user.name,
                          ),
                          icon: const Icon(Icons.delete, color: Colors.red),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomMenu(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const OperationUsers()),
        backgroundColor: const Color(0xFF8162FF),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _showDeleteDialog(
    BuildContext context,
    UserController controller,
    int userId,
    String userName,
  ) {
    Get.dialog(
      AlertDialog(
        backgroundColor: const Color(0xFF26272B),
        title: const Text(
          'Confirmar exclusão',
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          'Deseja realmente excluir o usuário $userName?',
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text(
              'Cancelar',
              style: TextStyle(color: Colors.white70),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              controller.removeUser(userId);
            },
            child: const Text('Excluir', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
