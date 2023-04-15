enum TeamLocation {
  fullRemote,
  hybrid,
  onSite,
  undefined,
}

extension TeamLocationExtension on TeamLocation {
  String? get getString {
    switch (this) {
      case TeamLocation.fullRemote:
        return "Full Remote";
      case TeamLocation.hybrid:
        return "Ibrido";
      case TeamLocation.onSite:
        return "In sede";
      case TeamLocation.undefined:
        return "Non disponibile";
    }
  }
}
