class DotPrison::Prison::Visitation < DotPrison::StoreConsumer;end

require "./visitation/*"

class DotPrison::Prison::Visitation < DotPrison::StoreConsumer
  handle(:timer, :Float64, :Timer)
  handle(:visit_count, :Int32, :VisitCount)
  handle(:active_groups, :Int32, :ActiveVisitorGroups)

  custom_handle(:visitor_groups, :"Array(Group)", :Visitation)

  def initialize(store : Store, prison : Prison)
    super
    @visitor_groups = [] of Group
    store.parse_store_array(:Visitation).each do |group|
      visitor_groups << Group.new(group, prison)
    end
  end
end

