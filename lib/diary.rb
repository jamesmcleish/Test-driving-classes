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

  def reading_time(wpm) 
    count_words/wpm
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    minutes_array = []
    reading_times = Hash.new
    @diary.each do |x|
      Hash[:x] = x.count_words
    end
    return Hash
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