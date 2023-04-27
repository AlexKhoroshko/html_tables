module HtmlTableValidator
  ALLOWED_ATTRIBUTES = %i[class style width height border cellpadding header rows].freeze

  def validate(payload)
    validate_table(payload['table'])
    validate_headers(payload.dig('table', 'header'))
    validate_rows(payload.dig('table', 'rows'))
  end

  private

  def validate_table(table)
    raise HtmlTableValidator::Error, 'Missing table data' unless table.is_a?(Hash)

    unknown_attributes = table.keys.map(&:to_sym) - ALLOWED_ATTRIBUTES

    return if unknown_attributes.empty?

    raise HtmlTableValidator::Error,
          "Unknown table attributes: #{unknown_attributes.join(', ')}"
  end

  def validate_headers(header)
    raise HtmlTableValidator::Error, 'Missing header data' unless header.is_a?(Hash)

    raise HtmlTableValidator::Error, 'Missing header columns' unless header.key?('columns')
  end

  def validate_rows(rows)
    raise HtmlTableValidator::Error, 'Missing rows data' unless rows.is_a?(Array)

    rows.each do |row|
      raise HtmlTableValidator::Error, 'Missing row data' unless row.is_a?(Hash)

      raise HtmlTableValidator::Error, 'Missing row cells data' unless row.key?('data')
    end
  end

  class Error < StandardError; end
end
