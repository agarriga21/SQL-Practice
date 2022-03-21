SELECT 
   user 
FROM 
   mysql.user;
   
   SELECT current_user();
   
   SELECT 
    user, 
    host, 
    db, 
    command 
FROM 
    information_schema.processlist;
    
    SHOW PROCESSLIST;