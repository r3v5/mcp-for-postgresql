from mcp.server.fastmcp import FastMCP
import psycopg2
import asyncio

mcp = FastMCP("My Customers")


@mcp.tool()
async def get_customers():
    """Retrieve the customers from the my_customers PostgreSQL database."""
    # Connect to the PostgreSQL database
    conn = psycopg2.connect(database="my_customers")
    cursor = conn.cursor()
    
    # Execute the query to fetch customers
    cursor.execute("SELECT * FROM customers")
    results = cursor.fetchall()
    conn.close()
    
    # Format the results as a list of dictionaries
    customers = [{"id": id, "customer_id": customer_id, "first_name": first_name, "last_name": last_name, "company": company, "city": city, "country": country, "phone1": phone1, "phone2": phone2, "email": email, "subscription_date": subscription_date, "website": website} for id, customer_id, first_name, last_name, company, city, country, phone1, phone2, email, subscription_date, website in results]
    return customers

@mcp.tool()
async def get_all_databases():
    """Retrieve the list of all databases from the local PostgreSQL server."""
    # Connect to the PostgreSQL server
    conn = psycopg2.connect(database="postgres")
    cursor = conn.cursor()
    
    # Execute the query to fetch all databases
    cursor.execute("SELECT datname FROM pg_database")
    results = cursor.fetchall()
    conn.close()
    
    # Format the results as a list of dictionaries
    databases = [{"database": database} for database in results]
    return databases

if __name__ == '__main__':
    asyncio.run(mcp.run())
