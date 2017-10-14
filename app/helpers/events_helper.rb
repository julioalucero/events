module EventsHelper
  def search_compact_json_params
    compact(search_params).as_json
  end

  private

  def compact(hash)
    hash.delete_if { |k, v| v.blank? }
  end
end
