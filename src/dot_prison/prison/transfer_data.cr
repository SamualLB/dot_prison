# TODO: Enum indexing instead of category_i
struct DotPrison::Prison::TransferData < DotPrison::Consumer
  CRITERIA = {:staff_assaults => :staffAssaults, :murders => :murders, :escape_attempts => :escapeAttempts, :contraband => :contraband, :gang_members => :gangMembers, :reoffending => :reoffending, :programs_passed => :programsPassed, :criteria_met => :criteriaMet}

  struct Category < DotPrison::Consumer
    struct Amount < DotPrison::Consumer
      {% for k, v in CRITERIA %}
        consume {{k}}, Int32, {{v}}
      {% end %}
    end

    struct Qualified < DotPrison::Consumer
      {% for k, v in CRITERIA %}
        consume {{k}}, Int32, {{v}}
      {% end %}
    end

    struct Criteria < DotPrison::Consumer
      {% for k, v in CRITERIA %}
        consume {{k}}, Bool, {{v}}
      {% end %}
    end

    consume :transfer_allowed, Bool, :TransferAllowed
    consume :num_transfer, Int32, :NumTransfers
    consume :amount, Amount, :Amount
    consume :qualified, Qualified, :Qualified
    consume :criteria, Criteria, :Criteria
  end

  {% for i in 0..2 %}
    consume :category_{{i}}, Category, :"{{i}}"
  {% end %}
end
