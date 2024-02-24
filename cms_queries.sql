-- PART 1 
WITH contract_summary AS 
(
SELECT 
    PROVNUM,
    PROVNAME,
    ROUND(
        (SUM(Hrs_RN_ctr + Hrs_LPN_ctr + Hrs_CNA_ctr))::numeric / 
        (SUM(Hrs_RN + Hrs_LPN + Hrs_CNA))::numeric * 100, 2
    ) AS Prcnt_Hrs_ctr
FROM 
    pbj_data
GROUP BY 
    1, 2
ORDER BY 3 DESC
)

--SELECT * FROM contract_summary
-- PART 2 

,

provider_info_extended AS
(SELECT 
    cs.*,
    pi."Average Number of Residents per Day",
    pi."Reported RN Staffing Hours per Resident per Day"
FROM 
    contract_summary cs
LEFT JOIN 
    provider_info_ed pi ON cs.provnum = pi."CMS Certification Number (CCN)"
ORDER BY prcnt_hrs_ctr DESC)

--SELECT * FROM provider_info_extended
, 

--- part 3.1  
pct_rn_ctr_hrs AS
(
SELECT
    pi."Overall Rating",
	ROUND(
        (SUM(pbj.Hrs_RN_ctr))::numeric / 
        (SUM(pbj.Hrs_RN))::numeric * 100, 2
    ) AS "% RN Hours worked by Contractor"
FROM
    pbj_data AS pbj
LEFT JOIN
    provider_info_ed pi ON pbj.provnum = pi."CMS Certification Number (CCN)"
WHERE
    pi."Overall Rating" IS NOT NULL
GROUP BY
    1
ORDER BY
    1 ASC
)
,

--SELECT * FROM pct_rn_ctr_hrs
--DROP TABLE IF EXISTS cms_provider_data;

--- part 3.2
ri_cna_hrs_by_aff_entity AS
(
SELECT
	pi."Affiliated Entity Name" AS "Affiliated Entity",
	SUM(pbj.Hrs_CNA_ctr::numeric) AS CNA_ctr_hrs
FROM
    pbj_data AS pbj
LEFT JOIN
    provider_info_ed pi ON pbj.provnum = pi."CMS Certification Number (CCN)"
WHERE
    pi."Affiliated Entity Name" IS NOT NULL
	AND
	pi."State" = 'RI'
GROUP BY
    1
ORDER BY
    2 DESC
)

SELECT * FROM ri_cna_hrs_by_aff_entity;