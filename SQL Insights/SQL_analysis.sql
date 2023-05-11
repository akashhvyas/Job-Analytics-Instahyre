create database akash_db;

use akash_db;

#Q1. Which location has the most job openings?

select location, count( distinct job_id) as ct
from jobs
group by location
order by ct desc
limit 10;

#Q2. What are the most common skills required by companies?

select skills, count(skills) as ct
from company
group by skills
order by ct desc
limit 10;

#Q3A. Which company has the highest number of job openings?

select company, count(distinct job_id) as ct
from company
group by company
order by ct desc
limit 10;

#Q3B. Which companies have the most job openings in a particular location?

select company, count(distinct a.job_id) as ct
from company as a join jobs as b
on a.company_id = b.company_id
where location = "delhi"
group by company
order by ct desc
limit 10;

#Q4. How many job openings are available in a particular location?

select location, count(job_id) as ct
from jobs
where location = "Delhi"
group by location;

#Q5. Available jobs with HR name in Bangalore?

select job_title , hr
from jobs as a join company as b
on a.job_id = b.job_id
where location = "Bangalore"

#Q6. What is the average number of job openings per company?

select round(count(job_id)/count(distinct company_id),2) as avg_jobs_per_company
from jobs;

#Q7. What are the job openings by particular skills?

select distinct job_title, location
from jobs as a join company as b
on a.company_id = b.company_id
where skills = 'python' & skills = 'sql';

#Q8. Which job titles require the most common skills?

select distinct job_title 
from jobs as a join company as b
on a.company_id = b.company_id
where skills in ('Java','Python','JavaScript','React.js','AWS','Angular','Node.js','Sales','SQL','HTML')

#Q9. What is the distribution of job openings by HR representative?

select hr, count(distinct job_id) as ct
from jobs
group by hr
order by ct desc
limit 10;

#Q10. Which job titles have the most job openings?

select job_title , count(distinct job_id) as ct
from jobs
group by job_title
order by ct desc
limit 10;