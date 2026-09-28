#!/usr/bin/env sh
# portfolio01·02 원본(claude.ai 아티팩트용이라 문서 뼈대가 없다)으로 GitHub Pages 용 docs/ 를 만든다.
#  - 문서 뼈대(doctype, 한국어, UTF-8, 모바일 뷰포트)를 앞에 붙인다.
#  - 02 의 "경력 지도" 링크를 claude.ai 아티팩트 주소에서 같은 사이트의 portfolio01.html 로 바꾼다.
#  - 첫 화면 index.html 은 02 요약 페이지로 넘긴다.
# 원본을 고친 뒤 이 스크립트를 다시 돌리고 docs/ 를 커밋하면 배포된다.
set -e
cd "$(dirname "$0")"
MAP_URL='https://claude.ai/artifact/Edd43x8cYiTEPVhV6hmg9B'
mkdir -p docs
for f in portfolio01.html portfolio02.html; do
  {
    printf '<!doctype html>\n<html lang="ko">\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1">\n'
    sed "s#$MAP_URL#portfolio01.html#g" "$f"
  } > "docs/$f"
done
cat > docs/index.html <<'EOF'
<!doctype html>
<html lang="ko">
<meta charset="utf-8">
<meta http-equiv="refresh" content="0; url=portfolio02.html">
<title>이정민 포트폴리오</title>
<a href="portfolio02.html">이정민 포트폴리오로 이동</a>
EOF
echo "built: docs/index.html docs/portfolio01.html docs/portfolio02.html"
