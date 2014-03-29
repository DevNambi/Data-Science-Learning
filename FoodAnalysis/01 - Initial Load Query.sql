use FoodAnalysis
go

CREATE TABLE RawFoodInfo
(RecipeURL varchar(8000) null
,Category varchar(8000) null
,Value varchar(8000) null
,Detail varchar(8000) null
)
go

truncate table RawFoodInfo
go

BULK INSERT RawFoodInfo
FROM 'D:\Transfer2\Food\FoodRecipeParsed.tsv'
WITH
(TABLOCK
,FIELDTERMINATOR='|'
,ROWTERMINATOR='\r\n'
)
-- DIDN'T WORK, FILE HAS 3 OR 4 COLUMNS
-- LOADED USING IMPORT/EXPORT WIZARD INSTEAD


select
	max(len(RecipeURL)) --130
	,sum(case when len(RecipeURL) < 1 then 1 else 0 end) --0
	,max(len(Category)) -- 13
	,sum(case when len(Category) < 1 then 1 else 0 end) --0
	,max(len(Value)) -- 121
	,sum(case when len(Value) < 1 then 1 else 0 end) --3455
	,max(len(Detail)) -- 179
	,sum(case when len(Detail) < 1 then 1 else 0 end) --353326
from dbo.RawFoodInfo
go


alter table dbo.RawFoodInfo
alter column RecipeURL varchar(130) 

alter table dbo.RawFoodInfo
alter column Category varchar(13) 

alter table dbo.RawFoodInfo
alter column Value varchar(130) 

alter table dbo.RawFoodInfo
alter column Detail varchar(180) 
go


-- Do some basic data cleanup
UPDATE RawFoodInfo
SET RecipeURL = ltrim(rtrim(RecipeURL))
,Category = ltrim(rtrim(Category))
,Value = ltrim(rtrim(Value))
,Detail = ltrim(rtrim(Detail))
go


CREATE TABLE dbo.Recipe
(RecipeURL varchar(180)
,Title varchar(180)
,Servings smallint
,PrepTimeInMin smallint
,CookTimeInMin smallint
,RatingCount int
,FiveRating int
,FourRating int
,ThreeRating int
,TwoRating int
,OneRating int
,constraint RecipePK primary key clustered (RecipeURL)
)
go

INSERT INTO Recipe
(RecipeURL)
SELECT DISTINCT RecipeURL
FROM dbo.RawFoodInfo

UPDATE r
SET r.Title = x.Value
FROM dbo.Recipe r
INNER JOIN
(
	SELECT RecipeURL
		,max(Value) as Value
	FROM dbo.RawFoodInfo
	WHERE Category = 'Title'
	GROUP BY RecipeURL
) as x
ON r.RecipeURL = x.RecipeURL
go

UPDATE r
SET r.PrepTimeInMin = x.Value
FROM dbo.Recipe r
INNER JOIN
(
	SELECT RecipeURL
		,max(ltrim(rtrim(replace(replace(Value,'min',''),'s','')))) as Value
	FROM dbo.RawFoodInfo
	WHERE Category = 'PrepTime'
	GROUP BY RecipeURL
) as x
ON r.RecipeURL = x.RecipeURL
go

UPDATE r
SET r.CookTimeInMin = x.Value
FROM dbo.Recipe r
INNER JOIN
(
	SELECT RecipeURL
		,max(ltrim(rtrim(replace(replace(Value,'min',''),'s','')))) as Value
	FROM dbo.RawFoodInfo
	WHERE Category = 'CookTime'
	GROUP BY RecipeURL
) as x
ON r.RecipeURL = x.RecipeURL
go



SELECT
	Value
	,SimpleAnswer = LTRIM(RTRIM(REPLACE(REPLACE(Value,'servings',''),'serving','')))
FROM dbo.RawFoodInfo
WHERE Category = 'Servings'

