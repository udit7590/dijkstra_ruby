class Edge
  attr_accessor :source, :destination
  attr_accessor :length

  def initialize(source, destination, length)
    self.source      = source
    self.destination = destination
    self.length      = length
  end

  def to_s
    "#{lat},#{lon}"
  end
end
