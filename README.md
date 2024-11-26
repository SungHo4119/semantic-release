# semantic-release
  - [git book](https://semantic-release.gitbook.io/semantic-release/usage/plugins)
  - [github](https://github.com/semantic-release/semantic-release)


# .releaserc
  - 커밋 메시지에 따라 버전 관리
  - 태그 배포
  - package.json 버전 동기화
  - release 배포
  - CHANGELOG.md 파일 작성 & 템플릿 수정
  
# 커밋 메시지
  - `type: 내용` 으로 작성
  - type 종류
    - 수정 내역에 표기 되는 타입
      - fix, feat, perf, refactor, docs, style, revert, ci, 
    - 수정 내역에 표기 되지 않는 타입
      - test, chore, move, remove

## 버전 증가 기준

## fix
fix: 버그 수정시 1.0.0 -> 1.0.1

## feat
feat: 기능 추가시 1.0.0 -> 1.1.0

## type 설명

### fix
  - 버그 수정
### feat
  - 새로운 기능 추가
### perf
  - 성능 향상
### refactor
  - 코드 리팩토링
### docs
  - 문서 수정
### style
  - 코드 포맷팅, 세미콜론 누락, 코드 변경이 없는 경우
### revert 
- 이전 커밋 되돌릴 때
### ci
  - CI 관련 설정 수정
### test
  - 테스트 코드 수정
### chore
  - 빌드 업무 수정, 패키지 매니저 수정
### move
  - 파일 혹은 코드 이동
### remove
  - 파일 혹은 코드 삭제