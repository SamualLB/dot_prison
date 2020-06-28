require "../src/dot_prison"

prison = DotPrison::Table.build do |table|
  table.element :Version, :"the_bucket_1.0"
  table.element :VersionNum, 1
  table.element :NumCellsX, 150
  table.element :NumCellsY, 120
  table.element :Cells do |table|
    table.element :"0 0" do |table|
      table.element :Mat, :Sand
      table.element :Con, 0.0
    end
    table.element :"0 1" do |table|
      table.element :Mat, :Sand
      table.element :Con, 0.0
    end
    table.element :"1 2" do |table|
      table.element :Mat, :BrickWall
      table.element :Con, 93.98028
      table.element :Ind, true
      table.element :PrisonDir, 150994944
      table.element :StaffDir, -16384000
    end
  end
end

puts prison.parse_table(:Cells).parse_table(:"1 2").parse_string(:Mat)
