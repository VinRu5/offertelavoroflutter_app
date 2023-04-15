enum Relationship {
  onlyWithJobCommissioners,
  otherProfessionist,
  undefined,
}

extension RelationshipExtension on Relationship {
  String? get getString {
    switch (this) {
      case Relationship.onlyWithJobCommissioners:
        return "Solo con chi commissiona il lavoro";
      case Relationship.otherProfessionist:
        return "Con altri professionisti";
      case Relationship.undefined:
        return "Non disponibile";
    }
  }
}
