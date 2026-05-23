import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IT Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
    );
  }

  Future<void> openLink(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text('My Portfolio'),
        centerTitle: true,
        actions: [
          TextButton(onPressed: () => scrollTo(aboutKey), child: const Text('About')),
          TextButton(onPressed: () => scrollTo(skillsKey), child: const Text('Skills')),
          TextButton(onPressed: () => scrollTo(projectsKey), child: const Text('Projects')),
          TextButton(onPressed: () => scrollTo(contactKey), child: const Text('Contact')),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(
              onProjectsTap: () => scrollTo(projectsKey),
              onContactTap: () => scrollTo(contactKey),
            ),
            AboutSection(key: aboutKey),
            SkillsSection(key: skillsKey),
            ProjectsSection(
              key: projectsKey,
              openLink: openLink,
            ),
            ContactSection(
              key: contactKey,
              openLink: openLink,
            ),
          ],
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  const HeroSection({
    super.key,
    required this.onProjectsTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 90, horizontal: 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0F172A), Color(0xFF2563EB)],
        ),
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 55,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 70, color: Color(0xFF2563EB)),
          ),
          const SizedBox(height: 24),
          const Text(
            'Hi, I am Regomoditswe Motsalane',
            style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          const Text(
            'Information Technology Student | Software Developer | Data Enthusiast',
            style: TextStyle(fontSize: 18, color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 28),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ElevatedButton(
                onPressed: onProjectsTap,
                child: const Text('View My Projects'),
              ),
              OutlinedButton(
                onPressed: onContactTap,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white),
                ),
                child: const Text('Contact Me'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return sectionContainer(
      title: 'About Me',
      child: const Text(
        'I am an Information Technology student passionate about software development, databases, artificial intelligence, and building useful digital solutions.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 17, height: 1.6),
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return sectionContainer(
      title: 'Skills & Technologies',
      child: Column(
        children: [
          _skillCategory(
            'Technical Skills',
            [
              'Flutter',
              'Dart',
              'HTML',
              'CSS',
              'JavaScript',
              'C#',
              'ASP.NET MVC',
              'SQL',
              'Firebase',
              'UI/UX Design',
              'Artificial Intelligence',
              'Data Analysis',
              'Database Design',
              'Responsive Web Design',
            ],
          ),
          const SizedBox(height: 30),
          _skillCategory(
            'Languages & Tools',
            [
              'VS Code',
              'Visual Studio',
              'Git',
              'GitHub',
              'Firebase',
              'SQL Server',
              'MySQL',
              'SQLite'
              'Microsoft Office',
              'Unity'
            ],
          ),
          const SizedBox(height: 30),
          _skillCategory(
            'Professional Skills',
            [
              'Problem Solving',
              'Critical Thinking',
              'Communication',
              'Teamwork',
              'Leadership',
              'Time Management',
              'Adaptability',
              'Attention to Detail',
              'Project Management',
              'Analytical Thinking',
              'Continuous Learning',
              'Presentation Skills',
              'Research Skills',
            ],
          ),
        ],
      ),
    );
  }

  Widget _skillCategory(String title, List<String> skills) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2563EB),
          ),
        ),
        const SizedBox(height: 15),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: skills.map((skill) {
            return Chip(
              label: Text(skill),
              backgroundColor: const Color(0xFFE8F0FF),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class ProjectsSection extends StatelessWidget {
  final Future<void> Function(String url) openLink;

  const ProjectsSection({super.key, required this.openLink});

  @override
  Widget build(BuildContext context) {
    return sectionContainer(
      title: 'Projects',
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        alignment: WrapAlignment.center,
        children: [
          ProjectCard(
            title: 'Smart Student Email Generator',
            description: 'AI-powered tool for generating professional student emails.',
            icon: Icons.email,
            onGitHubTap: () => openLink('https://github.com/regggomoditswe/smart-study-buddy'),
            onDemoTap: () => openLink('https://student-genie-ai.lovable.app'),
          ),
          ProjectCard(
            title: 'Sentiment Analysis App',
            description: 'Application that analyses text and identifies sentiment.',
            icon: Icons.analytics,
            onGitHubTap: () => openLink('https://github.com/regggomoditswe/voice-of-feedback'),
            onDemoTap: () => openLink('https://voice-of-feedback.lovable.app'),
          ),
          ProjectCard(
            title: 'IT Portfolio Website',
            description: 'Personal portfolio built using Flutter and Dart.',
            icon: Icons.web,
            onGitHubTap: () => openLink('https://github.com/regggomoditswe/my-it-portfolio'),
            onDemoTap: () => openLink('https://regomoditswe-portfolio.web.app'),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onGitHubTap;
  final VoidCallback onDemoTap;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.onGitHubTap,
    required this.onDemoTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 12, offset: Offset(0, 6)),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 50, color: const Color(0xFF2563EB)),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          const SizedBox(height: 12),
          Text(description, textAlign: TextAlign.center),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: onGitHubTap,
                child: const Text('GitHub'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: onDemoTap,
                child: const Text('Live Demo'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  final Future<void> Function(String url) openLink;

  const ContactSection({super.key, required this.openLink});

  @override
  Widget build(BuildContext context) {
    return sectionContainer(
      title: 'Contact Me',
      child: Column(
        children: [
         const Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Icon(Icons.email, color: Color(0xFF2563EB)),
    SizedBox(width: 8),
    Text(
      'galaletsangmotsalane@gmail.com',
      style: TextStyle(fontSize: 16),
    ),
  ],
),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () => openLink('https://github.com/regggomoditswe'),
            icon: const Icon(Icons.code),
            label: const Text('GitHub Profile'),
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () => openLink('https://www.linkedin.com/in/galaletsang-motsalane-23496a186/'),
            icon: const Icon(Icons.business),
            label: const Text('LinkedIn Profile'),
          ),
        ],
      ),
    );
  }
}

Widget sectionContainer({required String title, required Widget child}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
    child: Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
        ),
        const SizedBox(height: 24),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: child,
        ),
      ],
    ),
  );
}