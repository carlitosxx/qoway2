# Autenticacion y Autorizacion

## Configuraciones
- Dentro de auth.page.dart, podemos modificar la pagina a la cual nos enviara luego de autenticarnos, especificamente el HomePage().
```
auth
├── views
    └── auth.page.dart
```s
```dart
if (user != null) return const HomePage();
```
