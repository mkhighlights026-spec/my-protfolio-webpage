import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moiz Khan | Flutter Developer',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
          brightness: Brightness.dark,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 18),
        ),
      ),
      home: const HomeWeb(),
    );
  }
}

class HomeWeb extends StatefulWidget {
  const HomeWeb({super.key});

  @override
  State<HomeWeb> createState() => _HomeWebState();
}

class _HomeWebState extends State<HomeWeb> {
  final ScrollController _scrollController = ScrollController();

  void scrollTo(double position) {
    _scrollController.animateTo(position,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF020617),
        title: const Text('Moiz Khan'),
        actions: [
          TextButton(
              onPressed: () => scrollTo(0),
              child: const Text('Home', style: TextStyle(color: Colors.white))),
          TextButton(
              onPressed: () => scrollTo(400),
              child: const Text('Education',
                  style: TextStyle(color: Colors.orangeAccent))),
          TextButton(
              onPressed: () => scrollTo(700),
              child: const Text('Languages',
                  style: TextStyle(color: Colors.greenAccent))),
          TextButton(
              onPressed: () => scrollTo(1000),
              child: const Text('Projects',
                  style: TextStyle(color: Colors.blueAccent))),
          TextButton(
              onPressed: () => scrollTo(1800),
              child: const Text('Contact',
                  style: TextStyle(color: Colors.purpleAccent))),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: const [
            HeroSection(),
            EducationSection(),
            LanguagesSection(),
            ProjectsSection(),
            ContactSection(),
          ],
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(
                'assets/projects/mk.jpg'), // replace with your local profile pic
          ),
          const SizedBox(height: 20),
          const Text('Moiz Khan',
              style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const Text('Flutter Developer',
              style: TextStyle(fontSize: 22, color: Colors.blueAccent)),
          const SizedBox(height: 20),
          const SizedBox(
            width: 720,
            child: Text(
              'I build professional, scalable, and real-time mobile & web applications using Flutter.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Education',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.orangeAccent)),
          SizedBox(height: 20),
          Text('• BS Software Engineering, CECOS University, 2023-2027'),
          Text('• FSc, Muslim Educational Complex College Peshawar, 2021-2022'),
          Text('• Matriculation, PakTurk Maarif, 2019-2020'),
        ],
      ),
    );
  }
}

class LanguagesSection extends StatelessWidget {
  const LanguagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Programming Languages',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.greenAccent)),
          SizedBox(height: 20),
          Text('• C/C++'),
          Text('• Python'),
          Text('• Dart (Flutter)'),
        ],
      ),
    );
  }
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Projects',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent)),
          const SizedBox(height: 30),
          ProjectDisplay(
            title: 'Flutter Portfolio Web/App',
            description:
                'A professional portfolio built with Flutter for mobile and web.',
            screenshots: [
              'assets/projects/prot1.jpg',
              'assets/projects/prot2.jpg',
              'assets/projects/prot3.jpg',
            ],
          ),
          const SizedBox(height: 30),
          ProjectDisplay(
            title: 'Real-Time Chat Application',
            description:
                'One-to-one real-time chat app with clean UI and live messaging.',
            screenshots: [
              'assets/projects/chat1.jpg',
              'assets/projects/chat2.jpg',
              'assets/projects/chat3.jpg',
              'assets/projects/chat4.jpg',
              'assets/projects/chat1.jpg',
              'assets/projects/chat2.jpg',
              'assets/projects/chat3.jpg',
              'assets/projects/chat4.jpg',
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectDisplay extends StatefulWidget {
  final String title;
  final String description;
  final List<String> screenshots;

  const ProjectDisplay({
    super.key,
    required this.title,
    required this.description,
    required this.screenshots,
  });

  @override
  State<ProjectDisplay> createState() => _ProjectDisplayState();
}

class _ProjectDisplayState extends State<ProjectDisplay> {
  late final PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.4);
  }

  void next() {
    if (currentIndex < widget.screenshots.length - 1) {
      currentIndex++;
      _pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void previous() {
    if (currentIndex > 0) {
      currentIndex--;
      _pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.lightBlueAccent,
          ),
        ),
        const SizedBox(height: 8),
        Text(widget.description, style: const TextStyle(color: Colors.white70)),
        const SizedBox(height: 16),
        Row(
          children: [
            // LEFT BUTTON
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: previous,
            ),

            // SCREENSHOTS
            Expanded(
              child: SizedBox(
                height: 320,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.screenshots.length,
                  onPageChanged: (index) => currentIndex = index,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          widget.screenshots[index],
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // RIGHT BUTTON
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              color: Colors.white,
              onPressed: next,
            ),
          ],
        ),
      ],
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  void launchLink(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const Text('Contact',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.purpleAccent)),
          const SizedBox(height: 20),
          Wrap(
            spacing: 20,
            children: [
              ActionChip(
                  label: const Text('LinkedIn'),
                  backgroundColor: Colors.blue,
                  onPressed: () => launchLink(
                      'https://www.linkedin.com/in/moiz-khan-798a7b322/')),
              ActionChip(
                  label: const Text('WhatsApp'),
                  backgroundColor: Colors.green,
                  onPressed: () => launchLink('https://wa.me/923184850303')),
              ActionChip(
                  label: const Text('Email'),
                  backgroundColor: Colors.orange,
                  onPressed: () =>
                      launchLink('mailto:mkhighlights026@email.com')),
            ],
          ),
        ],
      ),
    );
  }
}
