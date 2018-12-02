# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,4,8], # Diagonal1
  [6,4,2], # Diagonal2
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8]  # Right column
]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input) #defines a method converting the number entered to the board index
  user_input.to_i - 1
end

def move(board,input_to_index,charactor)
  board[input_to_index] = charactor
end

def position_taken? (board,index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else
    true
  end
end

def valid_move?(board,index)
  if position_taken?(board,index) == false && index.between?(0,8)
      true
  else
      false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.chomp
  index = input_to_index(user_input)
  charactor = "X"
    if valid_move?(board, index) == true
      move(board, index, charactor)
      display_board(board)
    else
      turn(board)
    end
end

def turn_count(board)
  number = 0
  board.each do |position|  #itterating thru board in a loop
    if position == "X" || position == "O"
    number += 1
    end
  end
  return number
end
