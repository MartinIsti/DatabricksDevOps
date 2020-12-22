#!/bin/bash

python -m pip install databricks-cli

echo -e "Testing the conncection - listing dbfs:/"
dbfs ls
