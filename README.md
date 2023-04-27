# Html Table

Html Table is a small API for generating HTML tables

## Requirements

Docker

## Usage

### Start the services using Docker Compose:
docker-compose up --build

The web service will be available at http://0.0.0.0:9292. 

You can use the following endpoints to create html:

POST /html_tables

You can also add attributes and styles to your table, headers, rows, and cells 

body example:
```json
{
  "table": {
    "class": "my-table",
    "style": "border: solid black",
    "width": "800px",
    "height": "500px",
    "border": "2",
    "cellpadding": "10",
    "header": {
      "style": "font-weight: bold; text-align: center; background-color: lightgray;",
      "class": "header-cell",
      "columns": ["Name", "Age", "Email"]
    },
    "rows": [
      {
        "class": "data-cell",
        "style": "background-color: lightgray;",
        "data": ["John Doe", "25", "john.doe@example.com"]
      },
      {
        "class": "data-cell",
        "style": "background-color: lightblue;",
        "data": ["Jane Smith", "30", "jane.smith@example.com"]
      },
      {
        "class": "data-cell",
        "style": "background-color: lightgray;",
        "data": ["Bob Johnson", "41", "bob.johnson@example.com"]
      }
    ]
  }
}

```

response format example:

{"data":"&lt;table class=&#39;my-table&#39; style=&#39;border: solid black&#39; width=&#39;800px&#39; height=&#39;500px&#39; border=&#39;2&#39; cellpadding=&#39;10&#39;&gt;&lt;thead class=&#39;header-cell&#39; style=&#39;font-weight: bold; text-align: center; background-color: lightgray;&#39;&gt;&lt;tr&gt;&lt;th&gt;Name&lt;/th&gt;&lt;th&gt;Age&lt;/th&gt;&lt;th&gt;Email&lt;/th&gt;&lt;/tr&gt;&lt;/thead&gt;&lt;tbody&gt;&lt;tr class=&#39;data-cell&#39; style=&#39;background-color: lightgray;&#39;&gt;&lt;td&gt;John Doe&lt;/td&gt;&lt;td&gt;25&lt;/td&gt;&lt;td&gt;john.doe@example.com&lt;/td&gt;&lt;/tr&gt;&lt;tr class=&#39;data-cell&#39; style=&#39;background-color: lightblue;&#39;&gt;&lt;td&gt;Jane Smith&lt;/td&gt;&lt;td&gt;30&lt;/td&gt;&lt;td&gt;jane.smith@example.com&lt;/td&gt;&lt;/tr&gt;&lt;tr class=&#39;data-cell&#39; style=&#39;background-color: lightgray;&#39;&gt;&lt;td&gt;Bob Johnson&lt;/td&gt;&lt;td&gt;41&lt;/td&gt;&lt;td&gt;bob.johnson@example.com&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;"}

