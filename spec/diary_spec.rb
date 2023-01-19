require 'diary'

describe 'Diary Integration' do
  it 'prints title as a string' do
    first = DiaryEntry.new('today','I ran')
    expect(first.title).to eq 'today'
  end
  it 'prints the contents as a string' do
    first = DiaryEntry.new('today','I ran')
    expect(first.contents).to eq 'I ran'
  end
  it 'returns the number' do
    first = DiaryEntry.new('today','I ran')
  end
  it 'returns the number of words in the contents' do
    today = DiaryEntry.new('today','I ran')
    expect(today.count_words).to eq 2
  end
  it 'returns the reading time at the given words per minute' do
    today = DiaryEntry.new('today','I ran')
    expect(today.reading_time(2)).to eq 1
  end
  it 'given a number of minutes and a wpm, what words would be read from the diary' do
    today = DiaryEntry.new('today','I ran')
    expect(today.reading_chunk(1,1)).to eq 'I'
  end
  it 'when running the word_chunk method twice it returns the words not yet read' do
    today = DiaryEntry.new('today','I ran')
    today.reading_chunk(1,1)
    expect(today.reading_chunk(1,1)).to eq 'ran'
  end
  it 'when running the word_chunk a third time it returns to the start of the contents' do
    today = DiaryEntry.new('today','I ran')
    expect(today.reading_chunk(3,1)).to eq 'I ran I'
  end
  it 'adds a diary entry to the diary and then returns nothing' do
    today = DiaryEntry.new('today','I ran')
    diary = Diary.new
    expect(diary.add(today)).to eq nil
  end
  it 'returns the list of all diary entries' do
    today = DiaryEntry.new('today','I ran')
    yesterday = DiaryEntry.new('yesterday','I walked')
    diary = Diary.new
    diary.add(yesterday)
    diary.add(today)
    expect(diary.all).to eq [yesterday, today]
  end
  it 'returns the list of all diary entries' do
    today = DiaryEntry.new('today','I ran')
    yesterday = DiaryEntry.new('yesterday','I walked')
    diary = Diary.new
    diary.add(yesterday)
    diary.add(today)
    expect(diary.count_words).to eq 6
  end
end