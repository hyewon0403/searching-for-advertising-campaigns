#INSERT INTO mainAdStatDaily
SELECT DISTINCT t8.reportName, t8.mediaId, t9.cmSlotId, t8.campaignId, t8.adGroupId, t9.statDate2, t9.amtExecution, t9.impressionCnt, t9.clickCnt, t9.viewCnt, t9.cmBrandName, t9.cmCompanyName, t9.cmBusinesstypeName, t9.cmCategoryName, 
		t9.cmBrandId, t9.cmCompanyId, t9.cmBusinessTypeId, t9.cmCategoryId FROM datacenterdb.campaignInfo t8
LEFT OUTER JOIN(
		SELECT t5.statDate2, t5.campaignId, t5.adGroupId, t5.amtExecution, t5.impressionCnt, t5.clickCnt, t5.viewCnt, t6.cmBrandName, t6.cmCompanyName, t6.cmBusinessTypeName, t6.cmCategoryName, 
				t6.cmBrandId, t6.cmCompanyId, t6.cmBusinessTypeId, t6.cmCategoryId, t7.cmSlotName, t7.cmSlotId
		FROM (
				SELECT CAST(CAST(CAST(statDate as int)as char(8))as DATE) AS statDate2, t1.campaignId, adGroupId, adGroupName, adGroupTypeName, 
						SUM(amtExecution) AS amtExecution, SUM(impressionCnt) AS impressionCnt, SUM(clickCnt) AS clickCnt, SUM(viewCnt) AS viewCnt,
						advertiser, brand, businessMain, businessSub
				FROM naverNospAdStatDaily AS t1, naverNospCampaign AS t2 WHERE t1.campaignId = t2.campaignId AND t1.statDate BETWEEN "20190101" and "20190930"
				GROUP BY statDate2, t1.campaignId, adGroupId
				UNION
				SELECT CAST(CAST(CAST(statDate as int)as char(8))as DATE) AS statDate2, t3.campaignId, adGroupId, adGroupName, adGroupTypeName, 
						SUM(amtExecution) AS amtExecution, SUM(impressionCnt) AS impressionCnt, SUM(clickCnt) AS clickCnt, SUM(viewCnt) AS viewCnt,
						advertiser, brand, businessMain, businessSub
				FROM CPMSDB.naverNospAdStatDaily AS t3, CPMSDB.naverNospCampaign AS t4 WHERE t3.campaignId = t4.campaignId AND t3.statDate >= "20191001"
				GROUP BY statDate2, t3.campaignId, adGroupId
				) AS t5
		LEFT OUTER JOIN naverNospBrand t6 ON (t5.brand = t6.brandName AND t5.advertiser = t6.advertiserName AND t5.businessMain = t6.businessMain AND t5.businessSub = t6.businessSub)
		LEFT OUTER JOIN naverNospSlot t7 ON (t5.adGroupName = t7.adGroupName AND t5.adGroupTypeName = t7.adGroupTypeName)
		WHERE cmSlotId IS NOT NULL) t9
ON (t8.campaignId = t9.campaignId AND t8.adGroupId = t9.adGroupId)
WHERE t8.mediaId = 28 AND t9.statDate2 IS NOT NULL  # 2018년도 집행이력 제외
		AND t9.statDate2 BETWEEN t8.startStatDate AND t8.endStatDate AND t8.reg_date > '2021-01-20' # 날짜 변경(업데이트 시작 일자)