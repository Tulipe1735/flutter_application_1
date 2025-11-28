import 'package:flutter/material.dart';
import 'package:flutter_application_1/projects/widgets/nav_bar_scaffold.dart';
import 'package:flutter_application_1/projects/widgets/ticket_bar.dart';
import 'package:flutter_application_1/projects/widgets/train_ticket_list.dart';
import '../utils/app_theme.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  设置整个页面的大背景颜色
      backgroundColor: const Color(0xFFE8F0F6),
      // 1. 使用 Center Widget 确保整个内容水平居中
      body: Center(
        child: SingleChildScrollView(
          // 2. 使用 Padding 设置左右边距，取代固定的 left: 48
          padding: _hPadding,
          child: Column(
            // 3. 将 Column 的所有子项左对齐 (如 Label 文本)
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // --- Title: Login ---
              const SizedBox(height: 100), // 顶部间距
              // 暂时使用标准 TextStyle
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 36,
                  fontFamily: "Lora",
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 60),

              // --- Username ---
              _buildLabel('username'),
              _buildInputField(hintText: 'user123'),
              const SizedBox(height: 24),

              // --- Password ---
              _buildLabel('Password'),
              _buildInputField(hintText: '*******', obscureText: true),
              const SizedBox(height: 24),

              // --- Login Button ---
              GestureDetector(
                onTap: () {
                  // 导航到 /search 路由
                  Navigator.pushNamed(context, '/search');
                },
                child: Container(
                  width: double.infinity, // 填充宽度
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
              ),
              const SizedBox(height: 60),

              // --- Registration Link and Policy ---
              // 注册链接放在 Row 中，使其居中对齐
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

              // 政策文本
              Opacity(
                opacity: 0.40,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0), // 底部间距
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F0F6),
      body: Center(
        child: SingleChildScrollView(
          padding: _hPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // --- Title: Register ---
              const SizedBox(height: 80),
              // 匹配原 Login 页面的标题样式
              Text(
                'Register',
                style: TextStyle(
                  fontSize: 36,
                  fontFamily: "Lora",
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 60),

              // --- Username ---
              _buildLabel('username'),
              _buildInputField(hintText: 'user123'),
              const SizedBox(height: 24),

              // --- Password ---
              _buildLabel('Password'),
              _buildInputField(hintText: '********', obscureText: true),
              const SizedBox(height: 24),

              // --- Confirm Password (新增字段) ---
              _buildLabel('Confirm Password'),
              _buildInputField(hintText: '********', obscureText: true),
              const SizedBox(height: 24),

              // --- ID Number ---
              _buildLabel('ID number'),
              _buildInputField(
                hintText: '18 digit ID number',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 24),

              // --- Phone Number ---
              _buildLabel('Phone number'),
              _buildInputField(
                hintText: '11 digit phone number',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 60),

              // --- Register Button ---
              GestureDetector(
                onTap: () {
                  // 注册成功后，通常返回登录页或进入主页
                  // 这里假设返回登录页 ('/')
                  Navigator.pop(context);
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

                        fontWeight: FontWeight.w600, // 使用 W600 增强按钮文本
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),

              // --- Login Link (Has any account ?) ---
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
                        // 返回登录页面 ('/')
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

              // 政策文本
              Opacity(
                opacity: 0.40,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    'By registering to account, you are agree to our terms and condition',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF212529),
                      fontSize: 12,

                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40), // 确保底部有足够的滚动空间
            ],
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
    return Column(
      children: [
        Container(
          width: 375,
          height: 812,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 154,
                top: 606,
                child: Container(
                  width: 72,
                  height: 72,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 12,
                        top: 6,
                        child: Container(width: 48, height: 48, child: Stack()),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 140,
                top: 112,
                child: Container(
                  width: 96,
                  height: 96,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: const Color(
                      0xFFEADDFF,
                    ) /* Schemes-Primary-Container */,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center, // 图标居中
                    children: [
                      Icon(
                        Icons.account_circle, // 这里可以换成你想要的 avatar icon
                        size: 48, // 图标大小
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 48,
                top: 272,
                child: Opacity(
                  opacity: 0.40,
                  child: Container(
                    width: 280,
                    padding: const EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFE9ECEF),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: const Color(0xFFEDF7FE),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 8,
                      children: [
                        Text(
                          'user123',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,

                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 48,
                top: 357,
                child: Opacity(
                  opacity: 0.40,
                  child: Container(
                    width: 280,
                    padding: const EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFE9ECEF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 8,
                      children: [
                        Text(
                          '*******',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,

                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 58,
                top: 248,
                child: SizedBox(
                  width: 82,
                  height: 18,
                  child: Opacity(
                    opacity: 0.80,
                    child: Text(
                      'username\n',
                      style: TextStyle(
                        color: const Color(0xFF212529),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 58,
                top: 333,
                child: SizedBox(
                  width: 82,
                  height: 18,
                  child: Opacity(
                    opacity: 0.80,
                    child: Text(
                      'Password',
                      style: TextStyle(
                        color: const Color(0xFF212529),
                        fontSize: 16,

                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 48,
                top: 442,
                child: Opacity(
                  opacity: 0.40,
                  child: Container(
                    width: 280,
                    padding: const EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFE9ECEF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 8,
                      children: [
                        Text(
                          '18位数字',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,

                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 48,
                top: 521,
                child: Opacity(
                  opacity: 0.40,
                  child: Container(
                    width: 280,
                    padding: const EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFE9ECEF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 8,
                      children: [
                        Text(
                          '11位数字',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,

                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 58,
                top: 419,
                child: SizedBox(
                  width: 82,
                  height: 18,
                  child: Opacity(
                    opacity: 0.80,
                    child: Text(
                      'ID number',
                      style: TextStyle(
                        color: const Color(0xFF212529),
                        fontSize: 16,

                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 58,
                top: 497,
                child: SizedBox(
                  width: 126,
                  height: 18,
                  child: Opacity(
                    opacity: 0.80,
                    child: Text(
                      'Phone number',
                      style: TextStyle(
                        color: const Color(0xFF212529),
                        fontSize: 16,

                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: NavBarScaffold(
            backgroundColor: Colors.white,
            currentPageIndex: _selectedIndex,
            bodyContent: Container(),
          ),
        ),
      ],
    );
  }
}
