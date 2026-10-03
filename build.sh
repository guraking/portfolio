#!/usr/bin/env sh
# index·map 원본(claude.ai 아티팩트용이라 문서 뼈대가 없다)으로 GitHub Pages 용 docs/ 를 만든다.
#  - 문서 뼈대(doctype, 한국어, UTF-8, 모바일 뷰포트)를 앞에 붙인다.
#  - index 의 "경력 지도" 링크를 claude.ai 아티팩트 주소에서 같은 사이트의 map.html 로 바꾼다.
#  - 예전 주소 portfolio02.html 은 index.html 로 넘긴다. 이미 나간 링크가 끊기지 않게 하기 위해서다.
# 원본을 고친 뒤 이 스크립트를 다시 돌리고 docs/ 를 커밋하면 배포된다.
set -e
cd "$(dirname "$0")"
MAP_URL='https://claude.ai/artifact/Edd43x8cYiTEPVhV6hmg9B'
mkdir -p docs
for f in index.html map.html; do
  {
    printf '<!doctype html>\n<html lang="ko">\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1">\n'
    sed "s#$MAP_URL#map.html#g" "$f"
  } > "docs/$f"
done
cat > docs/portfolio02.html <<'HTML'
<!doctype html>
<html lang="ko">
<meta charset="utf-8">
<meta http-equiv="refresh" content="0; url=index.html">
<title>이정민 포트폴리오</title>
<a href="index.html">이정민 포트폴리오로 이동</a>
HTML
echo "built: docs/index.html docs/map.html docs/portfolio02.html"
