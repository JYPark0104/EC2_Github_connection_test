#!/bin/bash

# 1. 환경 설정
WATCH_DIR="./"           # 감시할 디렉토리 (현재 폴더)
BRANCH="main"            # 푸시할 브랜치

echo "🚀 [실시간 동기화 시작] $WATCH_DIR 폴더의 변경사항을 감시합니다..."

# 2. 파일 변경 감시 시작 (.git 폴더와 sync.log는 제외)
inotifywait -m -r -e modify,create,delete,move --exclude '(\.git|sync\.log)' "$WATCH_DIR" | while read path action file; do
    
    # 현재 시간 측정 (로그 출력용)
    NOW=$(date +'%Y-%m-%d %H:%M:%S')
    
    echo "✨ 변경 감지: $file ($action) [$NOW] - GitHub로 푸시 중..."
    
    # 3. Git 명령어 실행
    git add .
    # 커밋 메시지에도 시간 포함
    git commit -m "Auto-sync: $file $action at $NOW"
    
    # 푸시 실행
    if git push origin $BRANCH; then
        # 푸시 성공 시 완료 시간과 함께 출력
        COMPLETE_TIME=$(date +'%Y-%m-%d %H:%M:%S')
        echo "✅ 푸시 완료! (완료 일시: $COMPLETE_TIME\n)"
        echo "--------------------------------------------------"
    else
        echo "❌ 푸시 실패! 네트워크나 권한을 확인하세요."
    fi

done