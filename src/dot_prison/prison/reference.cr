class DotPrison::Prison
  class Reference(Target)
    getter id : Int32? = nil
    getter unique_id : Int32? = nil

    @target : Target? = nil

    def initialize(@prison : Prison)
    end

    def initialize(@prison : Prison, @id, @unique_id)
    end

    def initialize(@prison : Prison, id : Int32, uid : Int32)
      @id, @unique_id = id, uid unless id == 0 && uid == 0
    end

    def ids=(ids : Tuple(Int32, Int32))
      @id = ids[0]
      @unique_id = ids[1]
      @target = nil
    end

    def id=(id : Int32)
      @id = id
      @target = nil
    end

    def unique_id(uid : Int32)
      @unique_id = uid
      @target = nil
    end

    def target=(t : Target)
      @target = t
      @id = t.id
      @unique_id = t.unique_id
    end

    def target : Target?
      return @target if @target
      return nil unless @id || @unique_id
      find = @prison.find(@unique_id, @id, Target)
      @target = find if find.is_a?(Target)
    end

    def target! : Target
      target || raise "Target does not exist for Reference #{@id}, #{unique_id}"
    end

    forward_missing_to target!
  end
end
