// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

// part 'auth_event.dart';
// part 'auth_state.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   AuthBloc() : super(AuthInitial()) {
//     on<AuthLoginRequest>(
//       (event, emit) async {
//         emit(Authloading());
//         try {
//           final email = event.email;
//           final password = event.password;

//           if (password.length < 6) {
//             return emit(AuthLoginFailure("Password length is less than 6"));
//           }
//           await Future.delayed(Duration(seconds: 1));
//           return emit(AuthLoginSuccessful(uid: '$email- $password'));
//         } catch (e) {
//           return emit(AuthLoginFailure(e.toString()));
//         }
//       },
//     );
//   }
// }
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequest>(
      (event, emit) async {
        emit(Authloading());
        try {
          final email = event.email;
          final password = event.password;

          // Regex for email validation
          final emailRegex =
              RegExp(r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

          if (!emailRegex.hasMatch(email)) {
            return emit(AuthLoginFailure("Invalid email format"));
          }
          if (password.length < 6) {
            return emit(AuthLoginFailure("Password length is less than 6"));
          }

          await Future.delayed(Duration(seconds: 1));
          return emit(AuthLoginSuccessful(uid: '$email - $password'));
        } catch (e) {
          return emit(AuthLoginFailure(e.toString()));
        }
      },
    );
  }
}
