class TowersOfHanoi

  attr_reader :towers

  def initialize(towers = nil)
    @towers = towers || [ [3,2,1], [], [] ]
  end

  def play_game
    welcome_message
    until game_over?
      display
      user_input
    end
    game_over_message
  end

  def user_input
    begin
      display
      puts "Move from which tower?"
      from_tower = gets.chomp.to_i
      puts "Move to which tower?"
      to_tower = gets.chomp.to_i
    rescue
      input_errors(from, to)
    retry
      user_input
    end

    valid_move?(from_tower, to_tower) ?
      move_disc(from_tower, to_tower) : user_input
  end

  def input_errors(from, to)
    raise ArgumentError unless from.is_a?(Fixnum) &&
      to.is_a?(Fixnum)
    raise ArgumentError unless from.between?(1,3) &&
      to.between?(1,3)
    raise "Can't take from an empty tower" if @towers[from - 1].empty?
  end

  def valid_move?(from, to)
    return false if @towers[from - 1].empty? && @towers[to - 1].empty?
    return true if @towers[to - 1].empty? && !@towers[from-1].empty?

    disc = @towers[from - 1].last
    return true if !disc.nil? && (@towers[to - 1].last > disc)
  end

  def move_disc(from, to)
    @towers[to - 1] << @towers[from - 1].pop
  end

  def display
    system('clear')
    @towers.each_with_index do |tower, i|
      puts "#{i + 1}: #{tower}"
    end
  end

  def game_over?
    if @towers[0].empty?
      return true if @towers[1].length == 3 || @towers[2].length == 3
    end
    false
  end

  def welcome_message
    system('clear')
    puts "Welcome to Towers of Hanoi!"
    sleep(1)
  end

  def game_over_message
    system('clear')
    puts "You win, thanks for playing!"
    sleep(1)
    puts "Play again? \n=> y or n"
    input = gets.chomp

    input == 'y' ? restart_game : end_game
  end

  def restart_game
    sleep(0.5)
    @towers = Array.new(3) { [] }
    @towers[0] = [3, 2, 1]
    play_game
  end

  def end_game
    system('clear')
    Process.exit(0)
  end

end

if __FILE__ == $PROGRAM_NAME
  game = TowersOfHanoi.new
  game.play_game
end
