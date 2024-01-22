class MinHeap {
  List<int> heap = [];

  void insert(int value) {
    heap.add(value);
    _heapifyUp();
  }

  void _heapifyUp() {
    int index = heap.length - 1;
    while (index > 0) {
      int parentIndex = (index - 1) ~/ 2;
      if (heap[index] < heap[parentIndex]) {
        _swap(index, parentIndex);
        index = parentIndex;
      } else {
        break;
      }
    }
  }

  int? extractMin() {
    if (heap.isEmpty) {
      return null;
    }

    if (heap.length == 1) {
      return heap.removeLast();
    }

    int min = heap[0];
    heap[0] = heap.removeLast();
    _heapifyDown();
    return min;
  }

  void _heapifyDown() {
    int index = 0;
    while (true) {
      int leftChildIndex = 2 * index + 1;
      int rightChildIndex = 2 * index + 2;
      int smallest = index;

      if (leftChildIndex < heap.length && heap[leftChildIndex] < heap[smallest]) {
        smallest = leftChildIndex;
      }

      if (rightChildIndex < heap.length && heap[rightChildIndex] < heap[smallest]) {
        smallest = rightChildIndex;
      }

      if (smallest != index) {
        _swap(index, smallest);
        index = smallest;
      } else {
        break;
      }
    }
  }

  void _swap(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }
}

void main() {
  MinHeap minHeap = MinHeap();
  minHeap.insert(1);
  minHeap.insert(5);
  minHeap.insert(15);
  // minHeap.extractMin();

  print(minHeap.heap);
}
