#!/usr/bin/python

from jinja2 import Environment, FileSystemLoader


file_loader = FileSystemLoader('templates')
env = Environment(loader=file_loader)
env.trim_blocks = True
env.lstrip_blocks = True
env.rstrip_blocks = True

template = env.get_template('terraform.tfvars.tml')

bucket_count = 3
instance_count = 2
db_type = "mysql"
environment = "development"
output = template.render(
    bucket_count=bucket_count, 
    instance_count=instance_count,
    environment=environment,
    db_type=db_type
    )
# print(output)

# to save the results
with open("terraform.tfvars", "w") as fh:
    fh.write(output)