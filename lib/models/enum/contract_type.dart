enum ContractType {
  fullTime,
  partTime,
  undefined,
}

extension ContractTypeExtension on ContractType {
  String? get getString {
    switch (this) {
      case ContractType.fullTime:
        return "Full time";
      case ContractType.partTime:
        return "Part time";
      case ContractType.undefined:
        return "Non disponibile";
    }
  }
}
