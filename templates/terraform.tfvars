resources = {

    buckets = [
    {% for index in range(bucket_count) %}
        {% if loop.last %}
        {
            name = "my-bucket-{{index}}"
        }
        {% endif %}
        {% if not loop.last %}
        {
            name = "my-bucket-{{index}}"
        },
        {% endif %}
    {%- endfor %}
    ],
    mig = [
        {
            hostname: "my-host",
            target_size = {{instance_count}},
            labels = {
                environment = "{{environment}}"
            }
        }
    ],
    db = [
    {% if db_type == "mysql" %}
        {
            type: "mysql",
            db_version: "MYSQL_8_0"

        }
    {% endif %}
    ]

}


