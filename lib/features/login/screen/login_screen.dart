import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/assets/colors/color_scheme.dart';
import 'package:mobidoc/assets/text/text_extention.dart';
import 'package:mobidoc/features/common/widgets/base_widgets/full_width_filled_button.dart';
import 'package:mobidoc/features/login/model/user_login_model.dart';
import 'package:mobidoc/features/login/screen/login_screen_wm.dart';
import 'package:mobidoc/features/navigation/domain/entity/app_route_names.dart';

/// Main widget for LoginScreen feature.
@RoutePage(
  name: AppRouteNames.loginScreen,
)
class LoginScreen extends ElementaryWidget<ILoginScreenWM> {
  /// Create an instance [LoginScreen].
  const LoginScreen({
    Key? key,
    WidgetModelFactory wmFactory = loginScreenWMFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ILoginScreenWM wm) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Войти',
                      style: wm.textScheme.bold22,
                    ),
                    _LoginTextFields(
                      loginController: wm.loginController,
                      passwordController: wm.passwordController,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              Expanded(
                child: EntityStateNotifierBuilder<UserLoginModel>(
                  listenableEntityState: wm.loginState,
                  builder: (_, user) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FullWidthFilledButton(
                          child: Text(
                            'Войти',
                            style: wm.textScheme.medium16,
                          ),
                          onPressed: wm.login,
                        ),
                      ],
                    );
                  },
                  loadingBuilder: (_, __) {
                    return const Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _LoadingButton(),
                      ],
                    );
                  },
                  errorBuilder: (_, __, ___) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Неверный логин/пароль'),
                        FullWidthFilledButton(
                          child: Text(
                            'Войти',
                            style: wm.textScheme.medium16,
                          ),
                          onPressed: wm.login,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginTextFields extends StatelessWidget {
  const _LoginTextFields({
    required this.loginController,
    required this.passwordController,
  });

  final TextEditingController loginController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final textStyle = AppTextTheme.of(context).regular16;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Логин',
          style: textStyle,
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: loginController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: 'example',
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          'Пароль',
          style: textStyle,
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: '********',
          ),
        ),
      ],
    );
  }
}

class _LoadingButton extends StatefulWidget {
  const _LoadingButton();

  @override
  State<_LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<_LoadingButton>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  final Tween<double> _rotationTween = Tween(begin: -1, end: 1);

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    animation = _rotationTween.animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.repeat(reverse: true);
        }
      });

    controller.forward();
  }

  @override
  void deactivate() {
    super.deactivate();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FullWidthFilledButton(
      child: CustomPaint(
        painter:
            _WavePainter(animation.value, AppColorScheme.of(context).primary),
        size: const Size(41, 25),
      ),
    );
  }
}

class _WavePainter extends CustomPainter {
  final double animated;
  final Color color;

  const _WavePainter(this.animated, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round;
    final pathArray = _generatePath(animated, size);
    final path = Path()..moveTo(pathArray[0][0], pathArray[0][1]);

    for (final i in pathArray) {
      path.lineTo(i[0], i[1]);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  List<List<double>> _generatePath(double animatedParameter, Size size) {
    var cosList = <double>[];
    final xStep = size.width / 8;
    final yStep = size.height / 2;

    // Generates a list whose values are equal to the sine
    // multiplied by the height factor and the animated parameter.
    for (var a = 0.0; a < pi; a += pi / 4) {
      cosList.add(cos(a) * animatedParameter * yStep);
    }

    cosList = _reshuffleList(cosList);

    // Creates a list with the coordinates of the height of the wave vertices.
    final yList = List.of([...cosList.reversed, ...cosList.sublist(1)]);

    final cordsTable = List<List<double>>.generate(
      yList.length,
      (index) =>
          [(index.toDouble() + 1) * xStep, yList[index] + size.height / 2],
    );

    cordsTable
      ..insert(0, [0, size.height / 2])
      ..add([cordsTable.length * xStep.toDouble(), size.height / 2]);

    return cordsTable;
  }

  // Reshuffles the list according to the pattern:
  // [10, 8, 3, -3, -8] -> [10, -8, 8, -3, 3].
  List<double> _reshuffleList(List<double> inp) {
    final resultList = <double>[];
    for (var i = 0; i < inp.length ~/ 2; i++) {
      resultList
        ..add(inp[i])
        ..add(inp[inp.length - 1 - i]);
    }
    return resultList;
  }
}
