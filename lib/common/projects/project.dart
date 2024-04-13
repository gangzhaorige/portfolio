enum ProjectType { solo, group }

class Link {
  final String host;
  final String path;

  const Link({required this.host, required this.path});
  
  String getHost() {
    return host;
  }
  String getPath() {
    return path;
  }
}

class Project {
  final String _projectName;
  final String _projectDescription;
  final String? _imgPath;
  final Link _githubLink;
  final Link _liveUrl;
  final ProjectType _type;
  final List<String> _skills;
  final List<String> _contributors;

  const Project(
    this._projectName,
    this._projectDescription,
    this._type,
    this._skills,
    this._contributors,
    this._imgPath,
    this._githubLink,
    this._liveUrl,
  );

  Link getGithubLink() {
    return _githubLink;
  }

  Link getLiveUrl() {
    return _liveUrl;
  }

  String? imgPath() {
    return _imgPath;
  }

  String getProjectName() {
    return _projectName;
  }

  String getProjectDescription() {
    return _projectDescription;
  }

  ProjectType getProjectType() {
    return _type;
  }

  List<String> getContributors() {
    List<String> res = [];
    for(String contributor in _contributors) {
      res.add(contributor);
    }
    return res;
  }

  List<String> getSkills() {
    List<String> res = [];
    for(String skill in _skills) {
      res.add(skill);
    }
    return res;
  }
}

Project project_1 = const Project(
  'Path Visualizer',
  "Visualize different types of path finding algorithms! Developed a web application using the Flutter framework to visualize various path-finding algorithms, including Breadth-First Search (BFS), Depth-First Search (DFS), Bidirectional BFS, A*, and Dijkstra. This educational tool allows users to interact with and compare different algorithms, enhancing their understanding of graph traversal and search techniques.",
  ProjectType.solo,
  ['Flutter','Dart','A*','Dijkstra','DFS','BFS','Bidirectional BFS'],
  ['Gangzhaorige Li'],
  'assets/images/pathfinder.png',
  Link(host: 'github.com', path: '/gangzhaorige/flutter-algo-visual'),
  Link(host: 'algo-visual.web.app', path: ''),
);

Project project_2 = const Project(
  'Flash Cards',
  'Designed and developed a web application using the Flutter framework, aimed at enhancing the learning and memorization process through digital flashcards. This interactive app offers a modern approach to information retention, making it easier for users to absorb and review knowledge in a structured and accessible manner.',
  ProjectType.group,
  ['Flutter','Dart','Full Stack','Java','SpringBoot','Token Authentication','MySQL', 'SpringBoot JPA'],
  ['Gangzhaorige Li, Tony Jin'],
  'assets/images/comingsoon.png',
  Link(host: 'github.com', path: '/gangzhaorige/flash-cards'),
  Link(host: '', path: ''),
);

