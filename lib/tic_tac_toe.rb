class TicTacToe

  def initialize
    (board = Array.new(9, " "))
    @board = board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "--------------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "--------------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

#we want the player to put the token into a specific index slot
  def move (index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == nil || @board[index] == " "
      false
    else true
    end
  end

  def valid_move?(index)
    if position_taken?(index) == false  && index.between?(0, 8)
      true
    else false
    end
  end

  def turn_count
    count = 0
    @board.each do |turn|
      if turn == "X" ||  turn == "O"
        count+=1
      end
    end
    count
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    input = gets.strip
    index = input_to_index(input)
    if position_taken?(index) == false && valid_move?(index) == true
      move(index, current_player)
    else turn
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      if position_taken?(combo[0]) == true && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
        return combo
      end
    end
  end

  def full?
    @board.all? do |square| square != " "
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won? 
  end

  def winner
    if won? == true 
      current_player
    end
  end





WIN_COMBINATIONS = [
[0, 1, 2],
[3, 4, 5],
[6, 7, 8],
[0, 4, 8],
[2, 4, 6],
[0, 3, 6],
[1, 4, 7],
[2, 5, 8]
]



end
