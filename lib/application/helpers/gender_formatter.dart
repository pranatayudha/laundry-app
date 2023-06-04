class GenderFormatter {
  static String forInput(String gender) {
    switch (gender) {
      case 'Laki-laki':
        return 'L';
      case 'Perempuan':
        return 'P';
      default:
        return 'L';
    }
  }

  static String forOutput(String gender) {
    switch (gender) {
      case 'L':
        return 'Laki-laki';
      case 'P':
        return 'Perempuan';
      default:
        return 'Laki-laki';
    }
  }
}
