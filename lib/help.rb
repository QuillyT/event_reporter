class Help
  def self.message(command)
    adjustment = command.to_s.split.join("_")
    message_list.find_index(adjustment) ? send(adjustment) : send(:nope)
  end

  def self.message_list
    ["load","default","queue_count","queue_clear","queue_print",
      "queue_print_by","queue_save_to","find"]
  end

  def self.load
    %(\nload [filename]

This command loads a csv file into the program.)
  end

  def self.default
    %(\nhelp [command]

This command displays information for the following commands:

    load [filename]
    queue count
    queue clear
    queue print
    queue print by [attribute]
    queue save to [filename]
    find [attribute] [criteria]

Type \"help\" followed by one of the commands above for more information.)
  end

  def self.queue_count
    %(\nqueue count

This command will display the number of results in the result queue from the
previous search.)
  end

  def self.queue_clear
    %(\nqueue clear

This command clears the current result queue.)
  end

  def self.queue_print
    %(\nqueue print

This command prints the contents of the current result queue.)
  end

  def self.queue_print_by
    %(\nqueue print by [attribute]

This command prints the contents of the current result queue sorted by the
entered attribute.)
  end

  def self.queue_save_to
    %(\nqueue save to [filename.csv]

This command saves the contents of the current result queue to a file with
the entered filename.)
  end

  def self.find
    %(\nfind [attribute] [criteria]

This command searches the loaded values for entries with matching criteria and
stores them into the result queue. The previous search will be cleared and
replaced with the new search. Acceptable attributes include the following:

     first_name
     last_name
     email
     phone_number
     zipcode
     city
     state
     address)
  end

  def self.nope
    %(\nThe command you entered does not exist.)
  end
end
