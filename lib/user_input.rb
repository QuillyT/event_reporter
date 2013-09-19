require 'pry'

class UserInput
  attr_accessor :entry, :command, :attribute, :criteria, :filename, :options

  def initialize
    @options = {:quit     => /^quit/,
                :load     => /^load /,
                :help     => /^help/,
                :count    => /^queue count/,
                :clear    => /^queue clear/,
                :print    => /^queue print/,
                :print_by => /^queue print by /,
                :save     => /^queue save to /,
                :find     => /^find /}
  end
  
  def format(input)
    binding.pry
    @options.each_value do |regex|
      if(input.scan(regex).length==1)
      end
    end
  end
  
  def get_input
    printf "Enter command: "
    @entry = gets.chomp
    format(@entry)
  end
end
