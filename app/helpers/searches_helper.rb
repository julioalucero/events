module SearchesHelper
  def metadata_text_link(metadata)
    metadata.map { |key, value| "#{key}: #{value} ~" }
  end
end
