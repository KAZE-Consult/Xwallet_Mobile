enum BuildFlavor { dev, prod }

enum IdentificationType { nin, passport, driversLicense }

enum ConvoInputType { select, text, currency, video, file, number }

enum Source { camera, gallery }

enum PremFreq {
  M,
  Q,
  S,
  A;

  @override
  String toString() {
    switch (name) {
      case 'M':
        return 'Monthly';
      case 'Q':
        return 'Quarterly';
      case 'S':
        return 'Semi-Annually';
      case 'A':
        return 'Annually';
      default:
        return '';
    }
  }
}
