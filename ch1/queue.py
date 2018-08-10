from node import Node

class Queue:

    def __init__(self, value):
        self.first = Node(value)
        self.last = self.first
        self.length = 1

    def enqueue(self, value):
        new_link = Node(value)
        if self.length == 0:
            self.first = new_link
            self.last = new_link
        elif self.length == 1:
            self.last = new_link
            self.first.link = self.last
        else:
            self.last.link = new_link
            self.last = self.last.link

        self.length += 1
        print(f"{value} added to queue! Queue is of length {self.length}")
    
    def dequeue(self):
        if self.length == 0:
            print("Queue empty! Nothing to do here.")
        else:
            value = self.first.value
            self.first = self.first.link
            self.length -= 1
            print(f"{value} removed from queue! Queue is of length {self.length}")
    
    def length(self):
        return self.length
