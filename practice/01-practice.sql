--오답노트(#31~ )
--#32 데이터 모델링의 순서
-- 1. 데이터 모델링 시 정규화를 정확하게 수행함.
-- 2. 데이터 베이스 용량 산정을 수행함.
-- 3. 데이터 베이스 발생되는 트렌젝션의 유형을 파악함.
-- 4. 용량과 트렌젝션의 반정규화를 수행함
-- 5. 이력모델의 조정, pk/fk 조정, 슈퍼타입/서브 타입 조정함.

-- #36. 일자별 매각 물건 엔티티.
-- 답은 맞았지만 정확한 설명이 필요함.
-- i) 일자별 매각 물건은 매각 물건 번호, 매각 일자가 있음.
-- 스스로 생각한 답안:  일자별 매각 물건을 포함하지만 매각일자가 독립해서 나올 수 있음.
-- 해설 답안: 일자별 매각 물건의 주식별자 중 매각기일 엔터티가 독립하여
-- 매각기일과 일자별 매각 물건은 1:M 관계임.
-- 성능 향상: 특정 매각 장소의 매각 일자를 찾아 매각 내역을 조회 -> 매각 기일 & 매각일자별매각내역


--#37. 전제 조건
-- 선택 답안: 3번 / 정답: 4번
-- 1차 정규화 대상: 칼럼에 의해 반복된 속성값을 갖고 OR연산자로 연결되어 있다.
-- OR 연산자는 1개라도 인덱스에 정의되지 않으면 전체를 SCAN -> 수정, 삭제 , 입력 시 성능 저하

--#38. 정규화를 통한 성능 향상
-- 선택 답안: 3번 / 정답: 1번
-- 1차 정규화의 대상: 칼럼에 의한 반복된 속성값, 컬럼 단위, 로우 단위 중복
-- 단 컬럼 단위에서 중복 시 1:M 관계로 두 개의 엔터티로 분리됨.

--#41. 칼럼의 반정규화 기법
-- 반정규화 기법은 개발, 운영, 단순화를 위해 중복,통합,분리를 수행하는 작업.
-- 해당 칼럼들을 별도로 모아놓는 반정규화 기법 중 부분테이블 추가에 해당한다.


-- 칼럼에 대한 반정규화 기법
-- 중복 칼럼, 파생 칼럼, 이력 테이블 칼럼, PK 칼럼, 응용 시스템 오작동 칼럼 추가.
-- 1. 중복 칼럼은 거리가 먼 조인 감소를 위해 여러 테이블에 동일 칼럼 추가.
-- 2. 파생 칼럼은 미리 계산된 속성을 통해 성능 향상을 높임
-- 3. 이력테이블 칼럼 추가 -> 최신값 처리하여 기능성 칼럼을 추가한다.
-- 단 PK의 속성 추가는 데이터 모델링에서 관계 연결로 인한 현상이므로 주의한다!!


-- #43. 조회 향상을 높이는 반정규화 기법
-- 틀린 이유: 부적절한 것을 고름
-- 보기 4번: 제품 엔터티에 최근값 여부에 대한 칼럼을 추가하는 것은 반정규화와 무관하다.
-- 보기 3번: 1개 주문 내 제품 번호마다 동일한 합계 금액을 반복적으로 저장해야 하는 문제가 있음.


-- #45. 반정규화 대상 타 방법 처리
-- 로우체이닝
-- 저장 시 데이터 블록의 저장 공간이 부족해서 생기는 현상으로 조회 성능 저하
-- 해결 방법: 파티셔닝= (다수의 테이블로 분리하여 액세스 성능 향상, 데이터 관리 개선 방법)

-- 48.슈퍼 / 서브 타입 데이터 모델 변환 기술
-- 정답은 맞췄지만 잘 모름
--1. 트랜잭션은 항상 전체 대상으로 일괄 처리하면 데이터 집적으로 성능 향상됨.
--2. 개별 발생 트랜잭션은 하나의 테이블로 통합 시 다량 데이터 집적으로 성능 저하.
--3. 슈퍼+서브 타입 함께 처리시 개별 유지하면 조인에 의해 성능 저하됨.

-- #49. 테이블 조회 SQL 패턴
--SELECT 건수 , 금액
--FROM 현금출급기실적
--WHERE 거래일자 BETWEEN '20140701 AND '20140702'
--AND 사무소 코드 = '00368';
-- 해답 설명: 조회 시 상수 값 대입 조건 -> 범위 조회 유형 칼럼으로 하여 접근을 줄이는 것이 좋음

--#52. 분산 데이터 환경
-- 1.공통 코드, 기준 정보 등 마스터 데이터는 복제분산 적용
-- 2. 실시간 업무 특성 시 분산 데이터 베이스 구성함.
-- 3. 백업 사이트 구성.
-- 4. GSI 즉 통합 데이터 베이스 구조는 분산데이터베이스와 대조되는 개념이므로
-- -> 복제 분산 방법으로 분산 데이터 환경 구성해야 함.
-- : GSI, 실시간 업무, 백업 사이트 구성

