import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/models/user.dart';
import 'package:projeto_final/persistence/services/user_service.dart';
import 'package:projeto_final/controllers/auth_controller.dart';

class UserController extends GetxController {
  var users = <User>[].obs;
  var isLoading = false.obs;
  var isEditing = false.obs;
  var editingUserId = 0;
  var fromProfile = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    loadUsers();
  }

  void loadUsers() {
    users.value = UserService.getAllUsers();
  }

  Future<void> saveUser() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    final success = isEditing.value
        ? await _updateUser()
        : await UserService.registerUser(
            nameController.text,
            emailController.text,
            passwordController.text,
          );

    if (success) {
      loadUsers();
      _showSuccess(isEditing.value ? 'Usuário atualizado' : 'Usuário criado');
      clearForm();

      if (fromProfile) {
        Get.back();
      } else {
        Get.offAllNamed('/usuarios');
      }
    } else {
      _showError('Email já existe ou erro ao salvar');
    }

    isLoading.value = false;
  }

  Future<bool> _updateUser() async {
    final user = UserService.getUser(editingUserId);
    if (user == null) return false;

    user.name = nameController.text;
    user.username = emailController.text;
    user.password = passwordController.text;

    await UserService.updateUser(user);

    final authController = Get.find<AuthController>();
    if (authController.currentUser.value?.id == editingUserId) {
      authController.reloadCurrentUser();
    }

    return true;
  }

  Future<void> removeUser(int userId) async {
    final success = await UserService.removeUser(userId);

    if (success) {
      loadUsers();

      final authController = Get.find<AuthController>();
      if (authController.currentUser.value?.id == userId) {
        authController.logout();
        return;
      }

      _showSuccess('Usuário removido');
    } else {
      _showError('Erro ao remover usuário');
    }
  }

  void setEditingUser(User user, {bool isFromProfile = false}) {
    isEditing.value = true;
    editingUserId = user.id;
    fromProfile = isFromProfile;
    nameController.text = user.name;
    emailController.text = user.username;
    passwordController.text = user.password;
  }

  void clearForm() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    isEditing.value = false;
    editingUserId = 0;
    fromProfile = false;
  }

  void _showSuccess(String message) {
    Get.snackbar(
      'Sucesso',
      message,
      backgroundColor: const Color(0xFF8162FF),
      colorText: Colors.white,
    );
  }

  void _showError(String message) {
    Get.snackbar(
      'Erro',
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}
