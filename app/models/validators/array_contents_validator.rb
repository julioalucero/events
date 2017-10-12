class ArrayContentsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, array)
    valid_contents = options[:contents]

    if array.any? { |value| !valid_contents.include?(value) }
      record.errors.add(attribute, get_error_message(record, attribute))
    end
  end

  def get_error_message(object, field)
    I18n.t("activerecord.errors.models.#{object.class.name.underscore}.attributes.#{field}.contents",
           default: 'is not a valid content')
  end
end