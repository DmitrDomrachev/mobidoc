import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/api/errors/request_exception.dart';
import 'package:mobidoc/api/service/api_client.dart';
import 'package:mobidoc/config/app_config.dart';
import 'package:mobidoc/config/environment/environment.dart';
import 'package:mobidoc/features/card/domain/medical_card_repository.dart';
import 'package:mobidoc/features/card/domain/medical_card_repository_impl.dart';
import 'package:mobidoc/features/common/service/theme/theme_service.dart';
import 'package:mobidoc/features/common/service/theme/theme_service_impl.dart';
import 'package:mobidoc/features/doctors/domain/repository/doctor_repository.dart';
import 'package:mobidoc/features/doctors/domain/repository/doctor_repository_impl.dart';
import 'package:mobidoc/features/login/domain/interactor/auth_interactor.dart';
import 'package:mobidoc/features/login/domain/repository/auth_repository.dart';
import 'package:mobidoc/features/navigation/service/app_router.dart';
import 'package:mobidoc/features/services/domain/repository/service_repository.dart';
import 'package:mobidoc/features/services/domain/repository/service_repository_impl.dart';
import 'package:mobidoc/persistence/storage/auth_storage/auth_storage.dart';
import 'package:mobidoc/persistence/storage/auth_storage/auth_storage_impl.dart';
import 'package:mobidoc/persistence/storage/theme_storage/theme_storage.dart';
import 'package:mobidoc/persistence/storage/theme_storage/theme_storage_impl.dart';
import 'package:mobidoc/util/default_error_handler.dart';

/// Scope of dependencies which need through all app's life.
class AppScope implements IAppScope {
  static const _themeByDefault = ThemeMode.system;

  late final Dio _dio;
  late final ApiClient _apiClient;
  late final DoctorRepository _doctorRepository;
  late final ServiceRepository _serviceRepository;
  late final MedicalCardRepository _cardRepository;
  late final AuthRepository _authRepository;
  late final ErrorHandler _errorHandler;
  late final AppRouter _router;
  late final IThemeService _themeService;
  late final AuthStorage _authStorage;
  late final AuthInteractor _authInteractor;

  @override
  late VoidCallback applicationRebuilder;

  @override
  ErrorHandler get errorHandler => _errorHandler;

  @override
  AppRouter get router => _router;

  @override
  IThemeService get themeService => _themeService;

  @override
  DoctorRepository get doctorRepository => _doctorRepository;

  @override
  ServiceRepository get serviceRepository => _serviceRepository;

  @override
  MedicalCardRepository get cardRepository => _cardRepository;

  @override
  AuthInteractor get authInteractor => _authInteractor;

  late IThemeModeStorage _themeModeStorage;

  /// Create an instance [AppScope].
  AppScope() {
    /// List interceptor. Fill in as needed.
    final additionalInterceptors = <Interceptor>[
      InterceptorsWrapper(
        onError: (e, handler) {
          if (e.error is SocketException) {
            return handler.reject(
              RequestException(
                'No internet: ${e.message}',
                requestOptions: e.requestOptions,
              ),
            );
          }
          if (e.type == DioErrorType.badResponse) {
            return handler.reject(
              RequestException(
                'HTTP error: ${e.message}',
                requestOptions: e.requestOptions,
              ),
            );
          }
          return handler.next(e);
        },
      ),
    ];

    _dio = _initDio(additionalInterceptors);
    _apiClient = ApiClient(_dio);
    _authStorage = AuthStorageImpl();
    _doctorRepository = DoctorRepositoryImpl(_apiClient);
    _serviceRepository = ServiceRepositoryImpl(_apiClient);
    _cardRepository = MedicalCardRepositoryImpl(_apiClient);
    _authRepository = AuthRepository(_apiClient, _authStorage);
    _errorHandler = DefaultErrorHandler();
    _router = AppRouter.instance();
    _themeModeStorage = ThemeModeStorageImpl();
    _authInteractor = AuthInteractor(_authRepository);
  }

  @override
  Future<void> initTheme() async {
    final theme =
        await ThemeModeStorageImpl().getThemeMode() ?? _themeByDefault;
    _themeService = ThemeServiceImpl(theme);
    _themeService.addListener(_onThemeModeChanged);
  }

  Dio _initDio(Iterable<Interceptor> additionalInterceptors) {
    const timeout = Duration(seconds: 2);

    final dio = Dio();

    dio.options
      ..baseUrl = Environment<AppConfig>.instance().config.url
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout
      ..headers = <String, dynamic>{'Accept': 'application/json'};

    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (client) {
      final proxyUrl = Environment<AppConfig>.instance().config.proxyUrl;
      if (proxyUrl != null && proxyUrl.isNotEmpty) {
        client
          ..findProxy = (uri) {
            return 'PROXY $proxyUrl';
          }
          ..badCertificateCallback = (_, __, ___) {
            return true;
          };
      }

      return client;
    };

    dio.interceptors.addAll(additionalInterceptors);

    if (Environment<AppConfig>.instance().isDebug) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }

    return dio;
  }

  Future<void> _onThemeModeChanged() async {
    await _themeModeStorage.saveThemeMode(mode: _themeService.currentThemeMode);
  }
}

/// App dependencies.
abstract class IAppScope {
  /// Repository for working with the Doctor model.
  DoctorRepository get doctorRepository;

  /// Repository for working with the Service model.
  ServiceRepository get serviceRepository;

  /// Repository for working with the Card model.
  MedicalCardRepository get cardRepository;

  /// Interactor for authorization logic.
  AuthInteractor get authInteractor;

  /// Interface for handle error in business logic.
  ErrorHandler get errorHandler;

  /// Callback to rebuild the whole application.
  VoidCallback get applicationRebuilder;

  /// Class that coordinates navigation for the whole app.
  AppRouter get router;

  /// A service that stores and retrieves app theme mode.
  IThemeService get themeService;

  /// Init theme service with theme from storage or default value.
  Future<void> initTheme();
}
