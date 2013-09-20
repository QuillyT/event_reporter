class EventReporterMessage
  def self.prompt
    %(Enter Command: )
  end
  def self.quit
    %(Exiting Event Reporter. Goodbye!)
  end
  def self.invalid
    %(Invalid command.)
  end
  def self.loaded
    %(Successfully loaded values from file.)
  end
  def self.load_error
    %(Error loading file.)
  end
  def self.bad_attribute
    %(Attribute for find is invalid. Type help for info.)
  end
  def self.criteria_empty
    %(Critera for find is invalid. Type help for info.)
  end
  def self.invalid_filename
    %(Filename is invalid)
  end
  def self.invalid_file_exists
    %(Filename already exists)
  end
  def self.count
    %(Results in queue: )
  end
  def self.clear
    %(Queue cleared.)
  end
  def self.find
    %(Searched values have been stored in the queue.)
  end
end
