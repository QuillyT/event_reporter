class OutputHandler
  def self.output(message)
    puts message.to_s
  end
  def self.print(message)
    printf "\n"+message.to_s
  end
end
