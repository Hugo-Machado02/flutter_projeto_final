import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/models/user.dart';
import 'package:projeto_final/persistence/services/user_service.dart';
import 'package:projeto_final/persistence/repositories/user_repository.dart';
import 'package:projeto_final/persistence/migrations/database_migration.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  var isPasswordVisible = false.obs;
  var isLoading = false.obs;
  var isLoggedIn = false.obs;
  var currentUser = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    await UserRepository.init();
    await DatabaseMigration.runMigrations();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));

    final user = UserService.loginUser(
      emailController.text,
      passwordController.text,
    );

    if (user == null) {
      _showError('Usuário ou senha inválidos');
      isLoading.value = false;
      return;
    }

    currentUser.value = user;
    isLoggedIn.value = true;
    isLoading.value = false;
    Get.offAllNamed('/home');
  }

  void logout() {
    isLoggedIn.value = false;
    currentUser.value = null;
    emailController.clear();
    passwordController.clear();
    Get.offAllNamed('/login');
  }

  Future<void> updateUserFavorites(List<int> favoriteIds) async {
    if (currentUser.value != null) {
      await UserService.updateUserFavorites(currentUser.value!.id, favoriteIds);
      currentUser.value!.favoriteGameIds = favoriteIds;
      currentUser.refresh();
    }
  }

  void reloadCurrentUser() {
    if (currentUser.value != null) {
      final updatedUser = UserService.getUser(currentUser.value!.id);
      if (updatedUser != null) {
        currentUser.value = updatedUser;
      }
    }
  }

  void _showError(String message) {
    Get.snackbar(
      'Erro',
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
