## RDBMS를 활용한 데이터 관리 체계 구축

### 프로젝트 개요
- 목적: **데이터 환경 구축을 통한 회사 구성원의 데이터 활용도 향상**
- 기간: 2020. 3 ~ 2020. 12(10개월)
- 역할: 데이터베이스 구조 기획, 데이터 전처리 및 데이터 마트 구축, 대시보드 제작, 머신러닝 모형 구축
- Skills: Python(lightgbm, sklearn, mlxtend, numpy, pandas, pymysql, matplotlib, seaborn 등), MySQL

### 추진 배경
각 담당자가 엑셀 파일 형태로 광고 캠페인 집행 데이터를 보유하고 있었습니다.
그래서 컴퓨터 포맷이나 담당자 퇴사 등의 이유로 데이터가 유실되거나 이전 캠페인 이력을 확인할 때마다 각 담당자에게 데이터 요청을 해야하는 상황이었습니다.
이에 따라 통합적인 데이터 관리 체계가 필요하다고 판단되어 **RDBMS 기반 데이터베이스를 구축**하게 되었습니다.

### 진행 과정
API를 통해 매체별 광고 플랫폼에서 수집할 데이터를 선정하였고, 테이블 구조를 기획하여 개발팀과 함께 **RDBMS 데이터베이스를 구축**했습니다.
API가 제공되지 않는 매체는 엑셀 파일을 import하여 입력했습니다.
수집된 광고 데이터는 매체별로 변수의 형태나 구조가 상이하기 때문에, 기준 테이블을 작성하여 데이터 매핑을 진행했습니다.
이를 바탕으로 데이터 마트를 구축하였고, **광고 캠페인 현황 대시보드를 구축**하여 누구나 쉽게 데이터를 확인하고 추출할 수 있는 기능을 제공했습니다.
그 결과 **회사 구성원의 데이터 접근성을 70% 개선**할 수 있었습니다.
또한, 수집된 데이터를 바탕으로 광고 시뮬레이션 모형을 구축하여 예상 광고 효율 및 단가 등 객관적인 참고 지표를 제시했습니다.
이를 통해 업무 시간을 주당 30시간 이상 단축할 수 있었습니다.

- 데이터 수집: (API) 광고 플랫폼별 캠페인 집행 데이터 / (수동) API가 지원되지 않는 매체는 엑셀 파일 import
- 데이터 전처리: 광고 매체별 데이터 매핑, 데이터 마트 구축
- 변수 설정: (독립) 광고비, 시작 월, 시작 요일, 브랜드, 광고주, 업종, 광고 상품 / (종속) CTR
- 분석 모형: Light GBM
- 시각화: 광고 캠페인 현황 대시보드 구축

### 파일 링크
[#1. SQL을 활용한 데이터마트 구축](https://github.com/hyewon0403/searching-for-advertising-campaigns/blob/master/mainAdStatDaily_naver.sql)\
[#2. lightgbm을 활용한 광고 시뮬레이션 모형 구축](https://github.com/hyewon0403/searching-for-advertising-campaigns/blob/master/AI_marketer_forecasting_features_cpm.ipynb)\
[#3. mlxtend를 활용한 연관 광고 상품 모형 구축](https://github.com/hyewon0403/searching-for-advertising-campaigns/blob/master/associated_ad_product.ipynb)\
[#4. 광고 캠페인 대시보드 및 시뮬레이션 소개서](https://github.com/hyewon0403/searching-for-advertising-campaigns/blob/master/CPMS%20%EC%A0%9C%EC%95%88%EB%8F%84%EA%B5%AC%20%EC%86%8C%EA%B0%9C%EC%84%9C.pdf)
