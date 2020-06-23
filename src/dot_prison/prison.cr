require "./store"
require "./prison/*"

struct DotPrison::Prison < DotPrison::Consumer
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

  consume :tiles, DotPrison::GridStore(DotPrison::Tile), :Cells
  # TODO: Does not separate depending on object type
  consume :objects, DotPrison::IndexedStore(DotPrison::Object), :Objects
  # TODO: Does not separate depending on room type
  consume :rooms, DotPrison::IndexedStore(DotPrison::Room), :Rooms
  consume :work_queue, DotPrison::WorkQueue, :WorkQ
  consume :regime, DotPrison::Regime, :Regime
  consume :supply_chain, DotPrison::SupplyChain, :SupplyChain
  consume :finance, DotPrison::Finance, :Finance

  # TODO: Unknown format, Store name is xy coordinates followed by 0.
  # Does 0 mean something?
  consume :patrols, DotPrison::Store, :Patrols

  # TODO: Awkward
  consume :electricity, DotPrison::GridStore(DotPrison::ElectricityTile), :Electricity

  # TODO: Needs to be custom to consume OffValves, don't know what that is though...
  consume :water, DotPrison::GridStore(DotPrison::WaterTile), :Water

  # TODO: Nicer object
  consume :research, DotPrison::Store, :Research

  # TODO: Nicer object
  consume :construction, DotPrison::Store, :Construction

  # TODO: Nicer object
  consume :penalties, DotPrison::Store, :Penalties

  # TODO: Nicer object
  consume :sectors, DotPrison::Store, :Sectors

  # TODO: Nicer object
  consume :grants, DotPrison::Store, :Grants

  # TODO: Nicer object
  consume :misconduct, DotPrison::Store, :Misconduct

  # TODO: Nicer object
  consume :visitation, DotPrison::Store, :Visitation

  # TODO: Nicer object
  consume :thermometer, DotPrison::Store, :Thermometer

  # TODO: Nicer object
  consume :squads, DotPrison::Store, :Squads

  # TODO: Nicer object
  consume :contraband, DotPrison::Store, :Contraband

  # TODO: Nicer object
  consume :tunnels, DotPrison::Store, :Tunnels

  # TODO: Nicer object
  consume :reform, DotPrison::Store, :Reform

  # TODO: Nicer object
  consume :victory, DotPrison::Store, :Victory

  # TODO: Nicer object
  consume :production, DotPrison::Store, :Production

  # TODO: Nicer object
  consume :informants, DotPrison::Store, :Informants

  # TODO: Nicer object
  consume :needs_library, DotPrison::Store, :NeedsLibrary

  # TODO: Nicer object
  consume :deployment_schedule, DotPrison::Store, :DeploymentSchedule

  # TODO: Nicer object
  consume :intake, DotPrison::Store, :Intake

  # TODO: Nicer object
  consume :execution, DotPrison::Store, :Execution

  # TODO: Nicer object
  consume :events, DotPrison::Store, :Events

  # TODO: Nicer object
  consume :wardens, DotPrison::Store, :Wardens

  # TODO: Nicer object
  consume :weather_map, DotPrison::Store, :WeatherMap

  # TODO: Nicer object
  consume :mutator, DotPrison::Store, :MutatorSystem

  # TODO: Nicer object
  consume :stats_tracker, DotPrison::Store, :StatsTracker

  # TODO: Nicer object
  consume :bridge_data, DotPrison::Store, :BridgeData

  # TODO: Nicer object
  consume :policy_data, DotPrison::Store, :PolicyData

  # TODO: Nicer object
  consume :transfer_data, DotPrison::Store, :TransferData

  # TODO: Nicer object
  consume :script_zones, DotPrison::Store, :ScriptZones

  # TODO: Nicer object
  consume :crisis_sector_data, DotPrison::Store, :CrisisSectorData

  # TODO: Nicer object
  consume :desc_dir, DotPrison::Store, :DescDir
end

require "./prison/*"
