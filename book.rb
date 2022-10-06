class Book
  attr_accessor :title
  attr_reader :author

  def initialize(title ,author)
    @title = title
    @author = author
  end
end