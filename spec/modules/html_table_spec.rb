require_relative '../../modules/html_table'

RSpec.describe HtmlTable do
  describe '.build' do
    context 'with valid payload' do
      let(:payload) do
        {
          'table' => {
            'class' => 'my-table',
            'style' => 'border: 1px solid black',
            'width' => '500',
            'height' => '300',
            'border' => '1',
            'cellpadding' => '1',
            'header' => {
              'columns' => ['Header 1', 'Header 2'],
              'class' => 'header-cell',
              'style' => ''
            },
            'rows' => [
              {
                'data' => ['Data 1', 'Data 2'],
                'class' => 'data-cell',
                'style' => ''
              },
              {
                'data' => ['Data 3', 'Data 4'],
                'class' => 'data-cell',
                'style' => ''
              }
            ]
          }
        }
      end

      it 'returns the HTML table string' do
        expected_html = '<table class="my-table" style="border: 1px solid black" width="500" height="300" border="1" cellpadding="1">' \
                        '<thead class="header-cell" style="">' \
                        '<tr>' \
                        '<th>Header 1</th>' \
                        '<th>Header 2</th>' \
                        '</tr>' \
                        '</thead>' \
                        '<tbody>' \
                        '<tr class="data-cell" style="">' \
                        '<td>Data 1</td>' \
                        '<td>Data 2</td>' \
                        '</tr>' \
                        '<tr class="data-cell" style="">' \
                        '<td>Data 3</td>' \
                        '<td>Data 4</td>' \
                        '</tr>' \
                        '</tbody>' \
                        '</table>'

        expect(HtmlTable.build(payload)).to eq(expected_html)
      end
    end

    context 'with invalid payload' do
      let(:payload) { {} }

      it 'raises an error' do
        expect { HtmlTable.build(payload) }.to raise_error(StandardError, 'Missing table data')
      end
    end
  end
end
