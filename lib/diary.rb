# File: lib/diary.rb

class Diary

  def initialize
    @diary = []
  end

  def add(entry) 
    @diary << entry
    return nil
  end

  def all
    return @diary
  end

  def count_words
    total_words = 0
    @diary.each do |entry|
      total_words += entry.count_words
    end
    return total_words
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # if the user were to read all entries in the diary.
  end

  def find_best_entry_for_reading_time(wpm, minutes)
        # `wpm` is an integer representing the number of words the user can read
        # per minute.
        # `minutes` is an integer representing the number of minutes the user
        # has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.
  end
end
# File: lib/diary_entry.rb
class DiaryEntry

  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @i = 0
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def count_words
    return @contents.split(' ').length
  end

  def reading_time(wpm)
    return ((@contents.split.length)/wpm).to_f
  end


  def reading_chunk(wpm, minutes)
  array = []
  (wpm*minutes).times do
    array << (@contents.split)[@i]
    @i += 1
    if @i >= @contents.split.length
      @i = 0
    end
  end
  return array.join(' ')
  end

end