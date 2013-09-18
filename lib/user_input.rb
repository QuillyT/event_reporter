class UserInput
  attr_accessor :command, :input_filename, :attribute, :criteria, :output_filename

  def format(input)
    if input
      parts = input.split
      @command = parts[0]
    else
      @command = ""
    end
  end
end
