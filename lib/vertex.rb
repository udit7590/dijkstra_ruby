class Vertex
  attr_accessor :lat, :lon

  def initialize(lat, lon)
    self.lat   = lat
    self.lon   = lon
  end

  def to_s
    "#{lat},#{lon}"
  end

  def primary_key
    to_s
  end
end
