// ignore_for_file: public_member_api_docs, sort_constructors_first
class VmState<T> {
  T? data;
  bool isLoading;
  bool hasError;
  String? errorMsg;

  VmState(
      {this.data, this.hasError = false, this.isLoading = true, this.errorMsg});

  factory VmState.complete({required T data}) {
    return VmState(isLoading: false, data: data);
  }
  factory VmState.empty() {
    return VmState(isLoading: false);
  }
  factory VmState.error({String? errorMsg}) {
    return VmState(isLoading: false, hasError: true, errorMsg: errorMsg);
  }
  factory VmState.loading() {
    return VmState(isLoading: true);
  }

  @override
  bool operator ==(covariant VmState<T> other) {
    if (identical(this, other)) return true;

    return other.data == data &&
        other.isLoading == isLoading &&
        other.hasError == hasError &&
        other.errorMsg == errorMsg;
  }

  @override
  int get hashCode {
    return data.hashCode ^
        isLoading.hashCode ^
        hasError.hashCode ^
        errorMsg.hashCode;
  }
}
