CREATE DEFINER = 'root'@'localhost'
PROCEDURE zxcp.prc_report(IN cid bigint)
BEGIN
   DECLARE a bigint; 
   DECLARE i bigint default 0;   
   DECLARE s int default 0;   
   DECLARE  c1 CURSOR   FOR SELECT problem FROM t_contest_problem WHERE contest=cid;
   DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET s=1;  
 
  DELETE FROM t_rank;
  INSERT INTO t_rank(userid,username)
  SELECT DISTINCT t4.id,t4.name FROM t_submission t1,t_contest_problem t2, t_contest t3,t_user t4
  WHERE t1.contest_problem=t2.id AND t3.id='1' AND t1.user=t4.id;

   OPEN c1;                      
    fetch  c1 into a; 
    while s <> 1 do  
     SET i=i+1;
    
      IF i=1 then
        UPDATE t_rank set num1=(SELECT if(MIN(spend) IS NULL ,0,MIN(spend)) FROM t_submission t1 WHERE t1.contest_problem=a AND t1.user=t_rank.userid AND t1.state='成功');
          
      end if; 
      IF i=2 then
          UPDATE t_rank set num2=(SELECT if(MIN(spend) IS NULL ,0,MIN(spend)) FROM t_submission t1 WHERE t1.contest_problem=a AND t1.user=t_rank.userid AND t1.state='成功');
      end if; 
       IF i=3 then
            UPDATE t_rank set num3=(SELECT if(MIN(spend) IS NULL ,0,MIN(spend)) FROM t_submission t1 WHERE t1.contest_problem=a AND t1.user=t_rank.userid AND t1.state='成功');
      end if; 
      IF i=4 then
           UPDATE t_rank set num4=(SELECT if(MIN(spend) IS NULL ,0,MIN(spend)) FROM t_submission t1 WHERE t1.contest_problem=a AND t1.user=t_rank.userid AND t1.state='成功');
      end if; 
      IF i=5 then
         UPDATE t_rank set num5=(SELECT if(MIN(spend) IS NULL ,0,MIN(spend)) FROM t_submission t1 WHERE t1.contest_problem=a AND t1.user=t_rank.userid AND t1.state='成功');
      end if; 
      IF i=6 then
         UPDATE t_rank set num6=(SELECT if(MIN(spend) IS NULL ,0,MIN(spend)) FROM t_submission t1 WHERE t1.contest_problem=a AND t1.user=t_rank.userid AND t1.state='成功');
      end if; 
      IF i=7 then
              UPDATE t_rank set num7=(SELECT if(MIN(spend) IS NULL ,0,MIN(spend)) FROM t_submission t1 WHERE t1.contest_problem=a AND t1.user=t_rank.userid AND t1.state='成功');
      end if; 
     fetch  c1 into a;                  
    end while;   
    
  CLOSE c1 ;  
END
