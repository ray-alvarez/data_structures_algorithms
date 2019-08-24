# /projects/data_structures_algorithms
#
# function knight_moves shows the simplest
# possible way to get from one square to another
# by outputting all squares the knight will stop
# on along the way.

class Node
    attr_accessor :value, :children, :parent
    def initialize(data)
        @value = data
        @children = []
        @parent = nil
    end
end
class Tree
    attr_accessor :root

    def initialize(data)
        @root = Node.new(data)
    end
end

class Chess
    attr_accessor :board

    def initialize
        @board = []
        8.times do 
            row = []
            8.times {row.push("-")}
            @board.push(row)
        end
    end
end

def knight_moves(start, goal)
    game = Chess.new
    tree = Tree.new(start)
    current = tree.root 
    queue = [current]
    visited = []
    until current.value == goal
        moves = moves(current.value)
        children = []
        moves.each do |move|
            next if visited.include? move
            child = Node.new(move)
            children.push(child)
            child.parent = current
            queue.push(child)
            visited.push(move)
        end
        current = queue.shift
    end
    moves = list_moves(current)
    puts ""
    print_moves(moves)
    puts ""
end

def moves(start)
    moves = []
    xmovements = [2,2,-2,-2,1,1,-1,-1]
    ymovements = [1,-1,1,-1,2,-2,2,-2]
    8.times do |i|
        xnew = start[0]+xmovements[i]
        ynew = start[1]+ymovements[i]
        if xnew >= 0 && xnew <= 7 && ynew >= 0 && ynew <= 7 && @board != "M"
            moves.push([xnew,ynew])
        end
    end
    moves
end

def list_moves(node) 
    moves = []
    current = node
    until current.nil?
        moves.unshift(current.value)
        current = current.parent
    end
    moves
end

def print_moves(moves)
    number_moves = moves.length - 1
    puts "You made it #{number_moves} moves!"
    moves.each.each_with_index do |move, idx|
        printf "#{move}"
        printf " => " unless idx == number_moves
    end
    printf("\n")
end

knight_moves([0,0],[7,7])