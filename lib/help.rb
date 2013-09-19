class Help
  attr_reader :messages
  def initialize
    @messages = {
      :load=>"load [filename]\
              \n\nThis command loads a csv file into the program.",
      :help=>"help [command]\
              \n\nThis command displays information for the following commands:\
              \n\n\tload\
              \n\tqueue count\
              \n\tqueue clear\
              \n\tqueue print\
              \n\tqueue print by [attribute]\
              \n\tqueue save to [filename]\
              \n\tfind [attribute] [criteria]\
              \n\nType \"help\" followed by one of the commands above for more\
              information.",
      :queue_count=>"queue count\
              \n\nThis command will display the number of results in the \
result queue from the previous search.",
      :queue_clear=>"queue clear\
              \n\nThis command clears the current result queue.",
      :queue_print=>"queue print\
              \n\nThis command prints the contents of the current result \
queue.",
      :queue_print_by=>"queue print by [attribute]\
              \n\nThis command prints the contents of the current result \
queue sorted by the entered attribute.",
      :queue_save_to=>"queue save to [filename.csv]\
              \n\nThis command saves the contents of the current result \
queue to a file with entered filename.",
      :find=>"find [attribute] [criteria]\
              \n\nThis command searched the loaded file for entries with \
matching criteria and stores them into the result queue. \
The previous search will be cleared and replaced with the \
new search.",
      :nope=>"The command you entered does not exist."}
  end
  def get_message(input)
    if input
      return @messages[input] if @messages.has_key? input
      return @messages[:nope] if !@messages.has_key? input
    else 
      return @message[:nope]
    end
  end
end
