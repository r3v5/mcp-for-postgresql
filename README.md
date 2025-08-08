# mcp-for-postgresql

## MCP server for local PostgreSQL server:
1. Allows AI agent powered by GPT-5 LLM to query local databases that run on local PostgreSQL server
2. Integrated to Cursor

## Architecture

![](https://raw.githubusercontent.com/r3v5/mcp-for-postgresql/main/docs/mcp-for-postgres-architecture.png)

Here’s how it works step by step:
1. You send a request to the LLM in your host application (e.g., “”).
2. The LLM (client) processes your text and checks whether an MCP tool is available for that request.
3. If a relevant tool is configured, the MCP client forwards the request over the MCP protocol to an MCP server.
4. The MCP server performs the requested task:
    - It will query a local data source - your PostreSQL database.
5. The server returns the results to the MCP client, which hands them back to the LLM.
6. The LLM then formats those results and presents them to you in the host application (in our case - Cursor).
