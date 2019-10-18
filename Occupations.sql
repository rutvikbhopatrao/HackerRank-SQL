#   Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.
#   
#   Note: Print NULL when there are no more names corresponding to an occupation.
#   
#   Input Format
#   
#   The OCCUPATIONS table is described as follows:
#   
#   
#   
#   Occupation will only contain one of the following values: Doctor, Professor, Singer or Actor.
#   
#   Sample Input
#   
#   
#   
#   Sample Output
#   
#   Jenny    Ashley     Meera  Jane
#   Samantha Christeen  Priya  Julia
#   NULL     Ketty      NULL   Maria
#   Explanation
#   
#   The first column is an alphabetically ordered list of Doctor names.
#   The second column is an alphabetically ordered list of Professor names.
#   The third column is an alphabetically ordered list of Singer names.
#   The fourth column is an alphabetically ordered list of Actor names.
#   The empty cell data for columns with less than the maximum number of names per occupation (in this case, the Professor and Actor columns) are filled with NULL values.



SET @r1=0, @r2=0, @r3=0, @r4=0; 

SELECT Min(doctor), 
       Min(professor), 
       Min(singer), 
       Min(actor) 
FROM  (SELECT CASE 
                WHEN occupation = 'Doctor' THEN ( @r1 := @r1 + 1 ) 
                WHEN occupation = 'Professor' THEN ( @r2 := @r2 + 1 ) 
                WHEN occupation = 'Singer' THEN ( @r3 := @r3 + 1 ) 
                WHEN occupation = 'Actor' THEN ( @r4 := @r4 + 1 ) 
              end AS RowNumber, 
              CASE 
                WHEN occupation = 'Doctor' THEN name 
              end AS Doctor, 
              CASE 
                WHEN occupation = 'Professor' THEN name 
              end AS Professor, 
              CASE 
                WHEN occupation = 'Singer' THEN name 
              end AS Singer, 
              CASE 
                WHEN occupation = 'Actor' THEN name 
              end AS Actor 
       FROM   occupations 
       ORDER  BY name) Temp 
GROUP  BY rownumber; 
