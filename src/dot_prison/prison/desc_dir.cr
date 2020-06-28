struct DotPrison::Prison::DescDir < DotPrison::Consumer
  consume :description, String, :Desc
  consume :author, String, :AuthorName
end
