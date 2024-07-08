CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      SELECT distinct salary FROM (
          SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS ranking
          FROM Employee
      ) ranked_salaries
      WHERE ranking = N
  );
END;