from node import Node

class Stack:

    def __init__(self, value):
        self.latest = Node(value)
        self.length = 1

    def push(self, value):
        """ Method to insert list at the end
        """
        new_link = Node(value)
        if self.length > 0:
            new_link.link = self.latest
            self.latest = new_link
        else:
            self.latest = Node(value)

        self.length += 1
        print(f"{value} inserted. Stack is now {self.length} links long.")

    def pop(self):
        """ Method to get value at end of list
            and replace with previous node
        """
        if self.length == 0:
            print("Link is empty. Nothing to do.")
        else:
            dummy = self.latest
            self.latest = dummy.link
            self.length -= 1
            print(f"{dummy.value} popped. Stack is now {self.length} links long.")
    
    def length(self):
        """ Returns the length of the stack """
        return self.length
        