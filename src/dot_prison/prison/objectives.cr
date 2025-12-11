struct DotPrison::Prison::Objectives < DotPrison::Consumer
  struct CropsSold < DotPrison::Consumer
    consume :cabbage, Int32, :Cabbage
    consume :potato, Int32, :Potato
    consume :barley, Int32, :Barley
    consume :wheat, Int32, :Wheat
    consume :corn, Int32, :Corn
    consume :carrot, Int32, :Carrot
    consume :tomato, Int32, :Tomato
    consume :apple, Int32, :Apple
    consume :banana, Int32, :Banana
    consume :peach, Int32, :Peach
    consume :orange, Int32, :Orange
  end

  consume :crops_sold, CropsSold, :cropsSold
  # TODO: Empty
  consume :selected_objectives, DotPrison::Table, :SelectedObjectives
end