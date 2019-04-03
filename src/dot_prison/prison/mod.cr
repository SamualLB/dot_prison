class DotPrison::Prison::Mod < DotPrison::StoreConsumer
  handle :name, :String, :Name
  handle :file_id, :String, :FileID
end
