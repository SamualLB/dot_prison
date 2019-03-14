class DotPrison::Prison::Water::Pipes < DotPrison::StoreConsumer
  handle(:pressure, :"Tuple(Float64, Float64)", :PressureX, :PressureY)
  handle(:hot_pressure, :"Tuple(Float64, Float64)", :PressureXHot, :PressureYHot)
  handle(:hot_pipe, :Bool, :HotPipe)

  custom_handle(:pipe_type, :"PipeType | Int32", :PipeType)

  def initialize(store : Store, prison : Prison)
    init_store(store)
    @pipe_type = PipeType.from_store(store.parse_int(:PipeType))
  end
end
