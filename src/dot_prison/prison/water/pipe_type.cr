enum DotPrison::Prison::Water::PipeType
  None = 0

  DEFAULT = None

  def self.from_store(int) : PipeType | Int32
    return DEFAULT unless int.is_a? Int32
    typ = from_value? int
    return typ if typ
    DotPrison.logger.debug "Unknown pipe type: #{int}"
    int
  end
end
