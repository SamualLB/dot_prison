class DotPrison::Prison
  macro reference(opt)
    class DotPrison::Prison::{{opt.type.id.split("::").last.id}}Reference
      getter id : Int32? = nil
      getter unique_id : Int32? = nil
      @{{opt.var}} : {{opt.type}}? = nil

      def initialize(@prison : Prison)
      end

      def initialize(@prison : Prison, @id, @unique_id)
      end

      def {{opt.var}} : {{opt.type}}?
        return nil unless @{{opt.var}} || @id || @unique_id
        @{{opt.var}} = @prison.find_{{opt.var}}?(@id) || @prison.find_unique_{{opt.var}}?(@unique_id)
      end

      def {{opt.var}}=({{opt.var}} : {{opt.type}})
        @{{opt.var}} = {{opt.var}}
        @id = {{opt.var}}.id
        @unique_id = {{opt.var}}.unique_id
      end

      def {{opt.var}}=(ids : Tuple(Int32, Int32))
        @id = ids[0]
        @unique_id = ids[1]
        @{{opt.var}} = @prison.find_{{opt.var}}?(@id) || @prison.find_unique_{{opt.var}}?(@unique_id)
      end

      def {{opt.var}}=(nothing : Nil)
        @{{opt.var}} = nil
        @id = nil
        @unique_id = nil
      end
    end

    # Prison#
    def find_{{opt.var}}
    end

    def find_{{opt.var}}?
    end

    def find_unique_{{opt.var}}
    end

    def find_unique_{{opt.var}}?
    end
  end

  reference(room : Room)
  reference(prisoner : Object::Prisoner)
end
