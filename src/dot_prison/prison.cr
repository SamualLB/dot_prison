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
  consume :size, Tuple(Int32, Int32), :NumCellsX, :NumCellsY
  consume :origin_pos, Tuple(Int32, Int32), :OriginX, :OriginY
  consume :origin_size, Tuple(Int32, Int32), :OriginW, :OriginH
  consume :time, Float64, :TimeIndex
  consume :time_warp, Float64, :TimeWarpFactor
  consume :seed, Int32, :RandomSeed
  consume :playtime, Int32, :SecondsPlayed
  consume :reoffend, Int32, :Reoffend # Unknown use
  consume :next_id, Int32, :"ObjectId.next"

  consume :electricity_enabled, Bool, :EnabledElectricity
  consume :water_enabled, Bool, :EnabledWater
  consume :food_enabled, Bool, :EnabledFood
  consume :misconduct_enabled, Bool, :EnabledMisconduct
  consume :criminally_insane_enabled, Bool, :EnabledCriminallyInsane
  consume :decay_enabled, Bool, :EnabledDecay
  consume :visibility_enabled, Bool, :EnabledVisibility
  consume :intake_enabled, Bool, :EnabledIntake
  consume :weather_enabled, Bool, :EnabledWeather

  consume :immediate_materials, Bool, :ImmediateMaterials
  consume :generate_forests, Bool, :GenerateForests
  consume :generate_lakes, Bool, :GenerateLakes
  consume :island_plot, Bool, :IslandPlot
  consume :island_bridge, Bool, :IslandBridge
  consume :desert_plot, Bool, :DesertPlot
  consume :jungle_plot, Bool, :JunglePlot
  consume :centre_aligned, Bool, :ObjectsCentreAligned
  consume :failure_conditions_enabled, Bool, :FailureConditions
  consume :unlimited_funds, Bool, :UnlimitedFunds

  consume :food_quantity, Int32, :FoodQuantity
  consume :food_variation, Int32, :FoodVariation

  consume :lethal_force_enabled, Bool, :LethalForce

  consume :bio_version, Int32, :BioVersions
  consume :needs_version, Int32, :NeedsVersion
  consume :entity_version, Int32, :EntityVersion

  consume :ceo_letter_read, Bool, :CeoLetterRead
  consume :use_cell_quality, Bool, :UseCellQuality
  consume :first_death_row_notice, Bool, :FirstDeathRowNotice
  consume :transfers_enabled, Bool, :prisonerTransfers
  consume :escape_plans_enabled, Bool, :EscapePlans
  consume :punishment_by_sector_enabled, Bool, :UsePunishmentBySector
  consume :balance, Float64, :Balance
  consume :selected_guard_companion, Int32, :SelectedGuardCompanion
  consume :game_speed, Float64, :GameSpeed
  consume :block_land_expansion, Bool, :BlockLandExpansion

  consume :uniform_colour_none, DotPrison::Colour, :None_colourUniform
  consume :uniform_colour_min_sec, DotPrison::Colour, :MinSec_colourUniform
  consume :uniform_colour_normal, DotPrison::Colour, :Normal_colourUniform
  consume :uniform_colour_max_sec, DotPrison::Colour, :MaxSec_colourUniform
  consume :uniform_colour_protected, DotPrison::Colour, :Protected_colourUniform
  consume :uniform_colour_super_max, DotPrison::Colour, :SuperMax_colourUniform
  consume :uniform_colour_death_row, DotPrison::Colour, :DeathRow_colourUniform
  consume :uniform_colour_insane, DotPrison::Colour, :Insane_colourUniform
  consume :uniform_colour_transfer_prisoner, DotPrison::Colour, :PrisonerTransfer_colourUniform


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
  consume :electricity, DotPrison::GridTable(Prison::ElectricityTile), :Electricity
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
  consume :production, DotPrison::Prison::Production, :Production
  consume :informants, DotPrison::Prison::Informants, :Informants
  consume :needs_library, DotPrison::Prison::NeedsLibrary, :NeedsLibrary
  consume :deployment_schedule, DotPrison::Prison::DeploymentSchedule, :DeploymentSchedule
  consume :intake, DotPrison::Prison::Intake, :Intake
  consume :execution, DotPrison::Prison::Execution, :Execution
  consume :events, DotPrison::Prison::Events, :Events
  consume :wardens, DotPrison::Prison::Wardens, :Wardens
  consume :weather_map, DotPrison::Prison::WeatherMap, :WeatherMap
  consume :mutator_system, DotPrison::Prison::MutatorSystem, :MutatorSystem
  consume :stats_tracker, DotPrison::Prison::StatsTracker, :StatsTracker
  # TODO: Empty
  consume :bridge_data, DotPrison::Table, :BridgeData
  consume :policy_data, DotPrison::Prison::PolicyData, :PolicyData
  consume :transfer_data, DotPrison::Prison::TransferData, :TransferData
  consume :script_zones, DotPrison::Prison::ScriptZones, :ScriptZones
  consume :crisis_sector_data, DotPrison::GridTable(DotPrison::Prison::CrisisSector), :CrisisSectorData
  consume :desc_dir, DotPrison::Prison::DescDir, :DescDir
end

require "./prison/*"
