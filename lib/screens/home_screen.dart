import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/single_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPage = 0;
  late final _pageController = PageController(initialPage: _selectedPage);
  late final Timer? _timer;
  List<SinglePage> myPages = const [
    SinglePage(
      title: 'NT EXPERIENCE',
      subtitle: 'COMENZÁ A VIVIR TU',
      image: 'assets/images/slide1.png',
      isFirstSlide: true,
    ),
    SinglePage(
      title: 'CONECTA',
      subtitle:
          'Conecta tus neuro sensores a la aplicación  Neural Trainer y comienza a aumentar tu rendimiento cognitivo.',
      image: 'assets/images/slide2.png',
    ),
    SinglePage(
      title: 'ENTRENA',
      subtitle:
          'Selecciona una actividad creada por el equipo de Neural Trainer o crea tu propio entrenamiento específico.',
      image: 'assets/images/slide3.png',
    ),
    SinglePage(
      title: 'ANALIZA',
      subtitle:
          'Monitorea el desempeño de tus atletas, registra sus resultados y compártelos en tiempo real.',
      image: 'assets/images/slide4.png',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (time) async {
      final nexPage = _pageController.page == myPages.length - 1
          ? 0
          : (_pageController.page?.toInt() ?? 0) + 1;
      await _pageController.animateToPage(
        nexPage,
        duration: const Duration(seconds: 1),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    void _pageChanged(int currentPage) {
      _selectedPage = currentPage;
      setState(() {});
    }

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
              itemBuilder: (context, index) => myPages[index],
              controller: _pageController,
              itemCount: myPages.length,
              onPageChanged: _pageChanged),
          Positioned(
            top: screenHeight * 0.85,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  myPages.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: InkWell(
                      child: Container(
                          width: 8.0,
                          height: 8.0,
                          decoration: BoxDecoration(
                            color:  index == _selectedPage ? Colors.transparent : const Color(0xff686968),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(2.0)),
                            border: Border.all(
                                color: index == _selectedPage
                                    ? const Color(0xff16F581)
                                    : const Color(0xff686968),
                                width: 0.8,
                                style: BorderStyle.solid),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 24,
            child: Container(
              width: screenWidth * 0.88,
              height: 54.0,
              decoration: const BoxDecoration(
                color: Color(0xff16F581),
                borderRadius: BorderRadius.all(Radius.circular(27.0)),
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'INICIAR SESIÓN',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
