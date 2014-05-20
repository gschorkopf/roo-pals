class HTMLDocument
  attr_reader :path

  def self.from(path)
    new(path).read
  end

  def initialize(path)
    @path = path
  end

  def read
    Nokogiri::HTML(open(path))
    # TODO: Figure out how to inject dependency
  end
end
