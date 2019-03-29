class DotPrison::Prison::Reform < DotPrison::StoreConsumer
  handle(:next_program_id, :Int32, :NextProgramId)

  custom_handle(:programs, :"Array(Program)", :Programs)
  custom_handle(:allocations, :"Array(Allocation)", :Allocations)
  custom_handle(:reports, :"Hash(Program::Type | String, Report)", :Reports)

  def initialize(store : Store, @prison : Prison)
    init_store(store, prison)
    @programs = [] of Program
    store.parse_indexed_store(:Programs) do |prog|
      programs << Program.new(prog, prison)
    end
    @allocations = [] of Allocation
    store.parse_store(:Allocations).parse_store_array(:i).each do |alo|
      allocations << Allocation.new(alo, prison)
    end
    @reports = {} of Program::Type | String => Report
    store.parse_store(:Reports).each do |k, v|
      next unless v.is_a? Store
      typ = Program::Type.from_store(k)
      next unless typ
      reports[typ] = Report.new(v, prison)
    end
  end
end

require "./reform/*"
