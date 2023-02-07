## RDBMS를 활용한 데이터 관리 체계 구축

### 프로젝트 개요
- 목적: **통합적인 데이터 관리를 위한 데이터 환경 구축**
- 기간: 2020. 3 ~ 2020. 12(10개월)
- 역할: 데이터베이스 구조 기획, 데이터 전처리 및 데이터 마트 구축, 대시보드 제작, 머신러닝 모형 구축
- 핵심 성과: **데이터 관리 체계 구축으로 데이터 접근성 70% 향상**
- Skills: Python(lightgbm, sklearn, mlxtend, numpy, pandas, pymysql, matplotlib, seaborn 등), MySQL

### 추진 배경
광고 회사 근무 당시, 마케팅팀에서 **각자 파일 형태로 광고 집행 데이터를 보유하고 있어 통합적인 데이터 관리가 어려웠습니다.** 이로 인해 데이터 취합을 위해 각 담당자에게 데이터를 요청하는 과정에서 1시간 이상의 시간이 소요되고, 담당자의 퇴사나 컴퓨터 포맷 등의 이유로 데이터 유실이 발생했습니다. 그래서 개발팀과 논의한 결과, API를 통해 데이터베이스 구축이 가능하다는 것을 확인하였습니다.

### 진행 과정
데이터 관리 체계 구축을 위해 **광고 플랫폼별 API를 통해 데이터를 수집하고 RDBMS 기반의 데이터베이스를 구축**하여 데이터 유실을 방지했습니다. API를 제공하지 않는 매체의 경우에는 담당자가 보유한 엑셀 파일을 데이터베이스에 직접 입력했습니다. 수집한 데이터는 매체마다 형식이나 구조가 다르기 때문에 데이터 매핑 및 전처리를 통해 데이터 마트를 구축했습니다. 이를 기반으로 사내 전산망에 광고 캠페인 대시보드를 구축하였으며, 대시보드의 데이터를 추출할 수 있는 기능을 제공했습니다.

- 데이터 수집: (API) 광고 플랫폼별 캠페인 집행 데이터 / (수동) API가 지원되지 않는 매체는 엑셀 파일 import
- 데이터 전처리: 광고 매체별 데이터 매핑, 데이터 마트 구축
- 변수 설정: (독립) 광고비, 월, 요일, 브랜드, 광고주, 업종, 광고 상품 / (종속) CTR
- 분석 모형: Light GBM
- 시각화: 광고 캠페인 대시보드 구축

### 결론
결과적으로 개발자가 아닌 비개발자도 데이터에 쉽게 접근할 수 있게 되어, **회사 구성원의 데이터 접근성이 70% 향상**되었습니다. 또한 수집된 데이터를 기반으로 광고 시뮬레이션 모형을 구축하여, 업무 시간을 주당 30시간 이상 단축시킬 수 있었습니다.

### 파일 링크
[#1. SQL을 활용한 데이터마트 구축](https://github.com/hyewon0403/searching-for-advertising-campaigns/blob/master/mainAdStatDaily_naver.sql)\
[#2. lightgbm을 활용한 광고 시뮬레이션 모형 구축](https://github.com/hyewon0403/searching-for-advertising-campaigns/blob/master/AI_marketer_forecasting_features_cpm.ipynb)\
[#3. mlxtend를 활용한 연관 광고 상품 모형 구축](https://github.com/hyewon0403/searching-for-advertising-campaigns/blob/master/associated_ad_product.ipynb)\
[#4. 광고 캠페인 대시보드 및 시뮬레이션 소개서](https://github.com/hyewon0403/searching-for-advertising-campaigns/blob/master/CPMS%20%EC%A0%9C%EC%95%88%EB%8F%84%EA%B5%AC%20%EC%86%8C%EA%B0%9C%EC%84%9C.pdf)
