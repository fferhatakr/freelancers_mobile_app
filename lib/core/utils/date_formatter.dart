String? toFormat(DateTime? date) {
  try {
    if (date != null) {
      return '${date.day}/${date.month}/${date.year}';
    }
  } catch (e) {
    print(e);
  }
}
