/// 對給定的陣列 ary 進行 Heap Sort
/// - Parameters:
///   - input: 要排序的陣列
func heapSort(input ary: inout [Int]) {
  let end = ary.count  // 陣列的長度
  let start = end / 2  // Heap 的根節點的索引

  // 建立 Max Heap
  for i in stride(from: start, through: 0, by: -1) {
    siftdown(input: &ary, index: i, end: end - 1)
  }

  // 針對未排序的部分進行排序，並透過迭代將 Max Heap 轉換成 Min Heap
  for i in stride(from: end - 1, through: 1, by: -1) {
    // 將 Heap 的根節點與陣列的最後一個元素交換
    ary.swapAt(0, i)

    // 重新調整 Heap 並縮小範圍
    // Heap 內不包含先前已排序好的元素 (最大元素會放到陣列最後面)
    siftdown(input: &ary, index: 0, end: i - 1)
  }

  /// 用來將以 i 為根節點的子樹轉換為 Max Heap 的遞迴函式
  /// - Parameters:
  ///   - input: 要調整的 Heap 陣列
  ///   - index: 要調整的節點的 index
  ///   - end: Heap 陣列的最後一個元素的 index
  func siftdown(input ary: inout [Int], index: Int, end: Int) {
    let left = 2 * index + 1  // 左子節點的 index

    // 如果左子節點超出 Heap 的範圍，則返回
    if left > end {
      return
    }

    var node = left  // 最大的子節點的 index
    let right = 2 * index + 2  // 右子節點的 index

    // 如果右子節點存在且大於左子節點，則將最大節點設為右子節點
    if right <= end && ary[right] > ary[left] {
      node = right
    }

    // 如果父節點的值大於或等於最大節點的值，則不需要交換，返回
    if ary[index] > ary[node] {
      return
    }

    // 否則，交換父節點和最大節點的值
    ary.swapAt(index, node)

    // 遞迴調整子樹
    siftdown(input: &ary, index: node, end: end)
  }
}

var ary: [Int] = [55, 94, 87, 1, 4, 32, 11]
heapSort(input: &ary)
print(ary)