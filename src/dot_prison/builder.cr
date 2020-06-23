module DotPrison
  def self.build(io : IO)
    builder = DotPrison::Builder.new(io)
  end
end
