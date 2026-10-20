# RenkuOS용 MacBook FnKey

[English](README.md) · [한국어](README.ko.md) · [日本語](README.ja.md)

2010년형 MacBook7,1의 내장 ANSI 키보드(USB 05ac:0236)용 기능 키입니다.
F1~F12에 밝기·작업공간·미디어·볼륨을 배치하고, Fn + F1~F12는 일반 기능 키로
동작합니다. 밝기는 MCP89 네이티브 백라이트 드라이버를 쓰므로 nouveau가
필요 없습니다. 그래픽 가속 드라이버는 아닙니다.

## 설치

```sh
pkgman add-repo https://pkgman.rainygirl.com/x86_64
pkgman refresh
pkgman install macbook_fnkey
```

설치 후 재부팅하세요. 저장소가 이미 등록돼 있다면 `add-repo`는 생략합니다.
Haiku 패키지 이름은 하이픈을 허용하지 않아 설치 이름은 `macbook_fnkey`입니다.

x86_64 RenkuOS `r1~beta6_hrev60072_269_dirty` 전용입니다. 다른 시스템 빌드는
그에 맞는 바이너리가 필요합니다. ISO/JIS 키보드와 다른 Mac 모델은 지원하지
않습니다.

이전에 `~/config/non-packaged`에 수동 테스트 바이너리를 넣어두셨다면 그 파일이
패키지보다 우선합니다. 설치 전에 해당 테스트 파일만 옮기세요. [migration.md]
(migration.md)를 참고하세요. 처음 설치하는 경우에는 필요 없습니다.

## 제거

```sh
pkgman uninstall macbook_fnkey
```

제거 후 재부팅하세요. 제거하면 패키지 기본 드라이버로 돌아갑니다. 설치와 제거
모두 자동으로 재부팅하지는 않습니다.

## 라이선스

MIT, [LICENSE](LICENSE) 참고. 기존 Haiku 저작권 표기는 그대로 유지합니다.

## AI 사용 고지

MacBook FnKey의 일부는 AI 코딩 도구(OpenAI Codex)의 도움을 받아 개발했습니다.
모든 코드는 작성자가 검토하고 테스트했습니다.
