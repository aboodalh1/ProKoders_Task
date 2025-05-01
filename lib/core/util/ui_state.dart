class UiState<T> {
  final bool isLoading;
  final String? error;
  final T? data;

  UiState({this.isLoading = false, this.error, this.data});

  UiState<T> copyWith({bool? isLoading, String? error, T? data}) {
    return UiState<T>(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      data: data ?? this.data,
    );
  }
}
