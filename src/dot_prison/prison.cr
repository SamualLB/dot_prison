struct DotPrison::Prison < DotPrison::Consumer
end

require "./table"
require "./prison/*"

struct DotPrison::Prison < DotPrison::Consumer

  def to_prison(io)
    table.to_prison(io)
  end

  consume :version, String, :Version
  consume :version_number, Int32, :VersionNum
  consume :size, {Int32, Int32}, :NumCellsX, :NumCellsY
  consume :origin_pos, {Int32, Int32}, :OriginX, :OriginY
  consume :origin_size, {Int32, Int32}, :OriginW, :OriginH
  consume :time, Float64, :TimeIndex
  consume :time_warp, Float64, :TimeWarpFactor
  consume :seed, Int32, :RandomSeed
  consume :playtime, Int32, :SecondsPlayed
  consume :next_id, Int32, :"ObjectId.next"

  consume :electricity_enabled, Bool, :EnabledElectricity
  consume :water_enabled, Bool, :EnabledWater
  consume :food_enabled, Bool, :EnabledFood
  consume :misconduct_enabled, Bool, :EnabledMisconduct
  consume :decay_enabled, Bool, :EnabledDecay

  consume :desert_plot, Bool, :DesertPlot
  consume :centre_aligned, Bool, :ObjectsCentreAligned
  consume :failure_conditions_enabled, Bool, :FailureConditions
  consume :unlimited_funds, Bool, :UnlimitedFunds

  consume :bio_version, Int32, :BioVersions
  consume :needs_version, Int32, :NeedsVersion
  consume :entity_version, Int32, :EntityVersion

  consume :ceo_letter_read, Bool, :CeoLetterRead
  consume :use_cell_quality, Bool, :UseCellQuality
  consume :first_death_row_notice, Bool, :FirstDeathRowNotice
  consume :transfers_enabled, Bool, :prisonerTransfers
  consume :escape_plans_enabled, Bool, :EscapePlans
  consume :balance, Float64, :Balance
  consume :selected_guard_companion, Int32, :SelectedGuardCompanion

  consume :tiles, DotPrison::GridTable(DotPrison::Prison::Tile), :Cells
  consume :objects, DotPrison::IndexedTable(DotPrison::Prison::Object), :Objects
  # TODO: Does not separate depending on room type
  consume :rooms, DotPrison::IndexedTable(DotPrison::Prison::Room), :Rooms
  consume :work_queue, DotPrison::Prison::WorkQueue, :WorkQ
  consume :regime, DotPrison::Prison::Regime, :Regime
  consume :supply_chain, DotPrison::Prison::SupplyChain, :SupplyChain
  consume :finance, DotPrison::Prison::Finance, :Finance

  # TODO: Unknown format, Store name is xy coordinates followed by 0.
  # Does 0 mean something?
  consume :patrols, DotPrison::Table, :Patrols

  # TODO: Awkward
  consume :electricity, DotPrison::GridTable(DotPrison::ElectricityTile), :Electricity

  # TODO: Needs to be custom to consume OffValves, don't know what that is though...
  consume :water, DotPrison::GridTable(DotPrison::Prison::WaterTile), :Water
  consume :research, DotPrison::Prison::Research, :Research
  consume :construction, DotPrison::Prison::Construction, :Construction
  consume :penalties, DotPrison::Prison::Penalties, :Penalties
  consume :sectors, DotPrison::Prison::Sectors, :Sectors
  # TODO: Unknown format
  consume :grants, DotPrison::Table, :Grants
  consume :misconduct, DotPrison::Prison::Misconduct, :Misconduct
  consume :visitation, DotPrison::Prison::Visitation, :Visitation
  consume :thermometer, DotPrison::Prison::Thermometer, :Thermometer
  # TODO: Unknown format
  consume :squads, DotPrison::Table, :Squads
  consume :contraband, DotPrison::Prison::Contraband, :Contraband
  consume :tunnels, DotPrison::Prison::Tunnels, :Tunnels
  consume :reform, DotPrison::Prison::Reform, :Reform
  consume :victory, DotPrison::Prison::Victory, :Victory

  # TODO: Nicer object
  consume :production, DotPrison::Table, :Production

  # TODO: Nicer object
  consume :informants, DotPrison::Table, :Informants

  # TODO: Nicer object
  consume :needs_library, DotPrison::Table, :NeedsLibrary

  # TODO: Nicer object
  consume :deployment_schedule, DotPrison::Table, :DeploymentSchedule

  # TODO: Nicer object
  consume :intake, DotPrison::Table, :Intake

  # TODO: Nicer object
  consume :execution, DotPrison::Table, :Execution

  # TODO: Nicer object
  consume :events, DotPrison::Table, :Events

  # TODO: Nicer object
  consume :wardens, DotPrison::Table, :Wardens

  # TODO: Nicer object
  consume :weather_map, DotPrison::Table, :WeatherMap

  # TODO: Nicer object
  consume :mutator, DotPrison::Table, :MutatorSystem

  # TODO: Nicer object
  consume :stats_tracker, DotPrison::Table, :StatsTracker

  # TODO: Nicer object
  consume :bridge_data, DotPrison::Table, :BridgeData

  # TODO: Nicer object
  consume :policy_data, DotPrison::Table, :PolicyData

  # TODO: Nicer object
  consume :transfer_data, DotPrison::Table, :TransferData

  # TODO: Nicer object
  consume :script_zones, DotPrison::Table, :ScriptZones

  # TODO: Nicer object
  consume :crisis_sector_data, DotPrison::Table, :CrisisSectorData

  # TODO: Nicer object
  consume :desc_dir, DotPrison::Table, :DescDir
end

require "./prison/*"
