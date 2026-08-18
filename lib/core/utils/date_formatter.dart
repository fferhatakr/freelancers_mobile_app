String? toFormat(DateTime? date) {
  if (date != null) {
    return '${date.day}/${date.month}/${date.year}';
  }
  throw 'Lütfen Tarih Seçiniz';
}
