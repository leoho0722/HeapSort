package main

import "fmt"

// HeapSort 是一個執行 Heap Sort 演算法的函式，它對給定的整數切片 ary 進行排序
//
// Parameters:
//
//	ary: 要排序的陣列
func HeapSort(ary []int) {
	end := len(ary)  // 陣列的長度
	start := end / 2 // Heap 的根節點的索引

	// 建立 Max Heap
	for i := start; i > -1; i-- {
		siftdown(ary, i, end-1)
	}

	// 針對未排序的部分進行排序，並透過迭代將 Max Heap 轉換成 Min Heap
	for i := end - 1; i > 0; i-- {
		// 將 Heap 的根節點與陣列的最後一個元素交換
		ary[i], ary[0] = ary[0], ary[i]

		// 重新調整 Heap 並縮小範圍
		// Heap 內不包含先前已排序好的元素 (最大元素會放到陣列最後面)
		siftdown(ary, 0, i-1)
	}
}

// siftdown 是一個用來將以 i 為根節點的子樹轉換為 Max Heap 的遞迴函式
//
// Parameters:
//
//	ary: 要調整的 Heap 陣列
//	index: 要調整的節點的 index
//	end: Heap 陣列的最後一個元素的 index
func siftdown(ary []int, index, end int) {
	left := 2*index + 1 // 左子節點的 index

	// 如果左子節點超出 Heap 的範圍，則返回
	if left > end {
		return
	}

	node := left         // 最大的子節點的 index
	right := 2*index + 2 // 右子節點的 index

	// 如果右子節點存在且大於左子節點，則將最大節點設為右子節點
	if right <= end && ary[right] > ary[left] {
		node = right
	}

	// 如果父節點的值大於或等於最大節點的值，則不需要交換，返回
	if ary[index] > ary[node] {
		return
	}

	// 否則，交換父節點和最大節點的值
	ary[node], ary[index] = ary[index], ary[node]

	// 遞迴調整子樹
	siftdown(ary, node, end)
}

func main() {
	ary := []int{55, 94, 87, 1, 4, 32, 11}
	HeapSort(ary)
	fmt.Println(ary)
}
