struct DotPrison::Prison::AdviserSystem < DotPrison::Consumer
    # TODO: Empty
    consume played_messages, DotPrison::Table, :PlayedMessageHashes
end