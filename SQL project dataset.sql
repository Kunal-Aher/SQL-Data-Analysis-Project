use sql_Project;
select * from dataset1 ,dataset2;
-- total number of rows in both datasets 
select count(*) as Total_count from dataset1;
select count(*) as Total_count from dataset2;

-- display the record for jharkhand and bihar
-- select * from dataset1 where State="Jharkhand" and State="Bihar";

select * from dataset1 where state in ("Jharkhand","Bihar");

-- calculate population of india fron dataset 2
select sum(population) as Total_Population from dataset2;

select Population from dataset2;

-- complex
-- display avg growth of india 
select * from dataset1; 

select avg(Growth)*100 as IN_AVG_Growth from dataset1;

-- display avg growyh of states  
select state, avg(Growth)*100 as IN_AVG_Growth from dataset1 group by State;

--  avg sex ratio
select state, round(avg(sex_ratio),0)as avg_sex_ratio from dataset1 group by state order by avg_sex_ratio  Desc;

select state, round(avg(Literacy),0)as avg_Literacy from dataset1 
group by state having avg_Literacy > 50 
order by avg_Literacy Desc ;

-- Display top 3 states
select state,avg(Growth)*100 as avg_Growth from dataset1 
group by state 
order by avg_Growth Desc 
limit 3;

-- select top 3 state,avg(Growth)*100 as avg_Growth from dataset1 group by state;-- sql server query

-- bottom 3 states lowest sex ratio

select state,avg(Sex_Ratio) as lowest_sex_ratio from dataset1 
group by state 
order by lowest_sex_ratio asc 
limit 3;

-- select state, round(avg(sex_ratio),0)as avg_sex_ratio from dataset1 group by state order by avg_sex_ratio asc limit 3;

-- display top and bottom 3 state in litracy rate of state ,creating thempory table 
-- sql server command 
create table topstates(
state varchar(255),
topstates float
);
-- drop table topstates;

insert into topstates
select state,round(avg(Literacy),0) as AVG_Literacy from dataset1 group by state order by AVG_Literacy Desc limit 3;

select * from topstates;

create table bottomstates(
state varchar(255),
bottomstates float
); 

insert into bottomstates
select state,round(avg(Literacy),0) as AVG_Literacy2 from dataset1 group by state order by AVG_Literacy2 asc limit 3;

-- top and bottom 3 state with avg litracy rates
select * from (
select * from bottomstates)as x
union
select * from (
select * from topstates) as Y;
-- simple way to find top and bottom 3 states
select * from (
select state,round(avg(Literacy),0) as AVG_Literacy from dataset1 group by state order by AVG_Literacy Desc limit 3) as a
union
select * from (
select state,round(avg(Literacy),0) as AVG_Literacy2 from dataset1 group by state order by AVG_Literacy2 asc limit 3) as b;

-- display thr states record which starts with a
select distinct state from dataset1 where lower(state) like "a%" or lower(state) like "b%";

-- display thr states record which starts with a and end with d
select distinct state from dataset1 where lower(state) like "a % d";
select distinct state from dataset1 where upper(state) like "a%" or upper(state) like "%d";

select distinct state from dataset1 where upper(state) like "a%" and upper(state) like "%m";

-- ----------------------------------------------------------------
-- sql project part 2
-- join
-- Display number of males and females in dataset
-- female/males=sex_ratio..........................1

-- female + males = population.......................2

-- females= population - males......................3
-- (population - males)=(sex_ratio)*males

-- population=males(sex_ratio+1)

-- males = population/(sex_ratio+1)...........males

-- females = population-population/(sex_ratio+1).........females

-- =population(1-1/(Sex_ratio+1)
-- females=population*(sex_ratio)/(Sex_ratio+1)
-- ------------------------------------------------------------------------------ 
select * from dataset1,dataset2; 
-- joining both tables
-- inner join
select d.state, d.District,sum(d.male) as Total_males,sum(d.female) as Total_female from
(select c.District,c.state,round(c.population*(Sex_Ratio+1),0) as male,round((c.population*c.Sex_Ratio)/(c.Sex_Ratio+1),0) as female from 
(select a.District,a.state, a.Sex_Ratio/100   0 as Sex_Ratio, b.population from dataset1 as a inner join dataset2 as b on a.District=b.District) as c) as d group by d.state,d.District;

-- left join
select d.state,d.District,sum(d.male) as Total_male,sum(d.female) as Total_female from 
(select c.state,c.District,round(c.population*(Sex_Ratio+1),0) as male,round((c.population*c.Sex_Ratio)/(c.Sex_Ratio+1),0) as female from
(select a.District,a.State,a.Sex_Ratio/1000 as Sex_Ratio,b.population from dataset1 as a left join dataset2 as b on a.District=b.District) as c) as d group by d.state,d.District;


--  'Coimbatore' district sex_ratio and population
select a.District,a.state,a.Sex_Ratio,b.population from dataset1 as a inner join dataset2 as b on a.District=b.District where b.District="Coimbatore";


-- diaplay the litracy ratio and total litrate and illitarate people
select d.state,sum(litarate_people) as Total_litarate ,sum(illitarate_people) as Total_illitarate from
(select c.State ,c.District,round(c.population*c.literacy_ratio,0) as litarate_people,
round((1-c.literacy_ratio)*c.population,0) as illitarate_people from 
(select a.State,a.District,a.Literacy/100 as literacy_ratio ,b.population from 
dataset1 as a inner join dataset2 as b on a.District=b.District order by literacy_ratio desc) as c) as d group by d.state;

-- --------------------------
-- dispaly population in previous census with growth rate
select sum(k.total_previous_cesus_population),sum(k.Total_current_census_population) from
(select y.State,sum(y.previous_cesus_population) as total_previous_cesus_population,
sum(y.current_census_population) as Total_current_census_population from
(select z.District,z.state,round(z.population/(1+z.growth),0) as previous_cesus_population,
z.population as current_census_population from
(select a.District,a.state,a.Growth as Growth,b.Population from dataset1 
as a inner join 
dataset2 as b on a.District=b.District) as z) as y group by y.State) as k; 



