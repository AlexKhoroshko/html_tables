require 'html_table_dsl'
require_relative 'html_table_validator'

module HtmlTable
  class << self
    include HtmlTableDSL
    include HtmlTableValidator

    def build(payload)
      validate payload

      table_class, table_style, table_width,
      table_height, table_border, table_cellpadding = extract_table_attributes(payload)

      headers = extract_table_headers(payload)

      rows = extract_table_rows(payload)

      table class: table_class, style: table_style, width: table_width, height: table_height,
            border: table_border, cellpadding: table_cellpadding do
        header class: headers[:header_class], style: headers[:header_style] do
          headers[:headers].each do |header|
            cell header
          end
        end

        rows.each do |row|
          row_data = row[:data]
          row_class = row[:row_class]
          row_style = row[:row_style]

          row class: row_class, style: row_style do
            row_data.each do |cell_data|
              cell cell_data
            end
          end
        end
      end
    end

    private

    def extract_table_attributes(payload)
      [
        payload.dig('table', 'class') || 'my-table',
        payload.dig('table', 'style') || 'border: 1px solid black',
        payload.dig('table', 'width') || '500',
        payload.dig('table', 'height') || '300',
        payload.dig('table', 'border') || '1',
        payload.dig('table', 'cellpadding') || '1'
      ]
    end

    def extract_table_headers(payload)
      headers = payload.dig('table', 'header', 'columns')
      header_class = payload.dig('table', 'header', 'class') || 'header-cell'
      header_style = payload.dig('table', 'header', 'style') || ''

      { headers: headers, header_class: header_class, header_style: header_style }
    end

    def extract_table_rows(payload)
      rows = payload.dig('table', 'rows')
      rows.map do |row|
        data = row['data'] || ' '
        row_class = row['class'] || 'data-cell'
        row_style = row['style'] || ''

        { data: data, row_class: row_class, row_style: row_style }
      end
    end
  end
end
