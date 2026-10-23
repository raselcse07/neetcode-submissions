class LRUCache {
    private let capacity: Int
    private var map: [Int: Node] = [:]

    private var head: Node?
    private weak var tail: Node?

    init(_ capacity: Int) {
        precondition(capacity > 0)
        self.capacity = capacity
    }

    func get(_ key: Int) -> Int {
        guard let node = map[key] else {
            return -1
        }
        moveNodeToFront(node) // mark as recent usage
        return node.value
    }

    func put(_ key: Int, _ value: Int) {
        if var node = map[key] {
            node.value = value
            moveNodeToFront(node) // mark as recent usage
            return
        }

        if map.count == capacity, let lru = tail {
            unlink(lru)
            map[lru.key] = nil 
        }

        let node = Node(key, value)
        map[key] = node
        addToFront(node)
    }
}

extension LRUCache {
    private func moveNodeToFront(_ node: Node) {
        guard head !== node else { return } // already in head
        unlink(node)
        addToFront(node)
    }

    func unlink(_ node: Node) {
        if let previous = node.previous {
            previous.next = node.next
        } else {
            head = node.next
        }

        if let next = node.next {
            next.previous = node.previous
        } else {
            tail = node.previous
        }

        node.next = nil
        node.previous = nil
    }

    func addToFront(_ node: Node) {
        node.previous = nil
        node.next = head
        head?.previous = node
        head = node

        if tail == nil {
            tail = node
        }
    }

    class Node {
        let key: Int
        var value: Int

        var next: Node?
        weak var previous: Node?

        init(_ key: Int, _ value: Int) {
            self.key = key
            self.value = value
        }
    }
}
