# Requirements

1. Output
    - the expanded transportation_lanes.csv where key columns are expanded and column H has the final calculated cost.

1. Docx Requirements
    - Review docx, skipping yellow

1. Report timings
    - read and stage  (user tables to standard tables)
    - expansion (standard tables to expand in memory)
    - writing of outputs (standard tables to output)
      - to DB table
      - to csv file
      - into memory in python

1. Dedupe and rollup values
    - if there is a row that's expanded via groups that duplicates one specified without groups they need to be deduped, and values roll forward

1. Error and warning logs
    - reporting a value that doesn't correspond to a valid group of the correct type or item (such as a product) - such rows should be discarded by a warning/error reported (perhaps a continue on error option would be good)
    - note that excluded items (such as products) are not the same as an invalid value (a value that doesn't correspond to a valid item or group at all)

## Bonus

1. We might want to include models that need to expand more than one table - perhaps demand and some of the constraints and policy tables. This will allow us to evaluate how the different solutions can handle processing multiple tables - i.e. concurrently or serially

1. One other important consideration is how the data will be initially received. As most of us know, LLamasoft Guru models are stored in SQL databases. Do we anticipate that this is where the data will originally be, or that we will receive a set of exported files? How will the user make changes to the model between runs? The tests we have done so far are against csv files - not sure if this is true to what the ultimate use case will be - we may need to evaluate how the solutions perform when the source data is in a SQL database...

1. Ali to put together an evaluation criteria
    - nothing heavy or formal
    - Speed
    - Ease of code (a subjective assessment)
    - parallelization
    - ease of deployment (easy to be integrated with the whole solution)
    - etc...
