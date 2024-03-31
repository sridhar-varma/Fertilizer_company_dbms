# Fertilizer_company_dbms
Database Schema for Multinational Agro_Chemical_Manufacturing Company.
Sure, let's add cardinality descriptions and participation constraints to the relationships:

Entities:
1. **Chemicals Category:**
   - Attributes: id (Primary Key), category, regulation

2. **Agro-Chemicals:**
   - Attributes: id (Primary Key), name, cost_per_unit
   - Relationships:
     - Belongs to Chemicals Category (Foreign Key: category_id)
     - Cardinality: Many-to-One (Many Agro-Chemicals can belong to one Chemicals Category)
     - Participation Constraint: Agro-Chemicals must belong to a Chemicals Category.

3. **Bill Category:**
   - Attributes: id (Primary Key), category

4. **Factories:**
   - Attributes: id (Primary Key), location, revenue

5. **Bills:**
   - Attributes: bill_id (Primary Key), date, cost, factory_id, category_id, status, paid_date
   - Relationships:
     - Belongs to Factory (Foreign Key: factory_id)
     - Belongs to Bill Category (Foreign Key: category_id)
     - Cardinality: Many-to-One (Many Bills can belong to one Factory and one Bill Category)
     - Participation Constraint: All Bills must belong to a Factory and a Bill Category.

6. **Customers:**
   - Attributes: id (Primary Key), name, total_amount_bought

7. **Dealer:**
   - Attributes: id (Primary Key), name, reach

8. **Outlets:**
   - Attributes: id (Primary Key), location, owner, sales_revenue
   - Relationships:
     - Belongs to Dealer (Foreign Key: dealer_id)
     - Cardinality: Many-to-One (Many Outlets can belong to one Dealer)
     - Participation Constraint: All Outlets must belong to a Dealer.

9. **Bought:**
   - Attributes: customer_id, outlet_id, chemical_id
   - Relationships:
     - Bought by Customer (Foreign Key: customer_id)
     - Bought from Outlet (Foreign Key: outlet_id)
     - Bought Chemical (Foreign Key: chemical_id)
     - Cardinality: Many-to-Many (Many Customers can buy from many Outlets, buying many Chemicals)
     - Participation Constraint: All Bought records must involve a Customer, Outlet, and Chemical.

10. **Departments:**
    - Attributes: dept_id (Primary Key), dept_name

11. **Employees:**
    - Attributes: id (Primary Key), name, salary, age, role, dept_id, fact_id, location
    - Relationships:
      - Belongs to Department (Foreign Key: dept_id)
      - Works at Factory (Foreign Key: fact_id)
      - Cardinality: Many-to-One (Many Employees can belong to one Department and work at one Factory)
      - Participation Constraint: All Employees must belong to a Department and work at a Factory.

12. **Manufacture:**
    - Attributes: factory_id, chemical_id
    - Relationships:
      - Factory Manufactures Chemical (Foreign Keys: factory_id, chemical_id)
      - Cardinality: Many-to-Many (Many Factories can manufacture many Chemicals)
      - Participation Constraint: All Manufacture records must involve a Factory and a Chemical.

13. **Sales:**
    - Attributes: sale_id (Primary Key), date, cost, factory_id, status, receive_date, dealer_id
    - Relationships:
      - Sale made by Factory (Foreign Key: factory_id)
      - Sale managed by Dealer (Foreign Key: dealer_id)
      - Cardinality: Many-to-One (Many Sales can be made by one Factory and managed by one Dealer)
      - Participation Constraint: All Sales must be made by a Factory and managed by a Dealer.

14. **Sale Description:**
    - Attributes: sale_id, chemical_id
    - Relationships:
      - Describes Sale (Foreign Key: sale_id)
      - Describes Chemical (Foreign Key: chemical_id)
      - Cardinality: Many-to-Many (Many Sales can describe many Chemicals)
      - Participation Constraint: All Sale Descriptions must involve a Sale and a Chemical.

These cardinality descriptions and participation constraints provide clarity on the relationships between entities and ensure that data is accurately represented and maintained within the database.
