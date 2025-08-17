# CS301 DBMS Lab Solutions

This repository contains my solutions to the lab assignments for the CS301 Database Management Systems (DBMS) course.

## Overview

Instead of executing SQL queries line by line in the CLI, I prefer saving all queries in a single file and running them together. This approach helps in organizing commands and obtaining all results at once.

## Initial Setup

1. **Create the Database:**
   - First, create a database named `main` in PostgreSQL.  
     Run the following commands:
     ```sh
     sudo -u postgres psql
     ```
     Inside the PostgreSQL prompt:
     ```sql
     CREATE DATABASE main;
     ```
     Exit the prompt with `\q`.

   - Next, set up the schema and initial data:
     ```sh
     sudo -u postgres psql -d main -f CreateMainDatabase.sql > output.txt
     ```

2. **Run Solution Files:**
   - To execute any solution file, use:
     ```sh
     sudo -u postgres psql -d main -f solution.sql > output.txt
     ```

## Notes

- All SQL queries are saved in `.sql` files for easy execution and record-keeping.
- Output from each run is redirected to `output.txt` for review.

## Repository Structure

- `CreateMainDatabase.sql`: Script to create and initialize the database.
- `solution.sql`: Solution file for each lab containing SQL queries.

