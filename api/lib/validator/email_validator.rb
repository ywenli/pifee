class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, _value)
    record.errors.add(attribute, :taken) if record.email_activated?
  end
end
