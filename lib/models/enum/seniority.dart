enum Seniority {
  junior,
  mid,
  senior,
  undefined,
}

extension SeniorityExtension on Seniority {
  String? get getString {
    switch (this) {
      case Seniority.junior:
        return "Junior";
      case Seniority.mid:
        return "Mid";
      case Seniority.senior:
        return "Senior";
      case Seniority.undefined:
        return "Non disponibile";
    }
  }
}
