require 'pry'
class TicTacToe

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    WIN_COMBINATIONS = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
    ]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input.to_i-1
    end

    def move(index, token)
        @board[index] = token
    end

    def position_taken?(index)
        # if @board[index] == " "
        #     false
        # else
        #     true
        # end
        @board[index] != " "
    end

    def valid_move?(index)
        !position_taken?(index) && index.between?(0,8)
    end

    def turn_count
        @board.count{ | turn | turn != " " }
    end

    def current_player
        # if turn_count.even?
        #     "X"
        # else
        #     "O"
        # end
        turn_count.even? ? "X" : "O"
    end

    def turn
        puts "Please select a square (1-9):"
        #get user input
        input = gets.strip
        # since all user input comes in as a string from terminal, convert to integer and subtract 1
        index = input_to_index(input)
        # Check to see if it's a valid move
        # if so, let them make a move
        if valid_move?(index)
            token = current_player
            move(index, token)
        # if not, ask them to choose again
        else
            puts "Please select a valid answer (1-9)"
            turn
        end
        display_board
    end

    def won?
        # check to see if the first position in the winning combination is taken
        # then check to see if the first position matches the second, and if the second position matches the third
        # return the combination if all conditions are met
        WIN_COMBINATIONS.any? do | winning |
            if  position_taken?(winning[0]) && @board[winning[0]] == @board[winning[1]] && @board[winning[1]] == @board[winning[2]]
                binding.pry
                return winnning
            end
        end
    end

end



#Tic Tac Toe - ARRAY
 #  0 |  1  |  2 
 #  3 |  4  |  5
 #  6 |  7  |  8


 # User Tic Tac Toe
 #  1 |  2  |  3 
 #  4 |  5  |  6
 #  7 |  8  |  9