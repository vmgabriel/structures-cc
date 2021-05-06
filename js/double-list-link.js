class Node {
  constructor(value) {
    this.value = value;
    this.next = null;
    this.prev = null;
  }
}


class DoublyLinkList {
  constructor(value) {
    this.head = new Node(value);
    this.tail = this.head;
    this.length = 1;
  }

  append(value) {
    const data = new Node(value);
    data.prev = this.tail;
    this.tail.next = data;
    this.tail = data;
    this.length += 1;

    return this;
  }

  prepend(value) {
    const node = new Node(value);
    node.next = this.head;
    this.head.prev = node;
    this.head = node;
    this.length += 1;

    return this;
  }

  insert(index, value) {
    if (index > this.length) {
      return this.append(value);
    }
    const node = new Node(value);

    let current = this.getIndex(index - 1);

    node.prev = current;
    node.next = current.next;
    current.next = node;
    current.next.prev = node;

    this.length += 1;
    return this;
  }

  getIndex(index) {
    let current = this.head;
    for (let i = 0; i < index; i++) {
      current = current.next;
    }

    return current;
  }
}


let dlist = new DoublyLinkList(1);
