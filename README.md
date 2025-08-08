# mcp-for-postgresql

## MCP server for local PostgreSQL server:
1. Allows AI agent powered by GPT-5 LLM to query local databases that run on local PostgreSQL server and provide relevant meaningful responses
2. Integrated to Cursor

  
## Architecture
![](https://raw.githubusercontent.com/r3v5/mcp-for-postgresql/main/docs/mcp-for-postgres-architecture.png)

  
## Here’s how it works step by step
1. You send a specific request to the LLM in your host application (e.g., “List me all the data about people that have subscription date in 2020”).
2. The LLM (client) processes your text and checks whether an MCP tool is available for that request.
3. If a relevant tool is configured, the MCP client forwards the request over the MCP protocol to an MCP server.
4. The MCP server performs the requested task:
    - It will query your local data source - your concrete PostgreSQL database.
5. The server returns the results to the MCP client, which hands them back to the LLM.
6. The LLM then formats those results and presents them to you in the host application (in our case - Cursor).

## Prerequisites
- Installed [uv](https://docs.astral.sh/uv/getting-started/installation/) on your machine
- Installed psql CLI

## Getting started
> this tutorial runs on MAC

1.  Clone the repo: 
```git clone https://github.com/r3v5/mcp-for-postgresql.git```

2. Create local venv and activate it:
```cd mcp-for-postgresql```
```uv venv .venv --python 3.12```    
```source .venv/bin/activate```     

3. Install requirements:
 ```uv pip install -r requirements.txt```
 
4. Start your Postgres server:
```brew services start postgresql```

5. Allow permission to execute scripts to create PostgreSQL database and insert data:
```chmod +x scripts/create_db_and_insert_data.sh```

6. Check **my_customers** db:
 ```psql my_customers``` 
 
You should see the **customers** table
```
psql (14.18 (Homebrew))
Type "help" for help.

my_customers=# \z
                               Access privileges
 Schema |   Name    | Type  | Access privileges | Column privileges | Policies 
--------+-----------+-------+-------------------+-------------------+----------
 public | customers | table |                   |                   | 
(1 row)

my_customers=#
```


7. Try to see what data is stored in this table:
```my_customers=# select * from customers;```

```
id |   customer_id    | first_name | last_name  |             company             |       city        |          country           |         phone1         |        phone2         |            email            | subscription_date |           website           
----+------------------+------------+------------+---------------------------------+-------------------+----------------------------+------------------------+-----------------------+-----------------------------+-------------------+-----------------------------
  1 | DD37Cf93aecA6Dc  | Sheryl     | Baxter     | Rasmussen Group                 | East Leonard      | Chile                      | 229.077.5154           | 397.884.0519x718      | zunigavanessa@smith.info    | 2020-08-24        | http://www.stephenson.com/
  2 | 1Ef7b82A4CAAD10  | Preston    | Lozano, Dr | Vega-Gentry                     | East Jimmychester | Djibouti                   | 5153435776             | 686-620-1820x944      | vmata@colon.com             | 2021-04-23        | http://www.hobbs.com/
  3 | 6F94879bDAfE5a6  | Roy        | Berry      | Murillo-Perry                   | Isabeloborough    | Antigua and Barbuda        | +1-539-402-0259        | (496)978-3968x58947   | beckycarr@hogan.com         | 2020-03-25        | http://www.lawrence.com/
  4 | 5cfe8B1FA46e5e3c | Linda      | Olsen      | Dominguez, Mcmillan and Donovan | Bensonview        | Dominican Republic         | 001-808-617-6467x12895 | +1-813-324-8756       | stanleyblackwell@benson.org | 2020-06-02        | http://www.good-lyons.com/
  5 | 053d585Ab6b3159  | Joanna     | Bender     | Martin, Lang and Andrade        | West Priscilla    | Slovakia (Slovak Republic) | 001-234-203-0635x76146 | 001-199-446-3860x3486 | colinalvarado@miles.net     | 2021-04-17        | https://goodwin-ingram.com/
(5 rows)
```

8. Add MCP server to Cursor settings and enable MCP tools:
Eg. json file:
```
{
    "mcpServers": {
        "postgres-server": {
            "command": "/Users/iamiller/GitHub/mcp-for-postgresql/.venv/bin/python",
            "args": [

                "/Users/iamiller/GitHub/mcp-for-postgresql/mcp-for-postgresql/mcp_postgresql_server.py"
            ],
            "description": "MCP server for local Postgres server that is integrated to Cursor"
        }
    }
}
```

9. You should see green indicator:
![](https://raw.githubusercontent.com/r3v5/mcp-for-postgresql/main/docs/mcp-tools.png)

10. Open your AI Agent in Cursor and choose GPT-5 or other model you wish and ask any questions that relate to your PostgreSQL server knowledge base:
- Example 1:
![](https://raw.githubusercontent.com/r3v5/mcp-for-postgresql/main/docs/prompt1.png)

- Example 2:
![](https://raw.githubusercontent.com/r3v5/mcp-for-postgresql/main/docs/prompt2.png)

- Example 3:
![](https://raw.githubusercontent.com/r3v5/mcp-for-postgresql/main/docs/prompt3.png)

All the outputs from LLM are correct, you can check it looking inside your database!

**Happy hacking! MCP is doing everything.** 
