# frozen_string_literal: true

require 'pry'
class Node
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_reader :head, :size, :tail
  def initialize
    @head = Node.new
    @tail = @head
    @size = 0
  end

  def append(value)
    @size += 1
    if @head.value.nil?
      @head.value = value
    else
      @tail.next_node = Node.new(value)
      @tail = @tail.next_node
    end
  end

  def prepend(value)
    @size += 1
    if @head.value.nil?
      @head.value = value
    else
      @head = Node.new(value, @head)
    end
  end

  # size, head and tail don't need read methods as I've made them readable.

  def at(index)
    'Not enough nodes' if index >= @size
    i = 0
    temp = @head
    while i < index
      temp = temp.next_node
      i += 1
    end
    temp.value
  end

  def pop
    @size -= 1
    temp = @head
    temp = temp.next_node until temp.next_node == @tail
    @tail = nil
    @tail = temp
  end

  def contains?(value)
    temp = @head
    i = 0
    while i < @size
      return true if temp.value == value

      temp = temp.next_node
      i += 1
    end
  end

  def find(value)
    temp = @head
    i = 0
    while i < @size
      return i if temp.value == value

      temp = temp.next_node
      i += 1
    end
    nil
  end

  def to_s
    temp = @head
    string = ''
    i = 0
    while i < @size
      string += "( #{temp.value} ) -> "
      temp = temp.next_node
      i += 1
    end
    puts "#{string}nil"
  end

  # extra credit!

  def insert_at(value, index)
    temp = @head
    i = 0
    prepend(value) if index.zero?
    while i < @size
      if index - 1 == i
        newnode = Node.new(value, temp.next_node)
        temp.next_node = newnode
        @size += 1
      end
      temp = temp.next_node
      i += 1
    end
  end

  def remove_at(index)
    @size -= 1
    temp = @head
    i = 0
    @head = temp.next_node if index.zero?
    while i < @size
      temp.next_node = temp.next_node.next_node if index - 1 == i
      temp = temp.next_node
      i += 1
    end
  end
end

howdy = LinkedList.new
howdy.append('balling')
howdy.append(17)
howdy.prepend('Cutting!')
puts howdy.at(1)
howdy.pop
howdy.append(1337)
howdy.prepend(3)
howdy.prepend('neh')
puts howdy.find('balling')
puts howdy.contains? 3
howdy.to_s
howdy.insert_at 'hi', 3
howdy.remove_at 0

howdy.to_s
