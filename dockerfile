# Build
# 1. Node.js 기반 이미지 사용
FROM node:20-alpine AS build


# 2. 작업 디렉토리 설정
WORKDIR /app

# 3. 루트 의존성 (/app/package.json, yarn.lock)
COPY package*.json yarn.lock tsconfig.json ./

# 4. /app/packages/serviceA 폴더 생성
RUN mkdir -p packages/serviceA

# 5. /app/packages/serviceA 에 packages/serviceA/ 내용 복사
COPY packages/serviceA/. ./packages/serviceA/

# 6. service A로 이동해서 의존성 설치
RUN yarn workspace serviceA install

# 7. 배포 서비스 빌드
RUN yarn build-serviceA



# 실행 단계
# 1. Node.js 기반 이미지 사용
FROM node:20-alpine

# 2. 작업 디렉토리 설정
WORKDIR /app

# 3. 루트 의존성 (/app/package.json, yarn.lock)
COPY package*.json yarn.lock tsconfig.json ./

# 4. /app/packages/serviceA 폴더 생성
RUN mkdir -p packages/serviceA

# 5. 위에서 빌드한 파일만 복사
COPY --from=build app/packages/serviceA/dist/. ./packages/serviceA/dist

# 6. /app/packages/serviceA/package.json 복사
COPY packages/serviceA/package.json ./packages/serviceA

# 7. service A로 이동해서 dev 제외 
RUN yarn workspace serviceA install --production

# 8. 서비스 포트 노출
EXPOSE 3000

# 9. 서비스 시작 명령어
CMD ["yarn", "start-serviceA"]
