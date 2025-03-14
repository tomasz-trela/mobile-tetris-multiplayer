extension DeepCopyNestedList<T> on List<T> {
  List<T> deepCopy() {
    return map<T>((element) {
      if (element is List<T>) {
        return element.deepCopy() as T;
      } else {
        return element; 
      }
    }).toList();
  }
}