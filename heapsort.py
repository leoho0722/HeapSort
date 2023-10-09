def heapsort(ary):
    """
    heapsort 是一個對給定的陣列 ary 進行 Heap Sort

    Parameters:
        ary: 要進行 Heap Sort 的陣列
    """

    def siftdown(start, end):
        """
        siftdown 是一個用來將以 i 為根節點的子樹轉換為 Max Heap 的遞迴函式

        Parameters:
            start: 要調整的節點的 index
            end: Heap 陣列的最後一個元素的 index
        """

        root = start

        while True:
            child = root * 2 + 1
            if child > end:
                break
            if child + 1 <= end and ary[child] < ary[child + 1]:
                child += 1
            if ary[root] < ary[child]:
                ary[root], ary[child] = ary[child], ary[root]
                root = child
            else:
                break

    # 建立 Max Heap
    for start in range((len(ary) - 2)):
        siftdown(start, len(ary) - 1)

    # Heap Sort
    for end in range(len(ary) - 1, 0, -1):
        ary[0], ary[end] = ary[end], ary[0]
        siftdown(0, end - 1)

    return ary


if __name__ == "__main__":
    ary = [55, 94, 87, 1, 4, 32, 11]
    heapsort(ary)
    print(ary)
