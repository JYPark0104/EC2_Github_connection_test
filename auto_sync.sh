#!/bin/bash

# 설정을 프로젝트에 맞게 수정하세요
WATCH_DIR="./"           # 감시할 디렉토리 (현재 폴더)
BRANCH="main"      # 실시간 동기화용 별도 브랜치 권장

echo "🚀 [실시간 동기화 시작] $WATCH_DIR 폴더의 변경사항을 감시합니다..."

# 파일 변경(수정, 생성, 삭제, 이동)이 감지될 때까지 대기
inotifywait -m -r -e modify,create,delete,move --exclude '\.git' "$WATCH_DIR" | while read path action file; do
    echo "✨ 변경 감지: $file ($action) - GitHub로 푸시 중..."
    
    # Git 명령어 실행
    git add .
    git commit -m "Auto-sync: $file $action at $(date +'%Y-%m-%d %H:%M:%S')"
    git push origin $BRANCH
    
    echo "✅ 푸시 완료!"
done
