import 'package:flutter/material.dart';
import 'package:flutter_application_1/projects/widgets/nav_bar_scaffold.dart';
import 'package:flutter_application_1/projects/widgets/ticket_bar.dart';
import 'package:flutter_application_1/projects/widgets/train_ticket_list.dart';
import '../utils/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_bloc/login_bloc.dart';
import 'register_bloc/register_bloc.dart';
import 'pages/TicketPage.dart';

void main(List<String> args) {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: "/login",
      routes: {
        "/login": (context) => LoginPage(),
        "/register": (context) => RegisterPage(),
        "/search": (context) => SearchPage(),
        "/history": (context) => HistoryPage(),
        "/Mine": (context) => MinePage(),
        '/check': (context) => TicketPage(),
      },
    );
  }
}

const activeColor = Color(0xFF2B55A8);

// 统一的左右边距
const EdgeInsets _hPadding = EdgeInsets.symmetric(horizontal: 48.0);

// 统一的输入框样式
Widget _buildInputField({
  required String hintText,
  TextEditingController? controller,
  TextInputType keyboardType = TextInputType.text,
  bool obscureText = false,
}) {
  // 定义 hintText 的样式，使用 withOpacity 调整透明度
  const TextStyle hintTextStyle = TextStyle(
    // 使用主题颜色或特定颜色，并设置透明度
    color: Color(0xFF212529),
    fontSize: 16,

    fontWeight: FontWeight.w400,
  );

  return Container(
    // 移除固定的 280 宽度，让它自动填充可用空间
    width: double.infinity,
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFFEDF7FE)),
        borderRadius: BorderRadius.circular(999),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,

          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          // 在这里应用自定义的 hintStyle
          hintStyle: hintTextStyle.copyWith(
            color: hintTextStyle.color!.withOpacity(0.5), // 降低透明度到 50%
          ),
          border: InputBorder.none, // 移除默认的下划线
          isDense: true,
          contentPadding: EdgeInsets.zero,
        ),
      ),
    ),
  );
}

// 统一的标签样式
Widget _buildLabel(String text) {
  return Opacity(
    opacity: 0.80,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF212529),
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _user = TextEditingController();
  final TextEditingController _pwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: Scaffold(
        backgroundColor: const Color(0xFFE8F0F6),
        body: Center(
          child: SingleChildScrollView(
            padding: _hPadding,
            child: BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state.status == LoginStatus.success) {
                  Navigator.pushReplacementNamed(context, '/search');
                }
                if (state.status == LoginStatus.error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Username or password incorrect")),
                  );
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 36,
                      fontFamily: "Lora",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 60),

                  /// Username
                  _buildLabel('username'),
                  _buildInputField(hintText: 'user123', controller: _user),
                  const SizedBox(height: 24),

                  /// Password
                  _buildLabel('Password'),
                  _buildInputField(
                    hintText: '*******',
                    obscureText: true,
                    controller: _pwd,
                  ),
                  const SizedBox(height: 24),

                  // -------------------------
                  // LOGIN BUTTON + BlocBuilder
                  // -------------------------
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state.status == LoginStatus.loading) {
                        return Center(child: CircularProgressIndicator());
                      }

                      return GestureDetector(
                        onTap: () {
                          context.read<LoginBloc>().add(
                            LoginEvent(_user.text, _pwd.text),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration: ShapeDecoration(
                            color: const Color(0xFF4DABF7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x334DABF7),
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 60),

                  // 注册 Row...
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Doesn’t have any account?',
                          style: TextStyle(
                            color: Color(0xFF212529),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: const Text(
                            'Register here',
                            style: TextStyle(
                              color: Color(0xFF1665A6),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  Opacity(
                    opacity: 0.40,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        'Use the application according to policy rules. Any kinds of violations will be subject to sanctions',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF212529),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
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

// ---------------------------------------------------
// 注册页面 (RegisterScreen) - 基于用户提供的字段进行响应式重构
// ---------------------------------------------------

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _user = TextEditingController();
  final TextEditingController _pwd = TextEditingController();
  final TextEditingController _confirmPwd = TextEditingController();
  final TextEditingController _idNumber = TextEditingController();
  final TextEditingController _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterBloc(),
      child: Scaffold(
        backgroundColor: const Color(0xFFE8F0F6),
        body: Center(
          child: SingleChildScrollView(
            padding: _hPadding,
            child: BlocListener<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state.status == RegisterStatus.success) {
                  Navigator.pushReplacementNamed(context, '/login');
                }
                if (state.status == RegisterStatus.error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Registration failed')),
                  );
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 36,
                      fontFamily: "Lora",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 60),

                  _buildLabel('username'),
                  _buildInputField(controller: _user, hintText: 'user123'),
                  const SizedBox(height: 24),

                  _buildLabel('Password'),
                  _buildInputField(
                    controller: _pwd,
                    hintText: '********',
                    obscureText: true,
                  ),
                  const SizedBox(height: 24),

                  _buildLabel('Confirm Password'),
                  _buildInputField(
                    controller: _confirmPwd,
                    hintText: '********',
                    obscureText: true,
                  ),
                  const SizedBox(height: 24),

                  _buildLabel('ID number'),
                  _buildInputField(
                    controller: _idNumber,
                    hintText: '18 digit ID number',
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 24),

                  _buildLabel('Phone number'),
                  _buildInputField(
                    controller: _phone,
                    hintText: '11 digit phone number',
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 60),

                  // 注册按钮 BlocBuilder
                  BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      if (state.status == RegisterStatus.loading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return GestureDetector(
                        onTap: () {
                          context.read<RegisterBloc>().add(
                            RegisterButtonPressed(
                              username: _user.text,
                              password: _pwd.text,
                              confirmPassword: _confirmPwd.text,
                              idNumber: _idNumber.text,
                              phoneNumber: _phone.text,
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration: ShapeDecoration(
                            color: const Color(0xFF4DABF7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x334DABF7),
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 60),

                  // 返回登录页
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Has any account ?',
                          style: TextStyle(
                            color: Color(0xFF212529),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Login here',
                            style: TextStyle(
                              color: Color(0xFF1665A6),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  Opacity(
                    opacity: 0.4,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: const Text(
                        'By registering to account, you are agree to our terms and condition',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF212529),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// 原始的 SearchPage 类定义
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 0; // 当前选中的导航项索引

  // --- build 方法 ---

  @override
  Widget build(BuildContext context) {
    // 定义统一的浅蓝色背景
    const lightBlueBackground = Color(0xFFE8F0F6);
    return Scaffold(
      backgroundColor: lightBlueBackground,

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: TicketBar(),
          ),
          Expanded(
            child: NavBarScaffold(
              backgroundColor: lightBlueBackground,
              currentPageIndex: _selectedIndex,
              bodyContent: TrainTicketList(
                tickets: NavBarScaffold.trainTickets,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    const lightBlueBackground = Color(0xFFE8F0F6);
    return Scaffold(
      // 1.appBar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: lightBlueBackground,
        elevation: 0,

        title: Text("Bought tickets"),
      ),
      // 2.Body
      body: Expanded(
        child: NavBarScaffold(
          backgroundColor: lightBlueBackground,
          currentPageIndex: _selectedIndex,
          bodyContent: TrainTicketList(tickets: NavBarScaffold.trainTickets),
        ),
      ),
    );
  }
}

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFE8F0F6),
      child: Column(
        children: [
          // —— 上面放 MinePage 的页面内容 ——
          SingleChildScrollView(child: _buildMineContent()),

          // —— 下面固定放 NavBarScaffold 提供的导航栏 ——
          Expanded(
            child: NavBarScaffold(
              backgroundColor: Color(0xFFE8F0F6),
              currentPageIndex: _selectedIndex,
              bodyContent: Container(), // 让它不再显示内容
            ),
          ),
        ],
      ),
    );
  }

  // 你原本的 Mine 主体写这里
  Widget _buildMineContent() {
    return Column(
      children: [
        const SizedBox(height: 40),

        // Avatar
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: const Color(0xFFEADDFF),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.account_circle,
            size: 60,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 30),

        _buildField("Username", "user123"),
        _buildField("Password", "*******"),
        _buildField("ID number", "18位数字"),
        _buildField("Phone number", "11位数字"),

        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildField(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- 标题文字：使用 theme.titleMedium ---
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: const Color(0xFF212529)),
          ),

          const SizedBox(height: 5),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),

            // --- 内容文字：使用 bodyMedium ---
            child: Text(value, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
